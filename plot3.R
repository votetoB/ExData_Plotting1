library(data.table)
DT <- fread("household_power_consumption.txt", header = T, na.strings = c("?"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT <- DT[DT$Date >= as.Date("2007-02-01") & DT$Date <= as.Date("2007-02-02"), ]

DT$Datetime <- as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")


png(width = 480, height = 480, units = "px", filename = "plot3.png")

par(bg = rgb(0,0,0,0))

plot(DT$Datetime, DT$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(DT$Datetime, DT$Sub_metering_1, type = "l", col = "black")
points(DT$Datetime, DT$Sub_metering_2, type = "l", col = "red")
points(DT$Datetime, DT$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-")
dev.off()