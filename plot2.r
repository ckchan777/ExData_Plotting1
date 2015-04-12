##store full data in memeory from csv
data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##subset data according to date
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

##Plot 2
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()