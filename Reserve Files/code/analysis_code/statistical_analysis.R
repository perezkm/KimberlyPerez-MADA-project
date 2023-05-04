###############################
# Analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder

#Load needed packages
library(tidyverse)
library(ggplot2) #for plotting
library(broom) #for cleaning up output from lm()
library(here) #for data loading/saving
library(tidymodels)
library(tidyr)
library(gtsummary)
library(dplyr)
library(vip)
library(performance)
library(jtools)
library(broom)
library(broom.mixed)

#Path to Feeder Data
#note the use of the here() package and not absolute paths
data_location_FD <- here::here("data","processed_data","FDprocessed.RDS")

#Lets do the same for the Picnic Table Data 
data_location_PT <- here::here("data","processed_data","PTprocessed.RDS")

#Let's load the data we saved above  
FD_Data <-readRDS(data_location_FD)

PT_Data <-readRDS(data_location_PT)


glimpse (FD_Data)

glimpse(PT_Data)
######################################
#Data fitting/statistical analysis
######################################

############################
### Let's Begin with Some Linear Model Fitting; I will try this multiple ways, with several predictors!
lmog<-linear_reg() %>% 
  set_engine("lm")

lmfit_PT<- lmog %>% #Training; outcome: Salmonella Pos and Main Predictor Table
  fit(Salmonella_Positive~Table, PT_Data) 

lmfit_PT

glimpse(lmfit_PT)

#Way 1
glance(lmfit_PT)

#Way 2
tidy(lmfit_PT)

TableTidy_PT= here("results", "PD_results_TableTidy.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmfit_PT, file = "TableTidy_PD")

plot_summs(lmfit_PT)

PlotSum_PD1= here("results", "PD_results_PlotSum.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmall_PT, file = "PlotSum1_PD")

#Fitting other specific indicators
lmog_1<-linear_reg() %>% 
  set_engine("lm")

lmfit_PT1<- lmog_1 %>% #Training; outcome: Salmonella Pos and Main Predictor Table
  fit(Salmonella_Positive~Original_Persistence_Pile+Table, PT_Data) 

lmfit_PT1

glimpse(lmfit_PT1)

#Way 1
glance(lmfit_PT1)

#Way 2
tidy(lmfit_PT1)

plot_summs(lmfit_PT1)

#Trying ALL predictors of Picnic Table dataset 
lmog_PT<- linear_reg() %>%
  set_engine("lm")

lmall_PT<- lmog_PT %>% #Training 
  fit(Salmonella_Positive~., data=PT_Data)

lmall_PT

tidy(lmall_PT)

plot_summs(lmall_PT, robust=TRUE) #KP NOTE: I need to clean this up so it is a bit more readable, must fullscreen it

PlotSum_PD1= here("results", "PD_results_PlotSum.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmall_PT, file = "PlotSum1_PD")

#### Model fit another way
# fit linear model using Salmonella_Pos as outcome, Table as predictor
lmfit3.0 <- lm(Salmonella_Positive~Table, PT_Data) 
lmfit3.0
plot(lmfit3.0)

# Here we place results from the above fit into a data frame via tidy function
lmtable1 <- broom::tidy(lmfit3.0)

#Let's check out the results
print(lmtable1)

# save fit results table  
Table1_PD= here("results", "PD_results_table.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmtable1, file = "Table1_PD")

#A different way Part Deux 
# I will do the same as above, however, I am now adding persistence pile
lmfit2 <- lm(Salmonella_Positive~Original_Persistence_Pile+Table, PT_Data) 
plot(lmfit2)

# Convert to a data frame via tidy function
lmtable2 <- broom::tidy(lmfit2)

#Results
print(lmtable2)

#Save  
Table2_PD = here("results", "PD_results_table2.rds")
saveRDS(lmtable2, file = "Table2_PD")

############################
#### Second model fit

#Doing the same for FEEDER DATA
lmog_FD<-linear_reg() %>% 
  set_engine("lm")

lmfit_FD<- lmog_FD %>% #Training; outcome: Salmonella Pos and Main Predictor Table
  fit(Absence_0_Presence_1~Feeder_number, FD_Data) 

lmfit_FD

glimpse(lmfit_FD)

#Way 1
glance(lmfit_FD)

#Way 2
tidy(lmfit_FD)

TableTidy_FD= here("results", "FD_results_TableTidy.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmfit_FD, file = "TableTidy_FD")

plot_summs(lmfit_FD)

PlotSum_FD1= here("results", "FD_results_PlotSum.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmfit_FD, file = "PlotSum1_FD")

#More fitting with some other indicators

lmog_FD2<-linear_reg() %>% 
  set_engine("lm")

lmfit_FD2<- lmog_FD2 %>% #Training; outcome: Salmonella Pos and Main Predictor Table
  fit(Absence_0_Presence_1~Feeder_number+Feeder_Type, FD_Data) 

lmfit_FD2

glimpse(lmfit_FD2)

#Way 1
glance(lmfit_FD2)

#Way 2
tidy(lmfit_FD2)

TableTidy_FD2= here("results", "FD_results_TableTidy2.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmfit_FD2, file = "TableTidy_FD2")

plot_summs(lmfit_FD2)

PlotSum_FD2= here("results", "FD2_results_PlotSum.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmfit_FD2, file = "PlotSum2_FD")

#Trying ALL predictors of Feeder dataset 
lmog_FD<- linear_reg() %>%
  set_engine("lm")

lmall_FD<- lmog_FD %>% #Training 
  fit(Absence_0_Presence_1~., data=FD_Data)

lmall_FD

tidy(lmall_FD)

plot_summs(lmall_FD, robust=TRUE) #KP NOTE: I need to clean this up so it is a bit more readable, must fullscreen it

PlotSum_FDALL= here("results", "FD_results_PlotSumALL.rds") #KP Double check path going to MADA Project not folder
saveRDS(lmall_FD, file = "PlotSumALL_FD")

#Let's Start with Defining our model 
#Because both out data is continuous, I am going to use a linear regression model

#After the LR, I will create my recipe, create my workflow, create model using the workflow 

#And finally try the model on data
