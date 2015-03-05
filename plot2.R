####################################################################################
# This is the function that reads the file and draws the plot
####################################################################################
plot2 <- function () {

	df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

	df$Date <- as.Date(df$Date, format="%d/%m/%Y")

	## Subset the data
	newDf <- subset(df, (df$Date == "2007-02-01" | df$Date == "2007-02-02"))

	## Convert dates and times
	datetime <- paste(as.Date(newDf$Date), newDf$Time)
	datetime <- as.POSIXct(datetime)

	## draw the plot 
	plot(newDf$Global_active_power~datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
	
	## Save to file
	dev.copy(png, file="plot2.png", height=480, width=480)
	
	dev.off()
	
}


plot2()