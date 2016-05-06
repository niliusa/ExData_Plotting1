#download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.csv2(unz(temp, "household_power_consumption.txt"), na.strings = "?")
unlink(temp)

#subset file
data1 <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

#convert data type to numeric
globalActivePower <- as.numeric(as.character(data1$Global_active_power))

#histogram plot
png(filename="plot1.png")
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()