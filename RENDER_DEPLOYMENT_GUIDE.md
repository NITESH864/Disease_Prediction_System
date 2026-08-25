# Deploy Disease Prediction System on Render (Free Tier)

This repository is ready for Render deployment with these files:
- `render.yaml` (Render Blueprint for free-tier service)
- `Procfile` (`gunicorn dp_project.wsgi:application`)
- `requirements.txt`

## 1) One-time requirement
Generate a Django secret key (you will paste it in Render):

```bash
python3 -c "import secrets; print(secrets.token_urlsafe(50))"
```

## 2) Deploy from GitHub on Render
1. Open https://dashboard.render.com
2. Click **New +** → **Blueprint**
3. Connect repository: `NITESH864/Disease_Prediction_System`
4. Render detects `render.yaml` automatically
5. Set the required environment variable:
   - `SECRET_KEY` = your generated key
6. Click **Apply** (or **Deploy**)

## 3) Render free-tier configuration used
- **Service name:** `disease-prediction-system`
- **Plan:** `free`
- **Build command:** `pip install -r requirements.txt && python manage.py collectstatic --noinput`
- **Start command:** `gunicorn dp_project.wsgi:application`
- **Default env vars in blueprint:**
  - `DEBUG=False`
  - `ALLOWED_HOSTS=disease-prediction-system.onrender.com`
  - `PYTHON_VERSION=3.11.9`

## 4) Production Django behavior
- `DEBUG` is environment-driven and defaults to `False`
- `SECRET_KEY` comes from environment
- `ALLOWED_HOSTS` comes from environment (`ALLOWED_HOSTS`) and can accept comma-separated values
- WhiteNoise is enabled for static files:
  - `whitenoise.middleware.WhiteNoiseMiddleware`
  - `STATIC_ROOT=staticfiles`
  - `CompressedManifestStaticFilesStorage`

## 5) After deployment
- App URL: `https://disease-prediction-system.onrender.com`
- First request after idle can be slow on free tier (cold start)
- Check logs in Render Dashboard → your service → **Logs**

## 6) Optional manual web-service flow (without Blueprint)
If you use **Web Service** instead of **Blueprint**, use:
- **Build command:** `pip install -r requirements.txt && python manage.py collectstatic --noinput`
- **Start command:** `gunicorn dp_project.wsgi:application`
- **Environment variables:**
  - `SECRET_KEY` (required)
  - `DEBUG=False`
  - `ALLOWED_HOSTS=disease-prediction-system.onrender.com`
