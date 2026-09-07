# Read and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time
subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot3.png", width = 480, height = 480)

# Create line plot with sub-metering variables
plot(subset_data$Datetime, subset_data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset_data$Datetime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Datetime, subset_data$Sub_metering_3, col = "blue")

# Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device
dev.off()