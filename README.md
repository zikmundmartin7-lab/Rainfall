# Two-Year Rainfall Probability Forecast

![Python](https://img.shields.io/badge/Python-3.x-blue) ![scikit-learn](https://img.shields.io/badge/scikit--learn-ML-orange) ![XGBoost](https://img.shields.io/badge/XGBoost-gradient%20boosting-green) ![Kaggle](https://img.shields.io/badge/Dataset-Kaggle-blue)

## Overview
A time series forecasting project that predicts daily rainfall probability up to two years in advance (730 days). The pipeline combines linear trend modelling, Fourier seasonality decomposition, K-Means clustering, and mutual information feature selection — trained on 7 years of historical meteorological data (2013–2019) and applied to the 2020–2021 period.

## Approach
1. **Trend & seasonality modelling** — DeterministicProcess with annual Fourier terms (CalendarFourier) to capture yearly cycles
2. **Deseasonalization** — LinearRegression fit subtracted from target to isolate residuals
3. **Periodogram analysis** — frequency spectrum analysis to verify seasonality removal
4. **Feature engineering** — mutual information scores to rank features (cloud, sunshine, humidity, temperature, dewpoint, winddirection)
5. **Clustering** — K-Means (k=2, elbow method used) on MinMax-scaled meteorological features to create centroid distance features
6. **Evaluation** — cross-validated ROC-AUC score via LogisticRegression baseline

## Tech stack
- Python 3.x
- scikit-learn (LinearRegression, KMeans, PCA, RandomForestRegressor, XGBRegressor)
- statsmodels (DeterministicProcess, CalendarFourier)
- Pandas, NumPy
- Matplotlib, Seaborn
- Jupyter Notebook

## Dataset
Daily meteorological data sourced from Kaggle. Training set covers 2013–2019 (2,556 days). Test set covers 2020–2021 (730 days). Features include cloud cover, sunshine hours, humidity, temperature, dewpoint, and wind direction.

## Key features used
`cloud` `sunshine` `humidity` `temparature` `dewpoint` `winddirection` + Fourier terms + KMeans centroid distances

## How to run
```bash
git clone https://github.com/your-username/two-year-rainfall-forecast
cd two-year-rainfall-forecast
pip install -r requirements.txt
jupyter notebook Time_series_time_lag_2clstrs_trend.ipynb
```

## Author
Martin Zikmund — zikmundmartin7@gmail.com
