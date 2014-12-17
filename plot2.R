setwd("~/Statistics/Johns Hopkins Coursera course/Exploratory Data Analysis/Project 1") # set working directory
rm(list=ls())
#Read in the raw data
rawdat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# load dplyr to use filter, etc
library(dplyr)

# convert Date column which imports as a "factor", to a date.  Notice correct formatting for as.Date arguments
rawdat$Date <- as.Date(rawdat$Date, "%d/%m/%Y")

# cut down the data set 
# NOTE:  had to enclose the dates in quotes, in the format of the data frame to make this work!  

smalldat <- filter(rawdat, Date == "2007-02-01" | Date == "2007-02-02")

attach(smalldat)

# Convert the Global active power column to numeric 
Global_active_power <- as.numeric(Global_active_power)

# Divide GAP by 500 to get the correct X axis scale 
x <- Global_active_power/500

# create a column of date and time together
smalldat$dattim <- as.POSIXlt(paste(Date, Time), "%Y-%m-%d %H:%M:%S", tz = "America/Los_Angeles")

#the main plot function
plot(dattim, x, yaxt = "n", type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", cex.lab = 0.65, cex.axis = 0.65)
     axis(2, at=c(0, 2, 4, 6))

png(filename ="plot2.png", width = 480, height = 480, restoreConsole = TRUE, type = "cairo")
dev.off()
class(Sub_metering_1)
