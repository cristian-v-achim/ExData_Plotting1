# Read the data
mydata <- read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na="?")

# Retrieve the date and time
mydata$Time <- strptime(paste(mydata$Date,mydata$Time),"%d/%m/%Y %H:%M:%S")
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")

#Subset the data for 1st ans 2nd of January, 2007
submydata <- subset(mydata, Date %in% as.Date(c("2007-02-01","2007-02-02"),"%Y-%m-%d"))

# Create a graphics device of height 480 and width 480 and plot the data

png("plot3.png",height=480,width=480)
plot(submydata$Time,submydata$Sub_metering_1,col="black",xlab="",ylab="Energy sub metering",type="l")
lines(submydata$Time,submydata$Sub_metering_2,type="l",col="red")
lines(submydata$Time,submydata$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7)
dev.off()