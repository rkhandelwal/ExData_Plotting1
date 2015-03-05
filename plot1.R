####################################################################################
# This is the function that reads the file and draws the plot
####################################################################################
plot1 <- function () {

	df <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)

	df$Date <- as.Date(df$Date, "%d/%m/%Y")
	
	## Subset the data
	newDf <- subset(df, (df$Date == "2007-02-01" | (df$Date == "2007-02-02")) )
	
	## draw the plot
	png("plot1.png", width=480, height=480)
	
	hist(as.numeric(newDf$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
	
	dev.off()
	
	
}


plot1()















