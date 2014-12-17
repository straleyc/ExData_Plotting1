setwd("~/Statistics/Johns Hopkins Coursera course/Exploratory Data Analysis/Project 1") # set working directory

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

# Divide GAP by 1000 to get kilowatts and get the correct X axis scale 
x <- Global_active_power/500

# main plot specifications for GAP
# note:  xaxt = "n" removes x-axis so it can be redefined in the next line
hist(x, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red", xlim = c(0,6), xaxt = "n", breaks = 13, cex.lab = 0.65, cex.axis = 0.65)
#specify x axis tick marks 
axis(1, at=c(0, 2, 4, 6))

#save the output file as a png file in the working directory

png(filename ="plot1.png", width = 480, height = 480)
dev.off()
