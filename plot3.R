#### Read the power table from the current working directory.  Get the subset of rows for dates
## February 1 and 2, 2007.
powertable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                         na.strings = c("?"))
power <- subset(powertable, Date == "1/2/2007" | Date == "2/2/2007")

## Create a vector of Date-time values from Date and Time columns.
datetime <- paste(power[, "Date"], power[, "Time"])
dt <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

## Add that vector as a column in the power table.
power$DateTime <- dt

## Open a PNG device to send the plot to the specified directory in the current working directory.
## NOTE: the width and height default to 480 pixels, as required in the directions.
png("plot3.png")

## Create the plot of the three sub metering values over time.  First set up the plot, then add 
## each set of values.
plot(power$DateTime, power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_1)
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")

## Create a legend.
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

## Close the device.
dev.off()