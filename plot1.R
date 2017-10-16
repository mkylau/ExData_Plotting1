######################################################
# Coursera: Data Science - Exploratory Data Analysis
# Week 1 Assignment
# Plot 1
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

## Plot 1
png(file = "plot1.png", width=480, height=480, units="px")
with(data_subset, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=1))

## Export to png @ 480x480, plog1.png
dev.off()
