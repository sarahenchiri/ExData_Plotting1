if(!file.exists("./data/Electric.txt")){
	writeLines("File not supplied.\nPlease create directory data and put file in it with the name Electric.txt")
} else {

	dataFile <- "./data/Electric.txt"
	data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

	subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
	date_time <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
	globalActivePower <- as.numeric(subData$Global_active_power)
	png("./results/plot2.png", width=480, height=480)
	plot(date_time, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.off() 

}