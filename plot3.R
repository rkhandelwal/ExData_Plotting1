####################################################################################
# This is the function that reads the file and draws the plot
####################################################################################
plot3 <- function () {

	df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

	df$Date <- as.Date(df$Date, format="%d/%m/%Y")

	## Subset the data
	newDf <- subset(df, (df$Date == "2007-02-01" | df$Date == "2007-02-02"))

	## Convert dates and times
	datetime <- paste(as.Date(newDf$Date), newDf$Time)
	datetime <- as.POSIXct(datetime)

	## draw the plot 
	png("plot3.png", width=480, height=480)
	plot(newDf$Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
	lines(newDf$Sub_metering_2~datetime, col="red")
	lines(newDf$Sub_metering_3~datetime, col="blue")
	legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1)
	
	dev.off()
	
}


plot3()