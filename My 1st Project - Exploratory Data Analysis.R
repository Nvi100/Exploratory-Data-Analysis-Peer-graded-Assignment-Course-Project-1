# Read the dataset, specifying that missing values are coded as "?"
# Note: The dataset is separated by semicolons
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?", 
                   stringsAsFactors = FALSE)

# Subset the data for the specified dates: 2007-02-01 and 2007-02-02
# The raw Date format is dd/mm/yyyy
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert the Date variable to a Date class using as.Date()
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")

# Combine Date and Time, then convert using strptime()
datetime_str <- paste(subset_data$Date, subset_data$Time)
subset_data$Datetime <- strptime(datetime_str, format = "%Y-%m-%d %H:%M:%S")

# Alternatively, if you want it as POSIXct for easier plotting in base R:
subset_data$Datetime <- as.POSIXct(subset_data$Datetime)




# Read and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(subset_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# Close device
dev.off()



# Read and subset data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
subset_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time
subset_data$Datetime <- as.POSIXct(paste(subset_data$Date, subset_data$Time), format="%d/%m/%Y %H:%M:%S")

# Open PNG device
png("plot2.png", width = 480, height = 480)

# Create line plot
plot(subset_data$Datetime, subset_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# Close device
dev.off()



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