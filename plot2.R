# Coursera Course - Exploratory Data Analysis Week 1 Course Project
# To generate plot2.png, a line graph of global active power
# by different time in the two-day period (2007-02-01 and 2007-02-02)

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

# Plot line graph of global active power by day of week
png("plot2.png", width = 480, height = 480)

plot(x = elec_power$datetime, 
     y = elec_power$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

dev.off()
