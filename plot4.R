dataPath <- "household_power_consumption.txt"

data <- read.csv(dataPath, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
dateTime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(dateTime)

par(mfrow = c(2,2))

plot(data$Datetime, as.numeric(as.character(data$Global_active_power)), 
     ylab = "Global Active Power",
     xlab = NA,
     type = "l")

plot(data$Datetime, as.numeric(as.character(data$Voltage)), 
     ylab = "Voltage",
     xlab = "datetime",
     type = "l",
     col = "black")

plot(x = data$Datetime,
     y = as.numeric(as.character(data$Sub_metering_1)),
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering",
     col = "black")

lines(x = data$Datetime,
      y = as.numeric(as.character(data$Sub_metering_3)),
      col = "blue")

lines(x = data$Datetime,
      y = as.numeric(as.character(data$Sub_metering_2)),
      col = "red")


legend("topright", lty = 1, lwd = 1, bty = "n", cex = 0.8,
       legend = c('Sub_metering_1  ', 'Sub_metering_2  ', 'Sub_metering_3  '),
       col = c("black", "red", "blue"))

plot(data$Datetime, as.numeric(as.character(data$Global_reactive_power)), 
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l",
     col = "black")

dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()

