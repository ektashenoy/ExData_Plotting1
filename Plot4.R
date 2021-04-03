##to read the main data file 
mymaindata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
##to obtain the subset data file containing data of only 2 days i.e. 1st Feb and 2nd Feb
mysubsetdata <- mymaindata[mymaindata$Date %in% c("1/2/2007","2/2/2007") ,]
##to obtain the day from the dates
dt <- strptime(paste(mysubsetdata$Date, mysubsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##to set the class of global active power as numeric
Global_active_power <- as.numeric(mysubsetdata$Global_active_power)
##to set the class of global reactive power as numeric
Global_reactive_power <- as.numeric(mysubsetdata$Global_reactive_power)
##to set the class of voltage as numeric
voltage <- as.numeric(mysubsetdata$Voltage)
##to set the class of submetering1 as numeric
subM1 <- as.numeric(mysubsetdata$Sub_metering_1)
##to set the class of submetering2 as numeric
subM2 <- as.numeric(mysubsetdata$Sub_metering_2)
##to set the class of submetering3 as numeric
subM3 <- as.numeric(subSetData$Sub_metering_3)
##to create a png file for the plot with the given specification of height and width 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
##to plot the graph of GAP and day with the specified parameters
plot(dt, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
##to plot the graph of voltage and day with the specified parameters
plot(dt, voltage, type="l", xlab="datetime", ylab="Voltage")
##to plot the graph of day and submetering1 with the specified parameters
plot(dt, subM1, type="l", ylab="Energy Submetering", xlab="")
##to plot the graph of day and submetering2 with the specified parameters
lines(dt, subM2, type="l", col="red")
##to plot the graph of day and submetering3 with the specified parameters
lines(dt, subM3, type="l", col="blue")
##to create a legend and appropriate formatting
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
##to plot the graph of day and global reactive power
plot(dt, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()