# R_studio_mod_15

challenge write up 

MPG regression -

Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

-from MechaCarChallenge.R- -summary(lm(mpg~vehicle.length+ground.clearance,data=df))- 

I found that vehile length and ground clearance were the two indipendent variables that had significant p values
of 3.67e -12. which is much lower than .05 allowing us to reject the null hypothiesis that the values would be replicated with random data. 
the R squared value from the summary of the linear regression was 0.674, which mean 67 % of the y points could be 
connected to a relationship between the dependent and indipendent variables. 

Vehicle wieght had a p value of .53, thus the null hypotheis could not be rejected. The R squared value between 
the two variables was .008 which means less thatn one percent of the points could be accounted to the variables relationship
even if the p value was low enough to reject the null so vehicle weight was removed from the multiple liner regression of mpg. 


Is the slope of the linear model considered to be zero? Why or why not?
The slope is not thought to be zero as there was x values for each indipendent variable in the multiple linear regression. 

Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

I think the p value and the R squared stated about are enough to say the model can make accurate predicitons


Suspension Coil summary -

-from MechaCarChallenge.R-
man_lot_groups %>%summarise(mean=mean(PSI),variance=var(PSI),sd=sd(PSI))
`summarise()` ungrouping output (override with `.groups` argument)
# A tibble: 3 x 4
  Manufacturing_Lot  mean variance    sd
  <fct>             <dbl>    <dbl> <dbl>
1 Lot1              1500.     1.15  1.07
2 Lot2              1500.    10.1   3.18
3 Lot3              1499.   220.   14.8 

Mean and Mediam for all three lots 
Mean :1500
Median :1500
Variance : when broken into the 3 lots the variance of 
lot 1 was 1.15 
lot 2 was 10.1 
lot 3 was 220. 
Standard deviation of the three lots were as follows 
lot 1 was 1.07
lot 2 was 3.18
lot 3 was 14.8 

The design specifications for the MechaCar suspension coils dictate that the variance 
of the suspension coils must not exceed 100 pounds per inch. Does the current manufacturing data
 meet this design specification? Why or why not?

no, the third lot has a lot of 220 which exceeds the limit of 100 pounds per inch. some suspension coils would 
could be shipped with twice the alloud limitations and must be corrected before produciton. 

interpretation and findings for the t-test results. 
from the data below where a t-test was done on each lot we can see that the p value for all of them 
is abouve .05 and there is no significant different between the mean of the sample lot and the population.


    One Sample t-test

data:  subset(suspension_coil, Manufacturing_Lot == "Lot1")$PSI
t = 0.12028, df = 49, p-value = 0.9048
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.714 1500.322
sample estimates:
mean of x 
 1500.018 
 	
     One Sample t-test

data:  subset(suspension_coil, Manufacturing_Lot == "Lot2")$PSI
t = -0.95324, df = 49, p-value = 0.3451
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1498.666 1500.476
sample estimates:
mean of x 
 1499.571 

One Sample t-test

data:  subset(suspension_coil, Manufacturing_Lot == "Lot3")$PSI
t = -0.47484, df = 49, p-value = 0.637
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1494.789 1503.219
sample estimates:
mean of x 
 1499.004 



Design Your Own Study -

Think critically about what metrics you would think would be of 
interest to a consumer (cost, fuel efficiency, color options, etc.).



Determine what question we would ask, what the null and alternative hypothesis 
would be to answer that question, and what statistical test could be used to test this hypothesis.

I would ask if there were more car trims available for a specfic care would there be more sales. I would want
to collect sales data over time for multiple different cars for multiple different makers. I would want to sales data
seperated by trim for each car. The Null hypothesis would be that there is no difference between sales and amount of trims
the alternative would be there is a correlation between the amount of car trims available for a vehicle and the 
amount of sales for that vehicle. Once the data was collected I would want to run a linear regression with trim and possibly cost as the 
indipendent and sales as the dependent to see if there is a significant connection between them depending on the R squared
and p value. The next thing to do would to run two sample t-test to see if the is a statistical significant difference between the 
means of the different models relationship between amound of trims available and the sales. 


