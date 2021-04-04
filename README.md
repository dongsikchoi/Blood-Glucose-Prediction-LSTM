# Blood Glucose Level Prediction 

## 1. Introduction

- Diabetes is a chronic disease that causes many people to suffer and causes socioeconomic losses and there are two types of diabetes

  - __Type 1 diabetes (T1DM)__ - When self-Blood Glucose (BG) control is impossible due to the problem of inability to produce insulin in β cells of the pancreas

  - __Type 2 diabetes (T2DM)__ - Also known as non-insulin dependent diabetes mellitus, which means that insulin production is possible, but cells become resistant to insulin and insulin can't perform its role properly

    

- T2DM patients account for more than 90% of all diabetes patients, but most of the previous studies were conducted on T1DM patients, so we collected data from T2DM patients



- Thus, this project aims to __predict BG level__ in patients 15, 30 and 60 minutes(Prediction Horizon) using the data below.
  - __Internal Factors__ : EGV (Estimated Glucose Value) from __CGM (Continuous Glucose Monitoring) device__, height, weight, underlying disease
  - __External Factors__ : Insulin administration, carbohydrate intake

---

### 2. Dataset 

---

- With cooperation with the university hospital, we collected data from __55 diabetic patients__ who visited or were hospitalized from 2019.05 ~ 2021.03
- Previous studies often used less than 10 patients or simulated data, so it is sufficiently meaningful that this project used data from 55 diabetic patients
- Data collected by attaching a CGM device for 5 to 7 consecutive days
- CGM device - Dexcom G5
- Sampling rate - 5 minutes 
- BG is recorded as 'high' if it is over 400 and 'low' if it is less than 60



- Therefore, raw data is pre-processed so that it can be converted into a table of shapes as shown below 

![BG_Table](https://user-images.githubusercontent.com/52738769/106373392-42c2db80-63bc-11eb-8b64-fea27e8b1a6f.PNG)

- As can be seen from the above table, three features of insulin, carbohydrates, and Blood Glucose Values are used right now

![BG_Graph](https://user-images.githubusercontent.com/52738769/106373417-a3521880-63bc-11eb-9b5e-424a5504fb78.PNG)

- Now we can see beautiful graphs like above

## Materials and methods 

- I applied five RNN-based algorithms that show clear advantages in sequence data such as time series data
  - Vanila RNN 
  - LSTM
  - Stacked LSTM
  - Bidirectional LSTM
  - GRU
  
- In addition, i currently aim to apply SG Filter and Kalman filter to de-noise and smooth the data

## Results

![BG_Prediction_Graph](https://user-images.githubusercontent.com/52738769/106373572-35a6ec00-63be-11eb-82a0-9d7fd53344ee.PNG)
