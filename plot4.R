#Load data into R
setwd("~/Data Science Specialization/Exploratory Data Analysis/Week 1 Assignment/")
household_data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Change the Date and Time columns from factor to one POSIXlt class, create a Date2 column in format of Date
household_data$Datetimes <- strptime(paste(household_data$Date,household_data$Time), format = "%d/%m/%Y %H:%M:%S", tz = "GMT")
household_data$Date2 <- household_data$Date2 <- as.Date(household_data$Date, format ="%d/%m/%Y")

#Create a subset from Feb 1st to Feb 2nd 2007
household_data_2d <- subset(household_data, Date2 >= as.Date("2007-02-01") & Date2 <= as.Date("2007-02-02"))

#Saving Plots 1-4 as a png

png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(household_data_2d, plot(Datetimes, Global_active_power, type = "l", xlab = "", ylab = "Global active power"))
with(household_data_2d, plot(Datetimes, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(household_data_2d, plot(Datetimes, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(household_data_2d, lines(Datetimes, Sub_metering_2, col = "red"))
with(household_data_2d, lines(Datetimes, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), pch = 20)
with(household_data_2d, plot(Datetimes, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()