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
