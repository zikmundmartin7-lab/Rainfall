# Rainfall Prediction — Model Development Journey

![Python](https://img.shields.io/badge/Python-3.x-blue) ![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-orange) ![XGBoost](https://img.shields.io/badge/XGBoost-boosting-green) ![Kaggle](https://img.shields.io/badge/Kaggle-Competition-blue)

> 🏆 This is my first Kaggle competition entry. The repository documents the full iterative process — from the initial baseline to the final hybrid model.

## Overview
This repository documents the iterative development of a rainfall prediction model built for my first Kaggle competition. Starting from a simple K-Means baseline, the model evolved into a full time series pipeline with Fourier seasonality, lag features, clustering, and PCA.

The goal: predict daily rainfall probability up to two years in advance (730 days), trained on 7 years of historical meteorological data (2013–2019).

## Development timeline

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
| 25 Sep | Time_series_time_lag_2clstrs / Rain_k-mean_PCA_2_hprmt / Time_series_time_hybrid | Hyperparameter tuning, hybrid model combining clustering + time series |

## Final pipeline (25_09_2025_Time_series_time_hybrid)
1. **Trend & seasonality** — DeterministicProcess with annual Fourier terms (CalendarFourier)
2. **Deseasonalization** — LinearRegression fit subtracted from target
3. **Periodogram analysis** — frequency spectrum to verify seasonality removal
4. **Feature engineering** — mutual information ranking, lag features, time index
5. **Clustering** — KMeans (k=2, elbow method) + centroid distance features
6. **PCA** — dimensionality reduction on meteorological features
7. **Evaluation** — cross-validated ROC-AUC (LogisticRegression baseline)

## Tech stack
- Python 3.x
- scikit-learn (KMeans, PCA, RandomForestRegressor, XGBRegressor, LogisticRegression)
- statsmodels (DeterministicProcess, CalendarFourier)
- Pandas, NumPy, SciPy
- Matplotlib, Seaborn
- Jupyter Notebook

## Dataset
Daily meteorological data from Kaggle. Training: 2013–2019 (2,556 days). Test: 2020–2021 (730 days).
Features: `cloud` `sunshine` `humidity` `temparature` `dewpoint` `winddirection`

## How to run
```bash
git clone https://github.com/your-username/rainfall-prediction
cd rainfall-prediction
pip install -r requirements.txt
# Start with the final notebook:
jupyter notebook 25_09_2025_Time_series_time_hybrid.ipynb
```

## Author
Martin Zikmund — zikmundmartin7@gmail.com
