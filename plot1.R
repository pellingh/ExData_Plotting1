
## read data from Textfile and select subset for the two dates 1/2/2007 & 2/2/2007
inputData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
plotdata <- subset(inputData, inputData$Date == "1/2/2007" | inputData$Date == "2/2/2007")

## open device
png(filename = "plot1.png", width = 480, height = 480)

## generate histogram
hist(plotdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

## close device
dev.off()