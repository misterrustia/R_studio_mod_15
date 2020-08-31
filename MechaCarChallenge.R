

?slice_sample()

population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F) #import used car dataset
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

sample_table <- population_table %>% sample_n(50) #randomly sample 50 data points
plt <- ggplot(sample_table,aes(x=log10(Miles_Driven))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot


?t.test()


t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means


sample_table <- population_table %>% sample_n(50) #generate 50 randomly sampled data points

sample_table2 <- population_table %>% sample_n(50) #generate another 50 randomly sampled data points

t.test(log10(sample_table$Miles_Driven),log10(sample_table2$Miles_Driven)) #compare means of two samples

mpg_data <- read.csv('mpg_modified.csv')
mpg_1999 <- mpg_data %>% filter(year==1999)
mpg_2008 <- mpg_data %>% filter(year==2008)

t.test(mpg_1999$hwy,mpg_2008$hwy,paired = T) #compare the mean difference between two samples

?aov()
mtcars_filt <- mtcars[,c("hp","cyl")] #filter columns from mtcars dataset
mtcars_filt$cyl <- factor(mtcars_filt$cyl) #convert numeric column to factor
aov(hp ~ cyl,data=mtcars_filt) #compare means across multiple levels
summary(aov(hp ~ cyl,data=mtcars_filt))
?cor()
head(mtcars)

plt<- ggplot(mtcars,aes(x=hp,y=qsec))
plt + geom_point()
#7.1 correlations
cor(mtcars$hp,mtcars$qsec)

used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)

head(used_cars)
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price))
plt + geom_point()

cor(used_cars$Miles_Driven,used_cars$Selling_Price)
?as.matrix()

used_matrix <- as.matrix(used_cars[c("Selling_Price","Present_Price", "Miles_Driven")])
head(used_matrix)
cor(used_matrix)
tail(used_matrix)
tail(used_cars)

?lm()
lm(qsec ~hp,mtcars)
summary(lm(qsec~hp,mtcars))

model <-lm(qsec~hp,mtcars)
yvals<-model$coefficients['hp']*mtcars$hp +model$coefficients['(Intercept)'] 
# determine y-axis values from linear regression?


plt<- ggplot(mtcars,aes(x=hp,y=qsec))
plt +geom_point() + geom_line(aes(y=yvals),color = "green")
?coefficients

#multiple linear regression

lm(qsec~ mpg +disp +drat+wt+hp,data=mtcars)
summary(lm(qsec~ mpg +disp +drat+wt+hp,data=mtcars))


#8.1

?chisq.test()

table(mpg$class,mpg$year)

chisq.test(table)
tbl <- table(mpg$class,mpg$year)
chisq.test(tbl)

head(mtcars)

table(mtcars$mpg,mtcars$vs)
tbl1<-table(mtcars$mpg,mtcars$vs)
chisq.test(tbl1)
head(used_cars)
# last things above for example 


demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)

numlist <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)

demo_table <- read.csv(file='demo.csv',check.names=F,stringsAsFactors = F)
# begging set up librarys below 
library(jsonlite)

library(tidyverse)


##
# start here
##

library(jsonlite)
library(tidyverse)

mechaCar1 <- read.csv(file = 'MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(mechaCar1)

## example 
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model
## intial attempt 
lm(mpg ~vehicle weight, data=mechaCar1)
?lm()

str(mechaCar1)
df <- data.frame(mechaCar1)
head(df)
lm(mpg ~vehicle.length, data = df )

str(df)
## got it run lm once I changed mechacar1 to a df - whats the difference ?

summary(lm(mpg ~vehicle.length, data = df ))

mpg_vlength <- lm(mpg ~vehicle.length, data = df )

plt <-ggplot(mpg_vlength,aes(x=vehicle.length,y=mpg))
plt + geom_line()# line comes out but not pretty 
plt + geom_point() #point looks much better 
yvals <- mpg_vlength$coefficients['']


##
##
## example of how to make line plot for single regression
> model <- lm(qsec ~ hp,mtcars) #create linear model
> yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] #determine y-axis values from linear model
> plt <- ggplot(mtcars,aes(x=hp,y=qsec)) #import dataset into ggplot2
> plt + geom_point() + geom_line(aes(y=yvals), color = "red") #plot scatter and linear model


## multiple regression attempt
lm(mpg ~ vehicle.length+vehicle.weight+ground.clearance,data=df)
summary(lm(mpg ~ vehicle.length+vehicle.weight+ground.clearance,data=df))

##looking into vehicle weight 
lm(mpg~vehicle.weight,data=df )
summary(lm(mpg~vehicle.weight,data=df ))
plt <- ggplot(df,aes(x=vehicle.weight,y=mpg))
plt +geom_point()
## graph clearly backs up there is no connection between points and weight

lm(mpg~ spoiler.angle,data=df)
summary(lm(mpg~ spoiler.angle,data=df))

lm(mpg~ AWD, data =df)
summary(lm(mpg~ AWD, data =df))

## final multipe regression

lm(mpg~vehicle.length+ground.clearance,data=df)
summary(lm(mpg~vehicle.length+ground.clearance,data=df))



lm(mpg~vehicle.length,data=df)
summary(lm(mpg~vehicle.length,data=df)) 
length_factor<-lm(mpg~vehicle.length,data=df)
plt<- ggplot(length_factor,aes(x=vehicle.length,y=mpg))


plt +geom_point()


## suspension coil test 
suspension_coil<- read.csv(file = 'Suspension_Coil.csv')
head(suspension_coil)
summarise(suspension_coil)
summary(suspension_coil)
tail(suspension_coil)

?group_by()

man_lot_groups<-suspension_coil %>% group_by(Manufacturing_Lot)
head(man_lot_groups)
tail(man_lot_groups)

man_lot_groups %>%summarise(mean=mean(PSI),variance=var(PSI),sd=sd(PSI))


suspension_coil%>%summarise(mean=mean(PSI),variance=var(PSI),sd=sd(PSI))

t.test(suspension_coil$PSI,mu=1500)

t.test(subset(suspension_coil,Manufacturing_Lot=="Lot1")$PSI,mu=1500)

t.test(subset(suspension_coil,Manufacturing_Lot=="Lot2")$PSI,mu=1500)

t.test(subset(suspension_coil,Manufacturing_Lot=="Lot3")$PSI,mu=1500)


