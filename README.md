# 🩺 Disease Prediction System  

This is a **Django-based web application** that predicts diseases based on user symptoms using a trained Machine Learning model.  

## 🚀 Features  
- User-friendly web interface with Django templates.  
- Predicts disease from symptoms using **ML model (`best_model.pkl`)**.  
- Stores prediction history in **SQLite database**.  
- Interactive UI with **Bootstrap templates**.  

## 📂 Project Structure  
```
diseasePredict/
│── db.sqlite3                  # Database
│── manage.py                   # Django management script
│
├── dpapp/                      # Main Django App
│   ├── admin.py                 # Django admin config
│   ├── apps.py                  # App configuration
│   ├── best_model.pkl           # Trained ML model
│   ├── label_encoder.pkl        # Label encoder
│   ├── models.py                # Django models
│   ├── views.py                 # Main application logic
│   ├── tests.py                 # Tests
│   ├── migrations/              # DB migrations
│   ├── static/                  # Static files (CSS, JS, Images)
│   │   └── images/              # Project images
│   └── templates/               # HTML templates
│       ├── index.html           # Home page
│       ├── parent.html          # Base template
│       ├── prediction.html      # Prediction results page
│       ├── history.html         # User history page
│       └── fpred.html           # Form for prediction
```

## 🛠️ Installation & Setup  

### 1️⃣ Clone the repository  
```bash
git clone <(https://github.com/NITESH864/Disease_Prediction_System)>
cd diseasePredict
```

### 2️⃣ Create Virtual Environment  
```bash
python -m venv venv
source venv/bin/activate   # For Linux/Mac
venv\Scripts\activate      # For Windows
```

### 3️⃣ Install Dependencies  
```bash
pip install -r requirements.txt
```

*(If `requirements.txt` is not present, manually install Django & required packages)*  
```bash
pip install django scikit-learn pandas numpy
```

### 4️⃣ Run Migrations  
```bash
python manage.py migrate
```

### 5️⃣ Run Development Server  
```bash
python manage.py runserver
```
Now visit: **http://127.0.0.1:8000/** 🎉  

## 📊 Machine Learning Model  
- Model file: **`best_model.pkl`**  
- Encodes symptoms using **label_encoder.pkl**  
- Trained with scikit-learn for disease classification  

## 🤝 Contributing  
Feel free to fork, raise issues, or submit PRs to improve the project.  

## 🚀 Deploy to Heroku

### 1) Prerequisites
- Install the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- Login:
```bash
heroku login
```

### 2) Create Heroku app
```bash
heroku create <your-app-name>
```

### 3) Configure environment variables
Set a strong secret key and production settings:
```bash
heroku config:set SECRET_KEY="<your-strong-secret-key>"
heroku config:set DEBUG=False
heroku config:set ALLOWED_HOSTS="<your-app-name>.herokuapp.com"
```

### 4) Prepare database and static files
```bash
python manage.py migrate
python manage.py collectstatic --noinput
```

### 5) Deploy
```bash
git push heroku main
heroku ps:scale web=1
heroku open
```

### 6) Useful checks
```bash
heroku logs --tail
heroku run python manage.py migrate
```

## 📜 License  
This project is open-source under the **MIT License**.  
