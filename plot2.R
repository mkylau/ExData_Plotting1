######################################################
# Coursera: Data Science - Exploratory Data Analysis
# Week 1 Assignment
# Plot 2
# By: Matthew Lau
# October 15, 2017
######################################################

library(lubridate)
library(dplyr)

#download and unzip file
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename <- "household_power_consumption.zip"
download.file(url, destfile=filename)
unzip(zipfile=filename, overwrite = TRUE)

#read data
dataset <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
dataset$DateTime <- dmy_hms(paste(dataset$Date, dataset$Time))
dataset$Date <- dmy(dataset$Date)
dataset$Time <- hms(dataset$Time)

#subset required data only ()
data_subset <- dataset %>% filter(year(Date) == 2007 & month(Date) %in% c(2), day(Date) %in% c(1,2))

## Plot 2
png(file = "plot2.png", width=480, height=480, units="px")
with(data_subset, plot(Global_active_power~DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

## Export to png @ 480x480, plog2.png
dev.off()