# Coursera - Exploratory Data Analysis
# Assignment 1

# Plot 4. 4 plots:
          # 1. global active power vs time
          # 2. voltage vs time
          # 3. enerty sub metering vs time
          # 4. global reactive power vs time

# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Plotting")

# Read Data
data <- read.table("household_power_consumption.txt", sep = ';', header = T, na.strings="?")

# check class
sapply(data, class)          
  # most are factor

# Change Date and Time Column to Date Type, create new column with Date/Time output
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), 
                                     format = "%d/%m/%Y %H:%M:%S"))

# Filter Dates for 2007-02-01 and 2007-02-02
data <- subset(data, (DateTime >= "2007-02-01") & (DateTime < "2007-02-03"))


# check if NA
sapply(data, function(x) sum(is.na(x)))               # 0, all good

# change class to numeric for col 7:9                               
data[, 3:9] <- lapply(data[ , 3:9], function(x) as.numeric(as.character(x)) )

#Open devise
png(file = "plot4.png", width = 480, height = 480, units = "px")

# Plot the graph
par(mfrow = c(2, 2))

# 1. global active power vs time
plot(data$DateTime, data$Global_active_power, 
     type = 'l',
     xlab="",
     ylab="Global Active Power",
     ylim = c())

# 2. voltage vs time
plot(data$DateTime, data$Voltage, 
     type = 'l',
     xlab="datetime",
     ylab="Voltage",
     ylim = c())

# 3. enerty sub metering vs time
with(data,
     plot(data$DateTime, data$Sub_metering_1, 
          main = "", 
          type = 'n',
          xlab="", 
          ylab="Energy sub metering") )

lines(data$DateTime, data$Sub_metering_1, col = 'black')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3"),
       lty=c(1,1), 
       lwd=c(1,1),
       bty="n",
       cex=.5)

# 4. global reactive power vs time

plot(data$DateTime, data$Global_reactive_power, 
     type = 'l',
     xlab="datetime",
     ylab="Global_reactive_power",
     ylim = c())

# Turn off device
dev.off()

# bring back plotting to default
par(mfrow = c(1, 1))

# View plot
file.show('plot4.png')
