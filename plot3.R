dataPath <- "household_power_consumption.txt"

data <- read.csv(dataPath, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
dateTime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(dateTime)

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


legend("topright", lty = 1, lwd = 1, cex = 0.8,
       legend = c('Sub_metering_1      ', 'Sub_metering_2      ', 'Sub_metering_3      '),
       col = c("black", "red", "blue"))

dev.copy(png, filename = "plot3.png", width = 480, height = 480)
dev.off()
