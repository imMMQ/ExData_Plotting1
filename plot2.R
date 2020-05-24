## Assumes household_power_consumption.txt file located in your working directory
## read the data file
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";", na.strings = '?')
## Create column in the table with date and time merged together, and then conbine the new colum with the whole table
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
png("plot2.png", width=480, height=480)
plot(subsetdata$TimenDate, subsetdata$Global_active_power, xlab = " ", ylab = "Global active power (kilowatts)", type = "l")
dev.off()



