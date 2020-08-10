#READING THE DATA
data <- read.table("../Electricity Dataset/household_power_consumption.txt", 
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                                 "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   skip = 66637, nrows = 2880, sep = ";", na.strings = "?")

#Opening the png file device
#The default size of the png image in r is 480x480 pixels so no need to give extra attributes
png(filename = "./Plot 1.png")

#Creating the histogram with necessary attributes
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Closing the file device
dev.off()