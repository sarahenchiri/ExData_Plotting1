if(!file.exists("./data/Electric.txt")){
	writeLines("File not supplied.\nPlease create directory data and put file in it with the name Electric.txt")
} else {

	dataFile <- "./data/Electric.txt"
	data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
	subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    date_time <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
	globalActivePower <- as.numeric(subData$Global_active_power)
	globalReactivePower <- as.numeric(subData$Global_reactive_power)
	voltage <- as.numeric(subData$Voltage)
	subMetering1 <- as.numeric(subData$Sub_metering_1)
	subMetering2 <- as.numeric(subData$Sub_metering_2)
	subMetering3 <- as.numeric(subData$Sub_metering_3)
    png("./results/plot4.png", width=480, height=480)
	par(mfrow = c(2, 2)) 

	plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

	plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

	plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
	lines(date_time, subMetering2, type="l", col="red")
	lines(date_time, subMetering3, type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
	plot(date_time, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
	dev.off()

}