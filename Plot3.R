##to read the main file consisting of the data
mymaindata<- read.table("household_power_consumption.txt", header=TRUE, sep=";")
##to obtain the data pertaining to only 2 given dtes i.e. 1st Feb and 2nd Feb
mysubsetdata <- mymaindata[mymaindata$Date %in% c("1/2/2007","2/2/2007") ,]
##to obtain the day from the date
dt <- strptime(paste(mysubsetdata$Date, mysubsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##to set the class of global active power as numeric
globalActivePower <- as.numeric(mysubsetdata$Global_active_power)
##to set the class of sub metering 1 as numeric
subM1 <- as.numeric(mysubsetdata$Sub_metering_1)
##to set the class of sub metering 2 as numeric
subM2 <- as.numeric(mysubsetdata$Sub_metering_2)
##to set the class of sub metering 3 as numeric
subM3 <- as.numeric(mysubsetdata$Sub_metering_3)
##to create a png file with the given title and the height and the width specification
png("plot3.png", width=480, height=480)
##to plot the graph of submetering1 vs day with appropriate labels
plot(dt, subM1, type="l", ylab="Energy Submetering", xlab="")
##to plot the graph of submetering2 vs day with appropriate labels
lines(dt, subM2, type="l", col="red")
##to plot the graph of submetering3 vs day with appropriate labels
lines(dt, subM3, type="l", col="blue")
##to define the legend on the topright corner of the sheet with appropriate labels and formattings
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
