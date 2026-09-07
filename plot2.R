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