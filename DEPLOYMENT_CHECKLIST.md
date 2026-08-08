# Deployment Checklist for Render.com FREE

## Pre-Deployment ✓

- [x] `requirements.txt` - All dependencies listed
- [x] `runtime.txt` - Python version specified (3.11.9)
- [x] `render.yaml` - Render configuration file present
- [x] `Procfile` - Heroku-style process file (optional for Render)
- [x] `.env.example` - Environment variables template
- [x] `RENDER_QUICK_START.md` - Quick start guide
- [x] `RENDER_DEPLOYMENT_GUIDE.md` - Detailed guide

## Render Dashboard Setup ✓

Steps to follow on Render Dashboard:

1. **Create Web Service**
   - [ ] Go to https://dashboard.render.com
   - [ ] Click "New +" → "Web Service"
   - [ ] Connect GitHub repo: `NITESH864/Disease_Prediction_System`

2. **Configure Service**
   - [ ] Name: `disease-prediction-system`
   - [ ] Environment: `Python 3`
   - [ ] Build Command: `pip install -r requirements.txt && python manage.py collectstatic --noinput`
   - [ ] Start Command: `gunicorn dp_project.wsgi:application`
   - [ ] Plan: **Free**

3. **Add Environment Variables** (Advanced section)
   - [ ] `SECRET_KEY` = (generate: `python3 -c "import secrets; print(secrets.token_urlsafe(50))"`)
   - [ ] `DEBUG` = `False`
   - [ ] `ALLOWED_HOSTS` = `disease-prediction-system.onrender.com`

4. **Deploy**
   - [ ] Click "Deploy Web Service"
   - [ ] Wait 2-5 minutes for deployment
   - [ ] Check "Logs" tab for any errors

## Post-Deployment ✓

- [ ] App is live at: `https://disease-prediction-system.onrender.com`
- [ ] Homepage loads without errors
- [ ] Prediction form is accessible
- [ ] Static files (CSS, images) load properly
- [ ] No 502 or 500 errors in logs

## Maintenance (Optional) ✓

- [ ] Set up UptimeRobot to prevent auto-sleep (FREE)
  - Go to https://uptimerobot.com
  - Add HTTP(S) monitor for your app URL
  - Set interval to 10 minutes

- [ ] Enable auto-deploy from GitHub
  - In Render Dashboard: Settings → Auto-Deploy
  - Select "Yes" for "Auto-Deploy Changed Push to Branch"

## Troubleshooting ✓

If deployment fails:
1. Check **Logs** in Render Dashboard
2. Verify all environment variables are set
3. Ensure `SECRET_KEY` is not empty
4. Check that `DEBUG` is set to `False`
5. Verify `ALLOWED_HOSTS` includes your Render domain

Common Issues:
- **502 error** → Check logs, likely SECRET_KEY not set
- **Static files not loading** → WhiteNoise should handle this
- **Database errors** → SQLite is included by default
- **Deployment timeout** → Check build logs for hanging processes

## Free Tier Limits ✓

- **RAM**: 512 MB
- **CPU**: Shared
- **Disk**: 5 GB
- **Auto-sleep**: After 15 minutes of inactivity
- **Cold start time**: ~30 seconds

## Deployment URLs

- **App URL**: `https://disease-prediction-system.onrender.com`
- **Render Dashboard**: `https://dashboard.render.com`
- **GitHub Repo**: `https://github.com/NITESH864/Disease_Prediction_System`

---

**You're ready to deploy! Follow the checklist above and you'll have your app live in minutes!** 🚀
