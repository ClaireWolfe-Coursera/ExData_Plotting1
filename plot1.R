## Read the power table from the current working directory.  Get the subset of rows for dates
## February 1 and 2, 2007.
powertable <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                         na.strings = c("?"))
power <- subset(powertable, Date == "1/2/2007" | Date == "2/2/2007")

## Open a PNG device to send the plot to the specified directory in the current working directory.
## NOTE: the width and height default to 480 pixels, as required in the directions.
png("plot1.png")

## Create a histogram of the Global_active_power column.
hist(power$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Close the device.
dev.off()