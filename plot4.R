data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
summary(data)
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(subsetdata$Global_active_power)

par(mfrow = c(2,2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
voltage <- as.numeric(subsetdata$Voltage)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")


plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalreactivepower <- as.numeric(subsetdata$Global_reactive_power)
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, globalreactivepower, xlab = "datetime", ylab ="Global_reactive_power", cex =0.2)
