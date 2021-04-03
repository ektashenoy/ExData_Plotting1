##to open and read the given .txt file
mymaindata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
##to obtain the data of only 2 dates(i.e. 1st feb and 2nd Feb)
mysubsetdata <- mymaindata[mymaindata$Date %in% c("1/2/2007","2/2/2007") ,]
##to obtain the day from the date
dt <- strptime(paste(mysubsetdata$Date, mysubsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##to set the class of global active power as numeric
globalActivePower <- as.numeric(mysubsetdata$Global_active_power)
##to create a new png file with the given specifications
png("plot2.png", width=480, height=480)
##to plot the graph of the day vs global active power with the given parameters
plot(dt, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

