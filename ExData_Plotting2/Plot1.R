# Coursera - Exploratory Data Analysis
# Assignment 2

# Plot 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.


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


# Aggregate data to produce Emissions per year
#tapply(x, index, fun)  
tot.pm <- with(data, 
     tapply(Emissions, year, sum) )


# bar plot

# get colors
pal <- colorRampPalette( c('blue', 'green') )

# open plot device / plot / close device
png('plot1.png')
barplot(tot.pm,
        col = pal(4),
        xlab = "years", 
        ylab = 'Total PM 2.5 Emission',
        main = 'Total PM 2.5 Emission')
dev.off()

file.show("plot1.png")

