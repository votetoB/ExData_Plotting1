library(data.table)
DT <- fread("household_power_consumption.txt", header = T, na.strings = c("?"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT <- DT[DT$Date >= as.Date("2007-02-01") & DT$Date <= as.Date("2007-02-02"), ]

DT$Datetime <- as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")


png(width = 480, height = 480, units = "px", filename = "plot4.png")

par(bg = rgb(0,0,0,0))
par(mfrow = c(2,2))
plot(DT$Datetime, DT$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(DT$Datetime, DT$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(DT$Datetime, DT$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(DT$Datetime, DT$Sub_metering_1, type = "l", col = "black")
points(DT$Datetime, DT$Sub_metering_2, type = "l", col = "red")
points(DT$Datetime, DT$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-")
plot(DT$Datetime, DT$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Gloabal_reactive_power")
dev.off()