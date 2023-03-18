###############################
# Processing Picnic Table and Feeder Data Script
#
# The script I use below will load the raw data, process and clean it for both. 
# The picnic table data and the feeder data will also be saved as a RDS file in the processed_data folder
# I will also include full text and code in my manuscript in the meantime. 
#
# KP USE AS REFERENCE AS YOU ARE COMPLETING PROJECT https://bookdown.org/yihui/rmarkdown-cookbook/read-chunk.html


## ---- Packages --------
# Let's load a few R packages for processing
library(knitr)
library(dplyr) #Loading in for data cleaning
library(readxl) #This will load in excel files (picnic table )
library(here) #Very important as this will circumvent any absolute path issues, makes more reproducible, easily set paths

## ---- Load Picnic Table Data --------
PTD<- read_excel(here("data", "raw_data", "Picnic_Table_Data.xlsx"))

## ---- ExploreData --------
# Let's take a look at the data we just loaded in
View(PTD)

summary(PTD)

glimpse(PTD)

## ---- Clean Picnic Table Data --------
# There is a lot to clean here, overall the excel seems a bit messy and disorganized. 
# I want to replace NAs
# I want to keep the dates, type of sample persistence/pooled, 
# and samples that were positive
# I would like to rename some columns 
# Before I move on to visualizing, I will check how the cleaned data looks.
PTD1<- PTD %>% select(-c(Day, `Shippng Date`, Notes, `STAB TUBE NUMBER`, `ORIGIN OF FECES`, ...13)) #Removing columns

PTD1$`Original PP still intact?`<- ifelse(PTD1$`Original PP still intact?`=="Yes", 1, 0)

PTD2<- PTD1 %>% 
  mutate(`Original PP still intact?` = ifelse(is.na(`Original PP still intact?`), 0, `Original PP still intact?`)) #NAs to 0 for column `Original PP still intact?`

PTD3<- PTD2 %>% 
  mutate(`Pos orNeg`= ifelse(is.na(`Pos orNeg`), 0, `Pos orNeg`)) #NAs to 0 for column `Pos orNeg`

glimpse(PTD3) #Current variable names

PTD_clean<- PTD3 %>% #Renaming column names
  rename(
    ID= `Sample ID`,
    Sample_Type= `Sample Type (Pooled or Persistence)`,
    Salmonella_Positive= `Pos orNeg`,
    Original_Persistence_Pile= `Original PP still intact?`)

glimpse(PTD_clean)

## ---- Save the Data! --------
# Cleaned data looks much better
# I would like to pick a location to save this portion as a file
# Here I will save the file as an RDS to the processed data file
# I will name the file PTprocessed
saveRDS(PTD_clean, file= "data/processed_data/PTprocessed.RDS")


#Let's do it all again, this time with the Feeder data

## ---- Packages --------
# Let's load a few R packages for processing
library(readr) #Easy to get data from csv files

## ---- Load Feeder Data Here --------
FD<- read_csv(here("data", "raw_data", "Feeder Data.csv"))

## ---- Explore Data --------
# Let's take a look at the data we just loaded in

View(FD)

summary(FD)

str(FD)

glimpse(FD)

## ---- Clean Feeder Data --------
# Unlike the picnic table data, this is a fairly short dataset
# I think we can clean this with a few lines of code
FD1<- FD %>% select(-c(`Absence (0)/Presence (1)`, `...5`)) #Removing columns

glimpse(FD1) #Quick glimpse at the data, I can determine if I should wrangle the data a bit more

FD_clean<- FD1 #Data looked clean so I will rename it to use with my data exploration and visualization process below 

## ---- Save the Data! --------
# Cleaned data looks good
# I would like to pick a location to save this portion as a file
# Here I will save the file as an RDS to the processed data file
# I will name the file FDprocessed
saveRDS(FD_clean, file= "data/processed_data/FDprocessed.RDS")

