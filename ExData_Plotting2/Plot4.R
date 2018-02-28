# Coursera - Exploratory Data Analysis
# Assignment 2

# Plot 4
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008?


# set working directory to where the files are
setwd("~/Desktop/RRef/DataScienceCoursera/Data Exploration/")

# Read Data
data <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
source <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Get Coal SCC
coal <- grepl("Coal", source$EI.Sector)
sum(coal)                                # 99 data points
source.coal <- source[coal == T, 1]

# Get Emission data for coal SCC
data.coal <- subset(data, SCC %in% source.coal)

# Group by year
# tapply(x, index, fun)  
data.coal.year <- with(data.coal, 
       tapply(Emissions, year, sum) )

# get color
pal <- colorRampPalette( c('blue', 'green') )
  
# open plot device / plot / close device
png('plot4.png')

barplot(data.coal.year,
        col =pal(4),
        xlab = "Year",
        ylab = "Emissions PM 2.5",
        main = "Coal Combustion Emissions, USA")

dev.off()

file.show("plot4.png")


