# Coursera - Exploratory Data Analysis
# Assignment 2

# Plot 3
# Of the four types of sources indicated by 
# the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.


# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Data Exploration/")

# Read Data
data <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
source <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# see data in files
head(data)
str(data)

head(source)
str(source)

# Baltimore data subset, fips = 24510
class(data$fips)                 # character
data.baltimore <- subset(data, fips == '24510')

# Aggregate data to produce Emissions per year
# tapply(x, index, fun)  
balt.type.year <- with(data.baltimore, 
       aggregate(Emissions ~ year + type, FUN = function(x) sum(x) ) )

# open plot device / plot / close device
png('plot3.png')

g <- qplot(year, Emissions, data = balt.type.year, facets = .~type)
g + ggtitle("Baltimore PM 2.5 Emissions")

dev.off()

file.show("plot3.png")

