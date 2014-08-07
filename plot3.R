## Read data and convert Date and Time columns to appropriate data types.
household_power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = 66636, nrow=2879)
household_power$Date <- strptime(paste(household_power$Date,household_power$Time), "%d/%m/%Y %H:%M:%S")

## Make plot
plot(household_power$Date,household_power$Sub_metering_1, xlab = "", ylab="Energy sub metering", type="n", cex.axis=0.75, cex.lab=0.75)
lines(household_power$Date, household_power$Sub_metering_1)
lines(household_power$Date, household_power$Sub_metering_2, col = "red")
lines(household_power$Date, household_power$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), cex=0.75)

## Copy plot to a png file.
dev.copy(png, file = "plot3.png")
dev.off()