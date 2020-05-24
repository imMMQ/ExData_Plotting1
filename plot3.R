powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = '?')
TimenDate <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
powerdata <- cbind(powerdata, TimenDate)

powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power, na.rm = TRUE)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power, na.rm = TRUE)
powerdata$Voltage <- as.numeric(powerdata$Voltage, na.rm = TRUE)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity, na.rm = TRUE)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1, na.rm = TRUE)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2, na.rm = TRUE)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3, na.rm = TRUE)

subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")
png("plot3.png", width=480, height=480)
## make a 3-in-1 plot with legend
plot(subsetdata$TimenDate, subsetdata$Sub_metering_1, col = "black", type = "l", xlab = " ", ylab = "Energy sub metering")
lines(subsetdata$TimenDate, subsetdata$Sub_metering_2, col = "red")
lines(subsetdata$TimenDate, subsetdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty= 1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

