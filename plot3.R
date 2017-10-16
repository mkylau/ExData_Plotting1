######################################################
# Coursera: Data Science - Exploratory Data Analysis
# Week 1 Assignment
# Plot 3
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

## Plot 3, PNG
png(file = "plot3.png", width=480, height=480, units="px")
with(data_subset, {
        plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="", cex=0.8)
        lines(Sub_metering_2~DateTime, col='Red')
        lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="1", col=c("black", "red", "blue"), lwd=2, cex=0.8)

## Export to png @ 480x480, plog3.png
dev.off()