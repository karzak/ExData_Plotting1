fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, temp)
unzip(temp, list=TRUE)
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(as.character(power_data$Date), format = "%d/%m/%Y")
power_data_dr <- subset(power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
power_data_dr$DateTime  <- as.POSIXlt(paste(power_data_dr$Date, power_data_dr$Time, sep=" "))
plot3 <- function() {
  plot(power_data_dr$DateTime, power_data_dr$Sub_metering_1,type = "l", xlab = "", ylab = "Energy Sub Metering",  col="black")
  lines(power_data_dr$DateTime, power_data_dr$Sub_metering_2, col="red")
  lines(power_data_dr$DateTime, power_data_dr$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1, col=c("black","red","blue"), lty=1)
}
png(file = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
plot3()
dev.off()
