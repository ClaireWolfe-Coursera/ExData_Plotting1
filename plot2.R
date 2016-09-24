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
png("plot2.png")

#Create the plot of global active power over time.
plot(power$DateTime, power$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

## Close the device.
dev.off()