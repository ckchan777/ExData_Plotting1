##store full data in memeory from csv
data_full <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE)
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##subset data according to date
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
