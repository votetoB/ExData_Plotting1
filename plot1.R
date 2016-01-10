library(data.table)
DT <- fread("household_power_consumption.txt", header = T, na.strings = c("?"))
DT$Date <- as.Date(DT$Date, format = "%d/%m/%Y")
DT <- DT[DT$Date >= as.Date("2007-02-01") & DT$Date <= as.Date("2007-02-02"), ]


png(width = 480, height = 480, units = "px", filename = "plot1.png")

par(bg = rgb(0,0,0,0))

hist(DT$Global_active_power, col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()


