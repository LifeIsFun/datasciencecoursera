# Coursera - Exploratory Data Analysis
# Assignment 2

# Plot 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶")  from 1999to 2008? 
# Use the base plotting system to make a plot answering this question.


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
balt.pm <- with(data.baltimore, 
     tapply(Emissions, year, sum) )


# bar plot

# get colors
pal <- colorRampPalette( c('blue', 'green') )

# open plot devise / plotc/ close devise
png('pcot2.png')
barplot(balt.pm,
        col = pal(4),
        xlab = "years", 
        ylab = 'PM 2.5 Emission',
        main = 'Baltimore, Maryland')
dev.off()

file.show("plot2.png")


