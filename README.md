# 🩺 Disease Prediction System

A **Django-based Machine Learning web application** that predicts possible diseases based on user-provided symptoms and medical information.

## 🚀 Live Demo

👉 **[Click here to use the Live Website](https://dp-project-r6x6.onrender.com)**

## ✨ Features

* 🖥️ User-friendly web interface built with **Django Templates**
* 🤖 Disease prediction using a trained **Machine Learning model**
* 🩺 Predicts diseases based on user-provided symptoms
* 📊 Uses **Scikit-learn** for machine learning
* 🗃️ Stores prediction history using **SQLite**
* 🎨 Responsive UI using **Bootstrap**
* 📁 Supports medical information and prediction forms
* 🚀 Deployed online using **Render**

## 🛠️ Technologies Used

| Technology   | Purpose                |
| ------------ | ---------------------- |
| Python       | Programming Language   |
| Django       | Web Framework          |
| Scikit-learn | Machine Learning       |
| Pandas       | Data Processing        |
| NumPy        | Numerical Computing    |
| SQLite       | Database               |
| Bootstrap    | Frontend/UI            |
| HTML & CSS   | Web Interface          |
| Gunicorn     | Production Server      |
| WhiteNoise   | Static File Management |
| Render       | Deployment             |

## 🤖 Machine Learning Model

The application uses a trained Machine Learning classification model for disease prediction.

### Model Files

* `best_model.pkl` — Trained Machine Learning model
* `label_encoder.pkl` — Label encoding for disease classes

The model is loaded by the Django application and used to generate disease predictions based on the user's input.

## 📂 Project Structure

```text
Disease_Prediction_System/
│
├── db.sqlite3
├── manage.py
├── requirements.txt
├── render.yaml
├── runtime.txt
├── Procfile
├── .gitignore
│
├── dp_project/
│   ├── settings.py
│   ├── urls.py
│   ├── wsgi.py
│   └── ...
│
└── dpapp/
    ├── admin.py
    ├── apps.py
    ├── models.py
    ├── views.py
    ├── tests.py
    ├── best_model.pkl
    ├── label_encoder.pkl
    │
    ├── migrations/
    │
    ├── static/
    │   └── images/
    │
    └── templates/
        ├── index.html
        ├── parent.html
        ├── prediction.html
        ├── history.html
        └── fpred.html
```

## ⚙️ Installation & Setup

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/NITESH864/Disease_Prediction_System.git
cd Disease_Prediction_System
```

### 2️⃣ Create a Virtual Environment

**Windows:**

```powershell
python -m venv venv
venv\Scripts\activate
```

**Linux / macOS:**

```bash
python -m venv venv
source venv/bin/activate
```

### 3️⃣ Install Dependencies

```bash
pip install -r requirements.txt
```

### 4️⃣ Run Database Migrations

```bash
python manage.py migrate
```

### 5️⃣ Collect Static Files

```bash
python manage.py collectstatic --noinput
```

### 6️⃣ Start the Development Server

```bash
python manage.py runserver
```

Open the application in your browser:

```text
http://127.0.0.1:8000/
```

## 🔮 How It Works

```text
User
  ↓
Enter Symptoms / Medical Information
  ↓
Django Application
  ↓
Data Processing
  ↓
Machine Learning Model
  ↓
Disease Prediction
  ↓
Display Result
  ↓
Store Prediction History
```

## 📊 Prediction Flow

1. User opens the Disease Prediction System.
2. User provides the required symptoms or medical information.
3. Django receives and processes the input.
4. The trained Machine Learning model analyzes the input.
5. The application generates a predicted disease.
6. The prediction result is displayed to the user.
7. Prediction history can be stored and viewed through the application.

## 🌐 Deployment

The application is deployed using **Render**.

### Live Application

👉 **https://dp-project-r6x6.onrender.com**

The deployment uses:

* Gunicorn
* WhiteNoise
* `render.yaml`
* `requirements.txt`
* Python 3.13.14

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Commit your changes.
5. Push the branch.
6. Create a Pull Request.

## 📜 License

This project is open-source and available under the **MIT License**.

## 👨‍💻 Author

**Nitesh Gupta**

GitHub: **[NITESH864](https://github.com/NITESH864)**

---

⭐ If you find this project useful, consider giving the repository a star!
