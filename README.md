# Rainfall Prediction — Model Development Journey

![Python](https://img.shields.io/badge/Python-3.10+-blue) ![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-orange) ![XGBoost](https://img.shields.io/badge/XGBoost-boosting-green) ![Kaggle](https://img.shields.io/badge/Kaggle-competition-red)

> 🏆 **First Kaggle competition entry** — Complete iterative development from baseline to hybrid model with **ROC-AUC 0.894**

## Overview

This repository documents the full development journey of a rainfall prediction model built for a Kaggle competition. Starting from a simple K-Means baseline, the model evolved into a sophisticated hybrid approach combining time series decomposition, clustering, and ensemble methods.

**Goal:** Predict daily rainfall probability up to two years in advance (730 days), trained on 7 years of historical meteorological data (2013–2019).

---

## 🎯 Key Results

| Metric | Score |
|--------|-------|
| **ROC-AUC (Validation)** | **0.894** |
| **Model Type** | Hybrid (Time Series + Clustering) |
| **Training Data** | 2,556 days (2013–2019) |
| **Test Horizon** | 730 days (2020–2021) |
| **Features Engineered** | 15+ (lag, trend, seasonality, clustering) |

---

## 📊 Development Timeline

| Date | Notebook | What was added |
|------|----------|----------------|
| 08 Sep | Rain_k-mean | Baseline — KMeans clustering, MinMaxScaler, XGBoost |
| 09 Sep | Rain_k-mean_2 / Rain_PCA | Added PCA dimensionality reduction |
| 10 Sep | Rain / Rain_k-mean_PCA | Combined KMeans + PCA pipeline |
| 11 Sep | Rain_PCA | PCA variance analysis, loadings, mutual information scores |
| 13 Sep | Rain_k-mean_PCA_2 | Refined PCA + KMeans feature engineering |
| 14 Sep | Rain_2dts_k-mean_PCA | Introduced second dataset, extended feature set |
| 19 Sep | Time_series / Time_series_time_lag | Switched to time series approach, added lag features |
| 22 Sep | Time_series_time_lag_2clstrs_trend | Added trend modelling, DeterministicProcess, Fourier seasonality, 2 clusters |
| 25 Sep | **Rain_2dts_k-mean_PCA_2** (⭐ BEST) | Hyperparameter tuning, hybrid model combining clustering + time series |

---

## 🔧 Final Pipeline (Rain_2dts_k-mean_PCA_2.ipynb)

The best model combines multiple techniques:

1. **Trend & Seasonality Decomposition**
   - DeterministicProcess with annual Fourier terms (CalendarFourier)
   - Removes deterministic patterns from the target

2. **Deseasonalization**
   - LinearRegression fit subtracted from target
   - Focuses model on residual variance

3. **Frequency Analysis**
   - Periodogram analysis to verify seasonality removal
   - Identifies dominant frequencies in data

4. **Feature Engineering**
   - Mutual information ranking for feature selection
   - Lag features (t-1, t-7, t-30, etc.)
   - Time index features
   - Meteorological feature aggregation (2 datasets combined)

5. **Clustering**
   - KMeans (k=2, elbow method)
   - Centroid distance features capture weather regime shifts

6. **Dimensionality Reduction**
   - PCA on meteorological features
   - Reduces noise, improves generalization

7. **Final Model**
   - LogisticRegression baseline with ROC-AUC evaluation
   - Cross-validation to prevent overfitting

---

## 💾 Tech Stack

- **Python** 3.10+
- **Data Processing:** Pandas, NumPy, SciPy
- **Machine Learning:** scikit-learn (KMeans, PCA, LogisticRegression)
- **Boosting:** XGBoost
- **Time Series:** statsmodels (DeterministicProcess, CalendarFourier)
- **Visualization:** Matplotlib, Seaborn
- **Notebooks:** Jupyter

---

## 📈 Dataset

**Source:** Kaggle meteorological competition data

| Split | Duration | Days |
|-------|----------|------|
| **Train** | 2013–2019 | 2,556 |
| **Test** | 2020–2021 | 730 |

**Features:**
- `cloud` — Cloud coverage
- `sunshine` — Sunshine hours
- `humidity` — Relative humidity
- `temperature` — Daily temperature
- `dewpoint` — Dew point
- `winddirection` — Wind direction

---

## 🚀 How to Run

### Prerequisites
- Python 3.10 or higher
- pip or conda

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/zikmundmartin7-lab/rainfall.git
   cd rainfall
   ```

2. **Create virtual environment (optional but recommended)**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Start Jupyter and run the best notebook**
   ```bash
   jupyter notebook Rain_2dts_k-mean_PCA_2.ipynb
   ```

---

## 📁 Project Structure

```
rainfall/
├── README.md                          # This file
├── requirements.txt                   # Python dependencies
├── LICENSE                           # MIT License
├── .gitignore                        # Git ignore file
│
├── notebooks/                        # Jupyter notebooks
│   ├── Rain_k-mean.ipynb            # Baseline
│   ├── Rain_k-mean_2.ipynb
│   ├── Rain_PCA.ipynb
│   ├── Rain_k-mean_PCA.ipynb
│   ├── Rain_k-mean_PCA_2.ipynb
│   ├── Rain_2dts_k-mean_PCA.ipynb
│   ├── Time_series.ipynb
│   ├── Time_series_time_lag.ipynb
│   ├── Time_series_time_lag_2clstrs_trend.ipynb
│   └── Rain_2dts_k-mean_PCA_2.ipynb  # ⭐ START HERE
│
└── data/                             # Data files (if included)
    └── (meteorological data)
```

---

## 🎓 Skills Demonstrated

- ✅ **Time Series Analysis** — Trend/seasonality decomposition, Fourier features
- ✅ **Feature Engineering** — Lag features, mutual information selection, clustering features
- ✅ **Dimensionality Reduction** — PCA for noise reduction
- ✅ **Clustering** — KMeans with elbow method, centroid distance features
- ✅ **Model Evaluation** — ROC-AUC, cross-validation, hyperparameter tuning
- ✅ **Ensemble Methods** — Hybrid model combining multiple techniques
- ✅ **Data Visualization** — Periodograms, variance analysis, trend plots
- ✅ **Kaggle Competition Experience** — Real-world ML pipeline development

---

## 📝 Author

**Martin Zikmund**

- 📧 Email: zikmundmartin7@gmail.com
- 💼 LinkedIn: [martin-zikmund-b0aa35122](https://www.linkedin.com/in/martin-zikmund-b0aa35122)
- 🐙 GitHub: [@zikmundmartin7-lab](https://github.com/zikmundmartin7-lab)

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Feedback, issues, and pull requests are welcome!

---

**Last Updated:** June 2026
