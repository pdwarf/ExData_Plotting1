#Load data into R
setwd("~/Data Science Specialization/Exploratory Data Analysis/Week 1 Assignment/")
household_data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Change the Date and Time columns from factor to one POSIXlt class, create a Date2 column in format of Date
household_data$Datetimes <- strptime(paste(household_data$Date,household_data$Time), format = "%d/%m/%Y %H:%M:%S", tz = "GMT")
household_data$Date2 <- household_data$Date2 <- as.Date(household_data$Date, format ="%d/%m/%Y")

#Create a subset from Feb 1st to Feb 2nd 2007
household_data_2d <- subset(household_data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

#Saving Plot 1 as a png
png("plot1.png", width = 480, height = 480, units = "px")
hist(household_data_2d$Global_active_power, col = "red", main = "Global active power", xlab = "Global active power (kilowatts)", ylab = "Frequency")
dev.off()