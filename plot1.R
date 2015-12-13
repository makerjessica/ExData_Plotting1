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
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()