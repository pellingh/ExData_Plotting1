
## read data from Textfile and select subset for the two dates 1/2/2007 & 2/2/2007
inputData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
plotdata <- subset(inputData, inputData$Date == "1/2/2007" | inputData$Date == "2/2/2007")

## Add datetime column for plotting using columns 'Date' and 'Time'
## and convert into correct format
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time)
plotdata$DateTime <- strptime(plotdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

## open png device
png(filename = "plot2.png", width = 480, height = 480)

## plot the line
plot(x = plotdata$DateTime, y = plotdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## close device
dev.off()
