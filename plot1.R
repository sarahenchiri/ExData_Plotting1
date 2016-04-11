if(!file.exists("./data/Electric.txt")){
	writeLines("File not supplied.\nPlease create directory data and put file in it with the name Electric.txt")
} else {
	dataFile <- "./data/Electric.txt"
	data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
	subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    globalActivePower <- as.numeric(subData$Global_active_power)
	png("./figure/plot1.png", width=480, height=480)
	hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
	dev.off()
}