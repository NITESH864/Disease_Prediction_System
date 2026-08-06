# 🚀 Deploy to Render (FREE) - Step by Step Guide

Render is completely FREE and perfect for Django apps. Follow these commands exactly.

---

## **Step 1: Create a Render Account**

Go to: https://render.com

Click **"Sign Up"** and create a free account using:
- GitHub (easiest - just authorize)
- Email/Password

---

## **Step 2: Add render.yaml Configuration File**

This file tells Render how to deploy your app.

Create a new file named `render.yaml` in your project root with this content:

```yaml
services:
  - type: web
    name: disease-prediction-system
    env: python
    plan: free
    buildCommand: pip install -r requirements.txt && python manage.py collectstatic --noinput
    startCommand: gunicorn dpsite.wsgi:application
    envVars:
      - key: DEBUG
        value: "False"
      - key: SECRET_KEY
        generateValue: true
      - key: PYTHON_VERSION
        value: "3.11.9"
```

---

## **Step 3: Push Code to GitHub**

Make sure your code is pushed to GitHub:

```bash
git add .
git commit -m "Add Render deployment configuration"
git push origin main
```

---

## **Step 4: Connect GitHub to Render**

1. Go to: https://dashboard.render.com
2. Click **"New +"** → **"Web Service"**
3. Click **"Connect repository"**
4. Select your GitHub account (authorize if needed)
5. Search for and select: **Disease_Prediction_System**
6. Click **"Connect"**

---

## **Step 5: Configure the Web Service**

Fill in the form:

| Field | Value |
|-------|-------|
| **Name** | disease-prediction-system |
| **Environment** | Python 3 |
| **Build Command** | `pip install -r requirements.txt && python manage.py collectstatic --noinput` |
| **Start Command** | `gunicorn dpsite.wsgi:application` |
| **Plan** | Free |

---

## **Step 6: Add Environment Variables**

Click **"Advanced"** at the bottom, then **"Add Environment Variable"**

Add these variables:

### Variable 1: DEBUG
- **Key:** DEBUG
- **Value:** False

Click **"Add Environment Variable"**

### Variable 2: SECRET_KEY
- **Key:** SECRET_KEY
- **Value:** (Generate using Python)

To generate SECRET_KEY, run this in your terminal:
```bash
python3 -c "import secrets; print(secrets.token_urlsafe(50))"
```

Copy the output and paste it as the value.

Example value:
```
aB1cD2eF3gH4iJ5kL6mN7oP8qR9sT0uV1wX2yZ3aB4cD5eF6
```

Click **"Add Environment Variable"**

### Variable 3: ALLOWED_HOSTS
- **Key:** ALLOWED_HOSTS
- **Value:** disease-prediction-system.onrender.com

Click **"Add Environment Variable"**

---

## **Step 7: Click Deploy!**

Click the blue **"Deploy Web Service"** button at the bottom.

Render will now:
- Clone your GitHub repo
- Install dependencies
- Collect static files
- Start your app

This takes 2-5 minutes. You'll see a live log of the deployment.

---

## **Step 8: Wait for Success**

You'll see a message like:
```
=== Web Service successfully deployed ===
```

Your app URL will be shown at the top:
```
https://disease-prediction-system.onrender.com
```

---

## **Step 9: Visit Your Live App!**

Open your browser and go to:
```
https://disease-prediction-system.onrender.com
```

🎉 **Your app is now LIVE and FREE!**

---

## **⚠️ Important Notes about FREE Plan:**

1. **Auto-sleep**: Your app sleeps after 15 minutes of inactivity
   - First request takes 30 seconds to wake up (cold start)
   - Solution: Add a cron job to ping it every 10 minutes

2. **Limited Resources**: 
   - Shared CPU
   - 512 MB RAM
   - Good enough for testing/learning

3. **Disk Space**: Limited (5GB)

---

## **Optional: Keep App Awake (Stop Auto-Sleep)**

Use a free service like UptimeRobot to ping your app every 10 minutes:

1. Go to: https://uptimerobot.com
2. Sign up for free
3. Click **"Add New Monitor"**
4. Select **HTTP(S)**
5. Enter your app URL: `https://disease-prediction-system.onrender.com`
6. Set interval to 10 minutes
7. Click **"Create Monitor"**

Now your app will stay awake! 🚀

---

## **Useful Render Commands**

### View Logs:
In Render Dashboard → Your Service → **"Logs"** tab

### Redeploy:
Click **"Manual Deploy"** → **"Deploy latest commit"**

### Update Environment Variables:
1. Click **"Environment"** in sidebar
2. Edit any variable
3. Click **"Save"**
4. App redeploys automatically

### View Live App:
Click the URL at the top of the service page

---

## **Quick Copy-Paste Summary:**

```bash
# Step 1: Generate SECRET_KEY
python3 -c "import secrets; print(secrets.token_urlsafe(50))"

# Step 2: Push to GitHub
git add .
git commit -m "Add Render deployment configuration"
git push origin main

# Step 3: Go to Render Dashboard
# https://dashboard.render.com

# Then follow the UI steps above!
```

---

## **Troubleshooting**

### Deployment Failed?
1. Check the **Logs** tab in Render
2. Common issues:
   - Missing `requirements.txt` → Already included ✓
   - Wrong settings module → Already configured ✓
   - Missing environment variables → Check Step 6

### App shows 502 error?
1. Check Render logs for the error
2. Most common: SECRET_KEY not set
   - Go to **Environment** → Add SECRET_KEY

### Static files not loading?
Already configured with WhiteNoise in `dpsite/settings.py` ✓

---

## **Upgrade to Paid (Optional)**

If you get more users, upgrade to Paid:
1. Click **"Plan"** in Render Dashboard
2. Select **"Starter"** ($7/month)
3. No more auto-sleep!

---

**You're all set!** 🎉 Completely FREE deployment with Render!

Need help? Questions? 🚀
