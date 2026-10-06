## Read the data (missing values are coded as "?"); keep only 2007-02-01 and 2007-02-02
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                    na.strings = "?", stringsAsFactors = FALSE)
power <- subset(power, Date %in% c("1/2/2007", "2/2/2007"))
power$DateTime <- strptime(paste(power$Date, power$Time), format = "%d/%m/%Y %H:%M:%S")

## Plot 1: histogram of Global Active Power
png("plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
