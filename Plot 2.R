#READING THE DATA
data <- read.table("../Electricity Dataset/household_power_consumption.txt", 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   skip = 66637, nrows = 2880, sep = ";", na.strings = "?")


#Creating weekdays
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Opening the png file device
png(filename = "./Plot 2.png", height = 480, width = 480)

#Creating the required density plot
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#Closing the png file device
dev.off()