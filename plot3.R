# Coursera Course - Exploratory Data Analysis Week 1 Course Project
# To generate plot3.png, a line graph of energy by different sub metering
# at different time in the two-day period (2007-02-01 and 2007-02-02)

# Author: Jie Cao
# Date: Nov 2, 2020

# Load libraries
library(readr)
library(dplyr)
library(lubridate)

# Read raw data
elec_power <- read_delim("household_power_consumption.txt", delim = ";", na = "?")

# Filter by dates and create date_time
elec_power$Date <- as.Date(elec_power$Date, "%d/%m/%Y")
elec_power <- elec_power %>% 
  filter(Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02")) %>% 
  mutate(datetime = strptime(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S"))

# Plot line graph of energy by different sub metering
png("plot3.png", width = 480, height = 480)

plot(elec_power$datetime, 
     elec_power$Sub_metering_1,
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(elec_power$datetime, 
      elec_power$Sub_metering_2, 
      col = "red")
lines(elec_power$datetime, 
      elec_power$Sub_metering_3, 
      col = "blue")
legend("topright", 
       col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1), 
       lwd = c(1, 1))

dev.off()

