# Blood Glucose Level Prediction 

## 1. Introduction

- Diabetes is a chronic disease that causes many people to suffer and causes socioeconomic losses.

  - __Type 1 diabetes (T1DM)__ - In case Blood Glucose (BG) control isn't possible due to the inability to produce insulin that lowers BG in β cells in pancreas

  - __Type 2 diabetes (T2DM)__ - Also known as non-insulin dependent diabetes mellitus, which means that insulin production is possible, but cells become resistant to insulin and insulin can't perform its role properly

    

- T2DM patients account for more than 90% of all diabetes patients, but most of the previous studies were conducted on T1DM patients, so we collected data from T2DM patients



- Thus, this project aims to __predict BG level__ in patients 15, 30 and 60 minutes(Prediction Horizon) using the data below.
  - __Internal Factors__ : EGV (Estimated Glucose Value) from __CGM (Continuous Glucose Monitoring) device__, height, weight, underlying disease
  - __External Factors__ : Insulin administration, carbohydrate intake

---

### 2. Dataset 

---

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
