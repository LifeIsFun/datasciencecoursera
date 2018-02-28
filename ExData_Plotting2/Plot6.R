# Coursera - Exploratory Data Analysis
# Assignment 2

# Plot 6
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽")
# Which city has seen greater changes over time in motor vehicle emissions?


# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Data Exploration/")

# Read Data
data <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
source <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")


# Get Motor Vehicle Sources in Baltimore
data.mv.baltimore <- subset(data, fips == '24510' & type == 'ON-ROAD')

# Get Motor Vehicle Sources in LA, CA
data.mv.LA <- subset(data, fips == '06037' & type == 'ON-ROAD')


# Group by year
# tapply(x, index, fun)  
data.mv.baltimore.year <- with(data.mv.baltimore, 
       tapply(Emissions, year, sum) )

data.mv.LA.year <- with(data.mv.LA, 
       tapply(Emissions, year, sum) )

emissions <- cbind(Baltimore = data.mv.baltimore.year, 
                   LA = data.mv.LA.year)

# open plot device / plot / close device
png('plot6.png')

y <- c(80, 2000, 4000, 5000)

plot(1:4, log(y), 
     xaxt = 'n',
     type = 'n',
     xlab = "Year",
     ylab = "log(Emissions PM 2.5)",
     main = "On Road Emissions")

points(log(emissions[, 1]), 
       pch = 19, 
       col = 'gray')

points(log(emissions[, 2]), 
       pch = 19, 
       col = 'blue')

axis(1,at=1:4,labels = rownames(emissions))

legend("bottomleft",  c("Baltimore", "LA"), pch=19, col = c('gray', 'blue'))

dev.off()

file.show("plot6.png")


