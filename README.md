# ASM_Assignment2
## Required Packages for R
1. fitdistrplus
2. actuar

## File Descriptions
1. main.R: This files calls and run all function together to get best parameters for selected probability distributions.
2. data_transformation.R: This files imports and transforms data to be used for our work.
3. training.R: This files have methods which trains various probability models using MLE and MoM and gives best ones using AIC and K-S Tests.

## Method/Function Descriptions:
* **transform(input_file, output_file)**: This method takes location of input csv file and transforms the data into intervent time form and stores the resulting dataframe in **output_file**.
