###############################
# Analysis script
#
#this script loads the processed, cleaned data, does a simple analysis
#and saves the results to the results folder

#Load needed packages
library(tidyverse)
ibrary(ggplot2) #for plotting
library(broom) #for cleaning up output from lm()
library(here) #for data loading/saving
library(tidymodels)

#Path to Feeder Data
#note the use of the here() package and not absolute paths
data_location_FD <- here::here("data","processed_data","FDprocessed.RDS")

#Lets do the same for the Picnic Table Data 
data_location_PT <- here::here("data","processed_data","PTprocessed.RDS")

#Let's load the data we saved above  
FD_Data <-readRDS(data_location_FD)

PT_Data <-readRDS(data_location_PT)

######################################
#Data fitting/statistical analysis
######################################

############################
#### First model fit
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

############################
#### Second model fit

# I will do the same as above, however, I am now adding persistence pile
lmfit2 <- lm(Original_Persistence_Pile~Table+Salmonella_Positive, PT_Data) 
plot(lmfit2)

# Convert to a data frame via tidy function
lmtable2 <- broom::tidy(lmfit2)

#Results
print(lmtable2)

#Save  
Table2_PD = here("results", "PD_results_table2.rds")
saveRDS(lmtable2, file = "Table2_PD")

#Doing the same for Feeder Data

# I will do the same as above, however, I am now adding persistence pile
lmfit4 <- lm(Absence_0_Presence_1~Feeder_number, FD_Data) 
plot(lmfit4)

# Convert to a data frame via tidy function
lmtable4 <- broom::tidy(lmfit4)

#Results
print(lmtable4)

#Save  
Table4_PD = here("results", "PD_results_table4.rds")
saveRDS(lmtable4, file = "Table4_PD")

#Let's Start with Defining our model 
#Because both out data is continuous, I am going to use a linear regression model

#After the LR, I will create my recipe, create my workflow, create model using the workflow 

#And finally try the model on data
