fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileURL, temp)
unzip(temp, list=TRUE)
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(as.character(power_data$Date), format = "%d/%m/%Y")
power_data_dr <- subset(power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
power_data_dr$DateTime  <- as.POSIXlt(paste(power_data_dr$Date, power_data_dr$Time, sep=" "))
plot2 <- function() {
  plot(power_data_dr$DateTime, power_data_dr$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
}
png(file = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
plot2()
dev.off()
