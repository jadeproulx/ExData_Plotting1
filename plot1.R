## Read data and convert Date and Time columns to appropriate data types.
household_power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = 66636, nrow=2879)
household_power$Date <- strptime(paste(household_power$Date,household_power$Time), "%d/%m/%Y %H:%M:%S")

# Make plot
hist(household_power$Global_active_power, col="red", main="Globlal Active Power", xlab="Global Active Power (kilowatts)", cex.axis=0.75, cex.lab=0.75, cex.main=0.9)

## Copy plot to a png file. 
dev.copy(png, file = "plot1.png")
dev.off()