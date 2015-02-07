fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, temp)
unzip(temp, list=TRUE)
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(as.character(power_data$Date), format = "%d/%m/%Y")
power_data_dr <- subset(power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
power_data_dr$DateTime  <- as.POSIXlt(paste(power_data_dr$Date, power_data_dr$Time, sep=" "))
##Upper left
ul <- function() {
plot(power_data_dr$DateTime, power_data_dr$Global_active_power, type = "l", xlab="", 
     ylab = "Global Active Power")
}
##Upper right
ur <- function() {
plot(power_data_dr$DateTime, power_data_dr$Voltage,type = "l",xlab = "datetime", 
     ylab="Voltage")
}
##Lower left
ll <- function() {
plot(power_data_dr$DateTime, power_data_dr$Sub_metering_1,type = "l", xlab = "", 
     ylab = "Energy sub metering",  col="black")
lines(power_data_dr$DateTime, power_data_dr$Sub_metering_2, col="red")
lines(power_data_dr$DateTime, power_data_dr$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), lty=1, bty="n")
}
##Lower right
lr <- function() {
plot(power_data_dr$DateTime, power_data_dr$Global_reactive_power, type = "l", 
     xlab="datetime", ylab = "Global_rective_power")
}
png(file = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
par(mfrow = c(2,2))
ul()
ur()
ll()
lr()
dev.off()
