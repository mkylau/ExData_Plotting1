######################################################
# Coursera: Data Science - Exploratory Data Analysis
# Week 1 Assignment
# Plot 4
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

## Plot 4, PNG
png(file = "plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
with(data_subset, {
        #add subplot 1
        plot(Global_active_power~DateTime, type="l", ylab="Global Active Power", xlab="", cex=0.8)
        #add subplot 2
        plot(Voltage~DateTime, type="l", ylab="Voltage", xlab="datetime", cex=0.8)
        #add subplot 3
        plot(Sub_metering_1~DateTime, type="l", ylab="Energy sub metering", xlab="", cex=0.8)
        #add lines to subplot 3
        lines(Sub_metering_2~DateTime, col='Red')
        lines(Sub_metering_3~DateTime, col='Blue')
        #add legend to subplot 3
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",col=c("black","red","blue"),lwd=2,cex=0.8)
        #add subplot 4
        plot(Global_reactive_power~DateTime, type="l", ylab="Global_reactive_power", xlab="datetime", cex=0.9)

})

## Export to png @ 480x480, plog4.png
dev.off()