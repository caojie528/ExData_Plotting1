# Coursera Course - Exploratory Data Analysis Week 1 Course Project
# To generate plot4.png, a panel of four plots showing different information
# at different time of the two-day period (2007-02-01 and 2007-02-02):
# a line graph global active power by time
# a line graph of voltage by time
# a series of line graph of energy by each sub metering by time
# a line graph of global reactive power by time

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
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# subplot 1
plot(elec_power$datetime, 
     elec_power$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

# subplot 2
plot(elec_power$datetime, 
     elec_power$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

# subplot 3
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
       bty = "n", 
       cex = 0.5)

# subplot 4
plot(elec_power$datetime, 
     elec_power$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()

