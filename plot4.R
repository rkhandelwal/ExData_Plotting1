####################################################################################
# This is the function that reads the file and draws the plot
####################################################################################
plot4 <- function () {
	
	df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

	df$Date <- as.Date(df$Date, format="%d/%m/%Y")

	## Subset the data
	newDf <- subset(df, (df$Date == "2007-02-01" | df$Date == "2007-02-02"))

	## Convert dates and times
	datetime <- paste(as.Date(newDf$Date), newDf$Time)
	datetime <- as.POSIXct(datetime)

	## draw the plot
	png("plot4.png", width=480, height=480)
	par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
	
	plot(newDf$Global_active_power~datetime, type="l",ylab="Global Active Power", xlab="")
	plot(newDf$Voltage~datetime, type="l",ylab="Voltage", xlab="datetime")
	plot(newDf$Sub_metering_1~datetime, type="l",ylab="Energy sub metering", xlab="")
	lines(newDf$Sub_metering_2~datetime,col='Red')
	lines(newDf$Sub_metering_3~datetime,col='Blue')
	legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, bty="n")
	plot(newDf$Global_reactive_power~datetime, type="l",ylab="Global_reactive_power",xlab="datetime")
	
	dev.off()
	
}


plot4()	