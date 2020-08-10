#READING THE DATA
data <- read.table("../Electricity Dataset/household_power_consumption.txt", 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   skip = 66637, nrows = 2880, sep = ";", na.strings = "?")

#Opening the png file device
png(filename = "./Plot 4.png")

#Creating weekdays
datetime <- strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#Creating the required plot
par(mfcol = c(2,2))
#First subplot
plot(datetime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
#second subplot
plot(datetime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
lines(datetime, data$Sub_metering_1, col = "black")
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
#Third subplot
plot(datetime, data$Voltage, ylab = "Voltage", type = "l")
#Fourth subplot
plot(datetime, data$Global_reactive_power, type = "l")

#Closing the graphics device
dev.off()