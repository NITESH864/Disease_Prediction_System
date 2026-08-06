#!/bin/bash

# Heroku Deployment Script for Disease Prediction System
# This script automates the entire deployment process

set -e  # Exit on any error

echo "🚀 Disease Prediction System - Heroku Deployment Script"
echo "========================================================"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Step 1: Check if Heroku CLI is installed
echo "${YELLOW}[Step 1]${NC} Checking Heroku CLI installation..."
if ! command -v heroku &> /dev/null; then
    echo "${RED}❌ Heroku CLI is not installed!${NC}"
    echo "Install it from: https://devcenter.heroku.com/articles/heroku-cli"
    exit 1
fi
echo "${GREEN}✓ Heroku CLI found${NC}"
echo ""

# Step 2: Check if user is logged in to Heroku
echo "${YELLOW}[Step 2]${NC} Checking Heroku authentication..."
if ! heroku auth:whoami &> /dev/null; then
    echo "${RED}❌ Not logged into Heroku!${NC}"
    echo "Running: heroku login"
    heroku login
fi
echo "${GREEN}✓ Logged into Heroku${NC}"
HEROKU_EMAIL=$(heroku auth:whoami)
echo "User: $HEROKU_EMAIL"
echo ""

# Step 3: Get app name from user
echo "${YELLOW}[Step 3]${NC} Heroku App Configuration"
read -p "Enter your Heroku app name (or press Enter for auto-generated): " APP_NAME

if [ -z "$APP_NAME" ]; then
    echo "Creating app with auto-generated name..."
    APP_NAME=$(heroku create --json | jq -r '.name')
    echo "${GREEN}✓ Created app: $APP_NAME${NC}"
else
    echo "Checking if app '$APP_NAME' already exists..."
    if heroku apps:info "$APP_NAME" &> /dev/null; then
        echo "${GREEN}✓ Using existing app: $APP_NAME${NC}"
    else
        echo "Creating new app: $APP_NAME..."
        heroku create "$APP_NAME"
        echo "${GREEN}✓ Created app: $APP_NAME${NC}"
    fi
fi
echo ""

# Step 4: Generate or get SECRET_KEY
echo "${YELLOW}[Step 4]${NC} Setting up environment variables..."
echo "We need a SECRET_KEY for production security."
read -p "Do you have a SECRET_KEY? (y/n, default: n): " HAS_SECRET

if [[ "$HAS_SECRET" == "y" || "$HAS_SECRET" == "Y" ]]; then
    read -sp "Enter your SECRET_KEY: " SECRET_KEY
    echo ""
else
    echo "Generating a secure random SECRET_KEY..."
    SECRET_KEY=$(python3 -c 'import secrets; print(secrets.token_urlsafe(50))')
    echo "${GREEN}Generated SECRET_KEY: $SECRET_KEY${NC}"
fi
echo ""

# Step 5: Set Heroku config variables
echo "${YELLOW}[Step 5]${NC} Configuring Heroku app..."
echo "Setting environment variables..."
heroku config:set SECRET_KEY="$SECRET_KEY" --app="$APP_NAME"
heroku config:set DEBUG=False --app="$APP_NAME"
heroku config:set ALLOWED_HOSTS="$APP_NAME.herokuapp.com" --app="$APP_NAME"
echo "${GREEN}✓ Environment variables configured${NC}"
echo ""

# Step 6: Add Heroku remote and push code
echo "${YELLOW}[Step 6]${NC} Deploying code to Heroku..."
if git remote | grep -q heroku; then
    echo "Heroku remote already exists, updating..."
else
    echo "Adding Heroku remote..."
    heroku git:remote --app="$APP_NAME"
fi

echo "Pushing code to Heroku (this may take a few minutes)..."
git push heroku main
echo "${GREEN}✓ Code deployed${NC}"
echo ""

# Step 7: Run migrations
echo "${YELLOW}[Step 7]${NC} Running database migrations..."
heroku run python manage.py migrate --app="$APP_NAME"
echo "${GREEN}✓ Migrations completed${NC}"
echo ""

# Step 8: Collect static files (if needed)
echo "${YELLOW}[Step 8]${NC} Collecting static files..."
heroku run python manage.py collectstatic --noinput --app="$APP_NAME"
echo "${GREEN}✓ Static files collected${NC}"
echo ""

# Step 9: Check app status
echo "${YELLOW}[Step 9]${NC} Checking app status..."
heroku ps --app="$APP_NAME"
echo ""

# Success message
echo "========================================================"
echo "${GREEN}✅ Deployment Complete!${NC}"
echo "========================================================"
echo ""
echo "Your app is now live at:"
echo "${GREEN}https://$APP_NAME.herokuapp.com${NC}"
echo ""
echo "Useful commands:"
echo "  • View logs:        heroku logs --tail --app=$APP_NAME"
echo "  • Scale dynos:      heroku ps:scale web=1 --app=$APP_NAME"
echo "  • Run migrations:   heroku run python manage.py migrate --app=$APP_NAME"
echo "  • Open app:         heroku open --app=$APP_NAME"
echo "  • View config:      heroku config --app=$APP_NAME"
echo ""

# Step 10: Offer to open app
read -p "Open your app in browser now? (y/n): " OPEN_APP
if [[ "$OPEN_APP" == "y" || "$OPEN_APP" == "Y" ]]; then
    heroku open --app="$APP_NAME"
fi
