# Exploratory-Data-Analysis-Peer-graded-Assignment-Course-Project-1

This repository contains the R scripts and resulting PNG visualizations for the first course project, which examines how household energy usage varies over a 2-day period in February 2007.

## Dataset
The project utilizes the "Individual household electric power consumption Data Set" from the UC Irvine Machine Learning Repository. 
* Missing values within this dataset are coded as `?`.
* The analysis strictly subsets the data to only include the dates **2007-02-01** and **2007-02-02**.

## Included Files
Per the assignment criteria, this repository contains four R scripts and their corresponding PNG outputs:

* `plot1.R` / `plot1.png`: A histogram visualizing Global Active Power.
* `plot2.R` / `plot2.png`: A line time-series plot of Global Active Power.
* `plot3.R` / `plot3.png`: A multi-line plot comparing the three Energy sub-metering variables.
* `plot4.R` / `plot4.png`: A 2x2 grid containing plots for Global Active Power, Voltage, Energy sub-metering, and Global Reactive Power.

## Execution
To reproduce the plots:
1. Download the raw dataset and extract `household_power_consumption.txt` into your working directory.
2. Source the individual R scripts. 
3. Each script includes the code to read and subset the data, construct the plot using R's base plotting system, and output a PNG file with dimensions of 480 by 480 pixels. The files will be saved in the top-level folder of the repository.
