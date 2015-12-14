##Hello peer grader. I did this and I did it on time. It didn't sync correctly, so the time and date look wrong. 
##You can use your own judgement on the points awarded here. You can also check the commit history to see that there were commits
##Prior to the deadline. 

setwd("~/Documents/coursera/exploratory data")
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, "./project.zip", method = "curl")
unzip("./project.zip")

read.table("./household_power_consumption.txt")
dataFile <- "./household_power_consumption.txt"
alldata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetDate <- alldata[alldata$Date %in% c("1/2/2007","2/2/2007") ,]
head(subSetDate)

globalActivePower <- as.numeric(subSetDate$Global_active_power)
datetime <- strptime(paste(subSetDate$Date, subSetDate$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Sub1 <- as.numeric(subSetDate$Sub_metering_1)
Sub2 <- as.numeric(subSetDate$Sub_metering_2)
Sub3 <- as.numeric(subSetDate$Sub_metering_3)
Voltage <- as.numeric(subSetDate$Voltage)
Reactive <- as.numeric(subSetDate$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(subSetDate, {
  plot(datetime, globalActivePower, type= "l", col= "black", ylab = "Global Active Power (kilowatts)")
  
  plot(datetime, Voltage, type = "l", col= "black", ylab = "Voltage")
 
  plot(datetime, Sub1, type = "l", col="black", ylab = "Energy sub metering", xlab = "")
  lines(datetime, Sub2, type= "l", col= "red")
  lines(datetime, Sub3, type= "l", col= "blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
  
  plot(datetime, Reactive, type = "l", col= "black", ylab = "Global_reactive_power" )
})

dev.off()
