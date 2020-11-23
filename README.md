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

* **model.fit(data, distribution, method)**: This methods takes distribution as input and fits the paramters using methods("mle/mme") on given data.

### Supported Distributions by model.fit:
1. Weibull Distribution (pass as "weibull")
2. Gamma Distribution (pass as "gamma")
3. Exponential Distribution (pass as "exp")
4. Inverse Gaussian Distribution (pass as "invgauss")
5. Log-normal Distribution (pass as "lnorm")
6. Normal Distribution (pass as "norm")
7. Inverse Weibull Distribution (pass as "invweibull")
8. Pareto Distribution (pass as "pareto")
9. Chi-Squared Distribution (pass as "chisq")
10. Geometric Distribution (pass as "geom")
11. Exponentiated Weibull (mle only) (pass as "expweibull")
12. Exponentiated Exponential (mle only) (separate code, not to be passed to model.fit) REMOVED as its a 
                                                                                        special case of expweibull
