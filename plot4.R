# Read and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time
subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot4.png", width = 480, height = 480)

# Set up 2x2 plotting grid
par(mfrow = c(2, 2))

# Plot 1 (Top-Left)
plot(subset_data$Datetime, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2 (Top-Right)
plot(subset_data$Datetime, subset_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3 (Bottom-Left)
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4 (Bottom-Right)
plot(subset_data$Datetime, subset_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# Close device
dev.off()