Sys.setlocale(category = "LC_ALL", locale = "english")
dataPath <- "household_power_consumption.txt"

data <- read.csv(dataPath, sep = ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date>=as.Date("2007-02-01")&Date<=as.Date("2007-02-02"))
dateTime <- paste(data$Date, data$Time)
data$Datetime <- as.POSIXct(dateTime)

plot(data$Datetime, as.numeric(as.character(data$Global_active_power)), 
		ylab = "Global Active Power (kilowatts)",
		xlab = NA,
		type = "l")

dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off ()
