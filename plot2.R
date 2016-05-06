#download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings = "?")
unlink(temp)

#subset file
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#convert data to date-time format 
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#convert data to numeric format
globalActivePower <- as.numeric(as.character(data1$Global_active_power))

#Actual plot
png(filename = "plot2.png")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()