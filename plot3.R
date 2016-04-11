if(!file.exists("./data/Electric.txt")){
	writeLines("File not supplied.\nPlease create directory data and put file in it with the name Electric.txt")
} else {

	dataFile <- "./data/Electric.txt"
	data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
	subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
	date_time <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

	globalActivePower <- as.numeric(subData$Global_active_power)
	subMetering1 <- as.numeric(subData$Sub_metering_1)
	subMetering2 <- as.numeric(subData$Sub_metering_2)
	subMetering3 <- as.numeric(subData$Sub_metering_3)

	png("./figure/plot3.png", width=480, height=480)
	plot(date_time, subMetering1, type="l", ylab="Energy Submetering", xlab="")
	lines(date_time, subMetering2, type="l", col="red")
	lines(date_time, subMetering3, type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
	dev.off()

}