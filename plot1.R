dataPath <- "household_power_consumption.txt"

data <- read.csv(dataPath, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
dateTime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(dateTime)

hist(as.numeric(as.character(data$Global_active_power)),
     main = "Global Active Power",
     col = "red",
     xlab = "Global active power (kilowatts)")

dev.copy(png, filename = "plot1.png", width = 480, height = 480)
dev.off ()