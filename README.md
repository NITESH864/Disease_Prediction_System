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
git clone <(https://github.com/Richakushwaha87/Disease_Prediction_System)>
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
