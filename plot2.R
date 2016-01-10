library(data.table)
DT <- fread("household_power_consumption.txt", header = T, na.strings = c("?"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT <- DT[DT$Date >= as.Date("2007-02-01") & DT$Date <= as.Date("2007-02-02"), ]

DT$Datetime <- as.POSIXct(paste(DT$Date, DT$Time), format="%Y-%m-%d %H:%M:%S")


png(width = 480, height = 480, units = "px", filename = "plot2.png")

par(bg = rgb(0,0,0,0))

plot(DT$Datetime, DT$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()