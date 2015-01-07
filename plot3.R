
## read data from Textfile and select subset for the two dates 1/2/2007 & 2/2/2007
inputData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
plotdata <- subset(inputData, inputData$Date == "1/2/2007" | inputData$Date == "2/2/2007")

## Add datetime column for plotting using columns 'Date' and 'Time'
## and convert into correct format
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time)
plotdata$DateTime <- strptime(plotdata$DateTime, format = "%d/%m/%Y %H:%M:%S")

## open png device
png(filename = "plot3.png", width = 480, height = 480)

## plot the first line
plot(plotdata$DateTime, plotdata$Sub_metering_1, col="black", type = "l", xlab="", ylab="Energy sub metering")

## add the other two lines to the same plot
lines(plotdata$DateTime, plotdata$Sub_metering_2, col="red")
lines(plotdata$DateTime, plotdata$Sub_metering_3, col="blue")

## add plot legend  
legend("topright", col=c("black","red","blue"), lty=c(1,1,1), lwd=c(2,2,2), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## close device
dev.off()
