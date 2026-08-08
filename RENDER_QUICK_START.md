# 🚀 Quick Start Guide - Deploy to Render FREE

Your Disease Prediction System is ready to deploy on **Render.com** (completely FREE!)

## ⚡ Quick 3-Minute Deploy

### Step 1: Generate SECRET_KEY
```bash
python3 -c "import secrets; print(secrets.token_urlsafe(50))"
```
**Copy the output** - you'll need this soon.

---

### Step 2: Go to Render
1. Open: **https://render.com**
2. Sign up/Login with GitHub (easiest!)

---

### Step 3: Create Web Service
1. Click **"New +"** → **"Web Service"**
2. Click **"Connect repository"**
3. Select: **Disease_Prediction_System**
4. Click **"Connect"**

---

### Step 4: Configure Deploy
Fill in the form:

| Field | Value |
|-------|-------|
| **Name** | disease-prediction-system |
| **Environment** | Python 3 |
| **Build Command** | `pip install -r requirements.txt && python manage.py collectstatic --noinput` |
| **Start Command** | `gunicorn dp_project.wsgi:application` |
| **Plan** | Free |

---

### Step 5: Add Environment Variables
Scroll to **"Advanced"** section.

Click **"Add Environment Variable"** for each:

**Variable 1:**
```
Key: SECRET_KEY
Value: <paste your generated key from Step 1>
```

**Variable 2:**
```
Key: DEBUG
Value: False
```

**Variable 3:**
```
Key: ALLOWED_HOSTS
Value: disease-prediction-system.onrender.com
```

---

### Step 6: Deploy! 🚀
Click the blue **"Deploy Web Service"** button.

**Wait 2-5 minutes** for deployment to complete.

---

### Step 7: Your App is LIVE! 🎉
Once deployment succeeds, your app URL will be:
```
https://disease-prediction-system.onrender.com
```

Open it in your browser! 🌐

---

## ⚠️ Important Notes

### FREE Tier Limitations:
- **Auto-Sleep**: App sleeps after 15 min of inactivity (wakes up in 30 sec)
- **Resources**: 512MB RAM, shared CPU (fine for testing)
- **Disk**: 5GB storage

### Keep App Awake (Optional)
Use **[UptimeRobot](https://uptimerobot.com)** (FREE):
1. Sign up at uptimerobot.com
2. Add new HTTP(S) monitor
3. Enter your app URL
4. Set interval to 10 minutes
5. Save

Now your app won't sleep! ✨

---

## 📊 After Deployment

### View Logs:
- Go to Render Dashboard
- Click your service
- Click **"Logs"** tab

### Redeploy:
- Click **"Manual Deploy"** → **"Deploy latest commit"**

### Update Environment Variables:
- Click **"Environment"** in sidebar
- Edit and save
- App auto-redeploys!

### Access Your App:
- Click the URL at the top of service page
- Or go to: `https://disease-prediction-system.onrender.com`

---

## 🆘 Troubleshooting

### Deployment Failed?
1. Check **Logs** tab in Render
2. Common fixes:
   - SECRET_KEY not set → Add it in Environment
   - DEBUG=True in production → Change to False
   - Missing ALLOWED_HOSTS → Add your Render URL

### App shows 502 error?
- Check logs for the exact error
- Usually: missing SECRET_KEY or Django setting issue

### Static files not loading?
- Already configured with WhiteNoise ✓
- Run: `python manage.py collectstatic --noinput`

---

## 💰 Upgrade Later (Optional)
If you get lots of users:
1. Click **"Plan"** in Render Dashboard
2. Select **"Starter"** ($7/month)
3. Benefits: No auto-sleep, more resources

---

## 📞 Need Help?
Check the full guide: **RENDER_DEPLOYMENT_GUIDE.md**

---

**You're all set! Happy deploying! 🚀**
