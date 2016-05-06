#download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings = "?")
unlink(temp)

#subset data
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#convert data to date-time format
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#convert data to numeric format
submetering1 <- as.numeric(as.character(data1$Sub_metering_1))
submetering2 <- as.numeric(as.character(data1$Sub_metering_2))
submetering3 <- as.numeric(as.character(data1$Sub_metering_3))

#actual plot
png(filename = "plot3.png")
plot(datetime, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()