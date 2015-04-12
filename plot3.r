##store full data in memeory from csv
data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##subset data according to date
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

# Plot 3
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()