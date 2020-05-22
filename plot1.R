## Assumes household_power_consumption.txt file located in your working directory
## read the data file
powerdata <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")
## change class of all columns to correct class
powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y")
powerdata$Time <- format(powerdata$Time, format="%H:%M:%S")
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power, na.rm = TRUE)
powerdata$Global_reactive_power <- as.numeric(powerdata$Global_reactive_power, na.rm = TRUE)
powerdata$Voltage <- as.numeric(powerdata$Voltage, na.rm = TRUE)
powerdata$Global_intensity <- as.numeric(powerdata$Global_intensity, na.rm = TRUE)
powerdata$Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1, na.rm = TRUE)
powerdata$Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2, na.rm = TRUE)
powerdata$Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3, na.rm = TRUE)
## subset for data taken from 2 days: 2007-02-01 and 2007-02-02
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02")
## plot histogram of global active power for those 2 days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global Active Power")
dev.off()
