# Coursera Course - Exploratory Data Analysis Week 1 Course Project
# To generate plot1.png, a histogram showing global active power
# in the two-day period (2007-02-01 and 2007-02-02)

# Author: Jie Cao
# Date: Nov 2, 2020

# Load libraries
library(readr)
library(dplyr)
library(lubridate)

# Read raw data
elec_power <- read_delim("household_power_consumption.txt", delim = ";", na = "?")

# Filter by dates
elec_power$Date <- as.Date(elec_power$Date, "%d/%m/%Y")
elec_power <- elec_power %>% 
  filter(Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

# Plot histogram of global active power
png("plot1.png", width = 480, height = 480)

hist(elec_power$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Glabal Active Power")

dev.off()
