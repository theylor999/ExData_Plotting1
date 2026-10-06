## Read the data (missing values are coded as "?"); keep only 2007-02-01 and 2007-02-02
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?", stringsAsFactors = FALSE)
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 2: Global Active Power over time
png("plot2.png", width = 480, height = 480)
plot(power$DateTime, power$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
