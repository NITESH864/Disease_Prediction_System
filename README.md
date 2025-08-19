# 🧠 Machine Learning Basics + 🌐 Disease Prediction Web App

This repository contains **two major parts** of my Machine Learning journey:

1. 📘 **Machine Learning Basics** → Jupyter Notebooks covering data preprocessing, ML algorithms, and datasets.  
2. 🌐 **Django Disease Prediction System** → A web application that predicts diseases using ML models.

---

## 📌 Project Overview

- Learn and practice **core ML concepts** with Python.  
- Implement algorithms like **Linear Regression, KNN, SVM, Decision Tree, Random Forest, ANN**.  
- Work with **real datasets** like Iris, Insurance, Student marks, Sports, and Disease datasets.  
- Build and deploy a **Disease Prediction Web Application** using Django + ML.  

This project is a **step-by-step learning + deployment journey**.

---

## 📂 Project Structure

### 🔹 Part 1: Machine Learning Basics (`st-ml/`)

- **Data Preprocessing**
  - Notebook: `DataPreprocessing.ipynb`  
  - Handling missing values, categorical encoding, feature scaling, train-test split.  

- **Python Libraries Practice**
  - `numpyPractice.ipynb` → Arrays, math ops.  
  - `pandasPractice.ipynb` → DataFrames, filtering, grouping.  
  - `matplotlibPractice.ipynb` → Data visualization basics.  

- **Machine Learning Algorithms**
  - 📈 Linear Regression → `LinearRegression Implementation.ipynb`, `Student Marks Predictor.ipynb`  
  - 👥 KNN → `KNN Implementation-1.ipynb`, `KNN Implementation-2.ipynb`  
  - 🌀 SVM → `SVM Implementation-1.ipynb`  
  - 🌳 Decision Tree → `Decision Tree Classifier.ipynb`  
  - 🌲 Random Forest → `Iris dataset classification using random forest.ipynb`, `Diseases Predict using Random Forest.ipynb`  
  - 🔬 ANN → `ANN Implementation-1.ipynb`, `ANN Implementation-2.ipynb`  

- **Datasets**
  - `iris.csv`, `student_info.csv`, `insurance.csv`, `sports.csv`, `dataset.csv`, `improved_disease_dataset.csv`, `taxi.csv`, `Emp.csv`  

- **Saved Models**
  - `best_model.pkl`, `dtc.pkl`, `label_encoder.pkl`, `smp.pkl`  

---

### 🔹 Part 2: Disease Prediction Web App (`diseasePredict/`)

- **Backend**
  - Django project → `manage.py`, `settings.py`, `urls.py`, `views.py`  
  - ML models → `best_model.pkl`, `label_encoder.pkl`  

- **Frontend**
  - Templates → `index.html`, `prediction.html`, `fpred.html`, `history.html`, `parent.html`  
  - Static files → `images/img1.jpg`  

- **Database**
  - `db.sqlite3` (default Django DB for storing predictions/history)  

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/your-username/ml-basics-disease-predict.git
cd ml-basics-disease-predict

