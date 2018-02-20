# Coursera - Exploratory Data Analysis
# Assignment 1

# Plot 2. Global Active Power [kilowatts] vs time

# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Plotting")

# Read Data
data <- read.table("household_power_consumption.txt", sep = ';', header = T, na.strings="?")

# check class
sapply(data, class)          # all factor

# Change Date and Time Column to Date Type, create new column with Date/Time output
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), 
                                     format = "%d/%m/%Y %H:%M:%S"))

# Filter Dates for 2007-02-01 and 2007-02-02
data <- subset(data, (DateTime >= "2007-02-01") & (DateTime < "2007-02-03"))


# check if NA
sum(is.na(data$Global_active_power) )                 # 0, all good
sum(is.na(data$DateTime) )                            # 0, all good

# change class to numeric for col 3:9                               
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

#Open devise
png(file = "plot2.png", width = 480, height = 480, units = "px")

# Plot the graph
plot(data$DateTime, data$Global_active_power, 
     type = 'l',
     xlab="",
     ylab="Global Active Power (kilowatts)",
     ylim = c())

# Turn off device
dev.off()

# View plot
file.show('plot2.png')
