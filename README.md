# 🌧️ Rainfall — Two-Year Rainfall Probability Forecast

![Python](https://img.shields.io/badge/Python-3.x-blue)
![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-orange)
![XGBoost](https://img.shields.io/badge/XGBoost-boosting-green)
![statsmodels](https://img.shields.io/badge/statsmodels-time%20series-lightgrey)
![Kaggle](https://img.shields.io/badge/Kaggle-Competition-blue)

> Predicting daily rainfall probability up to **730 days** into the future using a hybrid time series + clustering pipeline — built for my first Kaggle competition.

---

## Overview

This project tackles the challenge of long-horizon binary weather forecasting: given 7 years of historical meteorological data (2013–2019), predict whether it will rain on each day across the following two years (2020–2021).

The final solution combines classical time series decomposition with unsupervised clustering and dimensionality reduction to extract rich temporal and structural features, ultimately evaluated using cross-validated ROC-AUC.

---

## Results

| Model | CV ROC-AUC |
|-------|-----------|
| RandomForest (baseline) | 0.878 |
| LogisticRegression | 0.894 |
| LogisticRegression + GridSearch (C=0.01, L2) | **0.894** |

Final submission uses Logistic Regression with tuned hyperparameters (C=0.01, L2 penalty, balanced class weights), evaluated via 5-fold cross-validation.

---

## Pipeline

```
Raw meteorological data
        │
        ▼
Trend & Seasonality Modelling     ← DeterministicProcess + CalendarFourier (annual)
        │
        ▼
Deseasonalization                 ← LinearRegression fit subtracted from target
        │
        ▼
Periodogram Analysis              ← Frequency spectrum verification
        │
        ▼
Feature Engineering               ← Mutual information ranking, lag features, time index
        │
        ▼
Clustering                        ← KMeans (k=2, elbow method) + centroid distances
        │
        ▼
Dimensionality Reduction          ← PCA on meteorological features
        │
        ▼
Classification & Evaluation       ← XGBoost / LogisticRegression, cross-validated ROC-AUC
```

---

## Dataset

| Split | Period | Days |
|-------|--------|------|
| Train | 2013–2019 | 2,556 |
| Test | 2020–2021 | 730 |

**Features:** `cloud` · `sunshine` · `humidity` · `temperature` · `dewpoint` · `winddirection`

Source: [Kaggle — Rainfall Prediction](https://www.kaggle.com/)

---

## Tech Stack

| Category | Libraries |
|----------|-----------|
| ML & Preprocessing | scikit-learn (KMeans, PCA, RandomForestRegressor, LogisticRegression), XGBoost |
| Time Series | statsmodels (DeterministicProcess, CalendarFourier) |
| Data | Pandas, NumPy, SciPy |
| Visualisation | Matplotlib, Seaborn |
| Environment | Jupyter Notebook |

---

## Repository Structure

```
Rainfall/
├── data/
│   ├── train.csv                  # Primary training set (2013–2019)
│   ├── train2_0.csv               # Extended training set (version 0)
│   ├── train2_1.csv               # Extended training set (version 1)
│   ├── test.csv                   # Test set (2020–2021)
│   ├── sample_submission.csv      # Kaggle submission template
│   └── Rainfall.csv               # Full combined dataset
├── notebooks/
│   ├── 01_eda.ipynb               # Exploratory data analysis
│   ├── 02_pca.ipynb               # PCA dimensionality reduction
│   ├── 03_clustering.ipynb        # KMeans clustering
│   ├── 04_feature_engineering.ipynb  # Lag features, Fourier terms, mutual information
│   ├── 05_final_model.ipynb       # Final hybrid model
│   └── archive/                   # Earlier experimental notebooks
│       ├── 01_kmeans_pca.ipynb
│       ├── 02_pca_analysis.ipynb
│       ├── 03_kmeans_pca_v2.ipynb
│       ├── 04_two_datasets_kmeans_pca.ipynb
│       ├── 05_timeseries_lag.ipynb
│       ├── 06_timeseries_baseline.ipynb
│       ├── 07_timeseries_2clusters_trend.ipynb
│       ├── 08_timeseries_2clusters.ipynb
│       ├── 09_kmeans_pca_hyperparams.ipynb
│       └── 10_timeseries_hybrid.ipynb
├── reports/
│   └── figures/                   # Generated plots and visualisations
├── requirements.txt
├── LICENSE
└── README.md
```

---

## Getting Started

```bash
git clone https://github.com/zikmundmartin7-lab/Rainfall.git
cd Rainfall
pip install scikit-learn xgboost statsmodels pandas numpy scipy matplotlib seaborn
```

Open the final notebook:

```bash
jupyter notebook notebooks/05_final_model.ipynb
```

---

## Author

**Martin Zikmund** — [zikmundmartin7@gmail.com](mailto:zikmundmartin7@gmail.com)

---

*First Kaggle competition entry. Built iteratively over ~3 weeks in September 2025.*