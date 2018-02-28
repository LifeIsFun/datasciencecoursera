# Coursera - Exploratory Data Analysis
# Assignment 2

# Plot 5
# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?


# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Data Exploration/")

# Read Data
data <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
source <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Get Motor Vehicle Sources in Baltimore
data.mv.baltimore <- subset(data, fips == '24510' & type == 'ON-ROAD')

# Group by year
# tapply(x, index, fun)  
data.mv.baltimore.year <- with(data.mv.baltimore, 
       tapply(Emissions, year, sum) )

# get color
pal <- colorRampPalette( c('blue', 'green') )
  
# open plot device / plot / close device
png('plot5.png')

barplot(data.mv.baltimore.year,
        col =pal(4),
        xlab = "Year",
        ylab = "Emissions PM 2.5",
        main = "On Road Emissions, Baltimore")

dev.off()

file.show("plot5.png")


