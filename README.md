# Blood Glucose Level Prediction

## Introduction

- Diabetes is a chronic disease caused by the inability to produce insulin appropriately in the beta cells of the pancreas or to respond appropriately to insulind made by the body's cells

- Thus, this project aims to __predict blood glucose level__ in patients 15, 30 and 60 minutes using the data below.
  - __Internal Factors__ : EGV (Estimated Glucose Value) from __CGM (Continuous Glucose Monitoring) device__, height, weight, underlying disease
  - __External Factors__ : Insulin administration, carbohydrate intake

- Therefore, raw data is pre-processed so that it can be converted into a table of shapes as shown below 

![BG_Table](https://user-images.githubusercontent.com/52738769/106373392-42c2db80-63bc-11eb-8b64-fea27e8b1a6f.PNG)

- As can be seen from the above table, three features of insulin, carbohydrates, and Blood Glucose Values are used right now

![BG_Graph](https://user-images.githubusercontent.com/52738769/106373417-a3521880-63bc-11eb-9b5e-424a5504fb78.PNG)

- You can also see beautiful graphs like this

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
