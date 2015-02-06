fileURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = ".\\power_company.zip")
unzip("power_company.zip")
power_data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
power_data$Date <- as.Date(as.character(power_data$Date), format = "%d/%m/%Y")
power_data_dr <- subset(power_data, Date >= "2007-02-01" & Date<= "2007-02-02")
plot1 <- function() {
hist(power_data_dr$Global_active_power, breaks = 12, xlim = c(0,6), ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
}
png(file = "plot1.png",
width = 480, height = 480, units = "px", pointsize = 12,
bg = "white")
plot1()
dev.off()

