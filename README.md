# Blood Glucose Level Prediction 

## 1. Introduction

- Diabetes is a chronic disease that causes many people to suffer and causes socioeconomic losses and there are two types of diabetes

  - __Type 1 diabetes (T1DM)__ - When self-Blood Glucose (BG) control is impossible due to the problem of inability to produce insulin in β cells of the pancreas

  - __Type 2 diabetes (T2DM)__ - Also known as non-insulin dependent diabetes mellitus, which means that insulin production is possible, but cells become resistant to insulin and insulin can't perform its role properly

    

- T2DM patients account for more than 90% of all diabetes patients, but most of the previous studies were conducted on T1DM patients, so we collected data from T2DM patients



- Thus, this project aims to __predict BG level__ in patients 15, 30 and 60 minutes(Prediction Horizon) using the data below.
  - __Internal Factors__ : EGV (Estimated Glucose Value) from __CGM (Continuous Glucose Monitoring) device__, height, weight, underlying disease
  
  - __External Factors__ : Insulin administration, carbohydrate intake
  
    

- We used the above factors to make five models : Simple RNN, LSTM, Bidirectional LSTM, Stacked LSTM, and GRU 
- Then, we applied genetic algorithm (GA) to find optimized weights that minimize RMSE
- And we compared the performance of the model with the traditional time series prediction model ARIMA as baseline and found that the model proposed in this work performed better 

---

### 2. Dataset 

---

- With cooperation with the university hospital, we collected data from __55 diabetic patients__ who visited or were hospitalized from 2019.05 ~ 2021.03

- Previous studies often used less than 10 patients or simulated data, so it is sufficiently meaningful that this project used data from 55 diabetic patients

- Data collected by attaching a CGM device for __5 to 7 consecutive days__

- CGM device - Dexcom G5

- Sampling rate - 5 minutes 

- BG is recorded as 'high' if it is over 400 and 'low' if it is less than 60

  

- Now, let's take a look at the data
- First, raw-data is shown in the table below



![1_rawdata](https://user-images.githubusercontent.com/52738769/113534504-e4101d00-960b-11eb-89a1-b612a89cb5de.PNG)



- As you can see,there are 13 features including timestamps, event types, patient information, glucose values, etc

- However, only five features used in this study - insulin value administered, carbohydrate value, glucose value, timestamp, event type

  

- Therefore, raw data is pre-processed so that it can be converted into a table of shapes as shown below (If necessary, please refer to 0.1 ~ 0.3 of source code for the detailed preprocessing process - [Soucre code](/Models_GA.ipynb))

![BG_Table](https://user-images.githubusercontent.com/52738769/106373392-42c2db80-63bc-11eb-8b64-fea27e8b1a6f.PNG)

- As can be seen from the above table, three features of insulin, carbohydrates, and Blood Glucose Values are used right now

![BG_Graph](https://user-images.githubusercontent.com/52738769/106373417-a3521880-63bc-11eb-9b5e-424a5504fb78.PNG)

- Now we can see neat graph like above

## 3. Materials and methods 

#### 3.1. Research framework

![2_framework](https://user-images.githubusercontent.com/52738769/113535952-c9d83e00-960f-11eb-8ad5-4d8cec4f6726.PNG)

__< "Developing an individual Glucose Prediction Model Using Recurrent Neural Network" > __[reference link](https://www.mdpi.com/1424-8220/20/22/6460)

- The above research framework is a univariate prediction model using only CGM data as input variables
- On the other hand, in this study, there are following developments:
  1. Multivariate models added to insulin administration point and carbohydrate intake point features 
  2. Applied optimization methodology, genetic algorithm
  3. ARIMA model was used as baseline
  4. And most of all, the performance of the model has improved

#### 3.2. Prediction models

- I applied __five RNN-based algorithms__ that show clear advantages in sequence data such as time series data
  
  - Vanila RNN 
  - LSTM
  - Stacked LSTM
  - Bidirectional LSTM
  - GRU
  
- Below is a description of the frame to be fitted to the model 

  ![3_description](https://user-images.githubusercontent.com/52738769/113537698-5dac0900-9614-11eb-83f1-7ac5a6d0f3a9.PNG)

   __< "Developing an individual Glucose Prediction Model Using Recurrent Neural Network" >__ [reference link](https://www.mdpi.com/1424-8220/20/22/6460)

  - Lookback : How many minutes ago we want to use the BG as the input variable

  - delay : Prediction Horizon(PH) , future BG we want to predict (15min, 30min, 60min)

  - windowing step : We applied sliding window, move the window one timestep to the right in a fixed size 

    

- Figure demonstrated more about lookback 

  ![4_lookback](https://user-images.githubusercontent.com/52738769/113538473-5128b000-9616-11eb-994c-fd4f020d2f70.PNG)

  __< "Artificial Neural Network Algorithm for Online Glucose Prediction from Continuous Glucose Monitoring" >__[reference link](https://doi.org/10.1089/dia.2009.0076)

- We applied lookback values to the model by varying them, such as 3, 6, 9, 12, and each showed no significant difference in performance, so we thought 6 was the best fit

- This means that BG up to 30 minutes ago were used as input variables 



#### 3.3. Optimization

- So far, we have made five prediction models

- However, there is a problem that RNN can be perform well in some patients' data while GRU can perform well in others

- Therefore, Genetic Algorithm (GA) is applied in a way that minimizes variability due to performance differences in each model depending on the data and makes it robust

  

- The flow of GA is as follows 

  1. Initial chromosome generation 

  2. Evaluation of fitness by generation 

  3. Generation crossover and mutations 

  4. Evaluate the fitness for the next generation 

     

- In this study, GA is applied in the following order: 

  1. Each prediction model has an array that containing predicted BG as an output (If the input variables are [t1,t2,t3, ...], output is [pre_t7, pre_t8, pre_t9, ...] when PH = 30min)

  2. The predicted BG for each model were named Model1, Model2, ..., Model5

  3. Our aim is to find the weight combination that minimizes the RMSE 

     

     ![for](https://user-images.githubusercontent.com/52738769/113544736-d5cdfb00-9623-11eb-948c-926b4294a925.png)

  4. The constraints of each weight are as follows. 

     

     ![for2](https://user-images.githubusercontent.com/52738769/113544779-ea11f800-9623-11eb-9c49-92ccd70a9a3e.png)

     

     __Parameters used in GA__

     | Parameter_Name                    | Parameter_value |
     | --------------------------------- | --------------- |
     | Num_iteration                     | 25000           |
     | Population_Size                   | 100             |
     | mutation_probability              | 0.1             |
     | elit_ratio                        | 0.01            |
     | crossover_probability             | 0.5             |
     | parents_portion                   | 0.3             |
     | crossover_type                    | uniform         |
     | selection_type                    | roulette        |
     | max_iteration_without_improvement | None            |



## Results

![BG_Prediction_Graph](https://user-images.githubusercontent.com/52738769/106373572-35a6ec00-63be-11eb-82a0-9d7fd53344ee.PNG)
