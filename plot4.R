
## read data from Textfile and select subset for the two dates 1/2/2007 & 2/2/2007
inputData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
plotdata <- subset(inputData, inputData$Date == "1/2/2007" | inputData$Date == "2/2/2007")

## Add datetime column for plotting using columns 'Date' and 'Time'
## and convert into correct format
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time)
plotdata$DateTime <- strptime(plotdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

## open png device
png(filename = "plot4.png", width = 480, height = 480)

## allow for 4 separate plots (2x2) and make margins wide enough, especially for y-labels 
par(mfcol=c(2,2), mar=c(4, 5, 3.5, 1))

## left top
plot(x = plotdata$DateTime, y = plotdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## left bottom
plot(plotdata$DateTime, plotdata$Sub_metering_1, col="black", type = "l", xlab="", ylab="Energy sub metering")
lines(plotdata$DateTime, plotdata$Sub_metering_2, col="red")
lines(plotdata$DateTime, plotdata$Sub_metering_3, col="blue")  
## set up legend as required
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
    ,lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"), bg="transparent"
    ,bty = "n") 

## right top
plot(x = plotdata$DateTime, y = plotdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## right bottom
plot(x = plotdata$DateTime, y = plotdata$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power")

## close device
dev.off()