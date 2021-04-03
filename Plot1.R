##to open and read the given .txt file
mymaindata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
##to obtain the data of only 2 dates(i.e. 1st feb and 2nd Feb)
mysubsetData <- mymaindata[mymaindata$Date %in% c("1/2/2007","2/2/2007") ,]
##defining the class of the variable "Global_active_power
globalActivePower <- as.numeric(mysubsetData$Global_active_power)
##naming the plot and defining the file type
png("plot1.png", width=480, height=480)
##to obtain the histogram of global active power vs freq and including the given parameters
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
