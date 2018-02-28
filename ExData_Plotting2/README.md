---
title: "README:  Data Science Coursera - Data Exploration - Project 2"
author: "Heather Dye"
output:
  html_document:
    toc: false
    toc_depth: 2
    number_sections: true
    theme: cosmo
    highlight: tango
---


The overall goal of this assignment is to explore the National Emissions Inventory database and see what it says about fine particulate matter pollution in the United states over the 10-year period 1999–2008. 



# The data source

Downloaded and modified EPA dataset, used in the analysis is avialable at:
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip

The zip file contains:

- 𝚜𝚞𝚖𝚖𝚊𝚛𝚢𝚂𝙲𝙲_𝙿𝙼𝟸𝟻.𝚛𝚍𝚜
- 𝚂𝚘𝚞𝚛𝚌𝚎_𝙲𝚕𝚊𝚜𝚜𝚒𝚏𝚒𝚌𝚊𝚝𝚒𝚘𝚗_𝙲𝚘𝚍𝚎.𝚛𝚍𝚜


# Data Set Information

## SummarySCC.rds

Columns:

- fips: 5 digit number:  US county
- SCC: digit string:  source: source code included in classification table
- Pollutant: string: pollutant
- Emissions: number:  emitted PM 2.5 [tons]
- type: string:  type of source:  point, non-point, on-road, non-road
- year: year:  year recorded


## Source_ClassificationCode.rds

Columns:
- SCC                 
- Data.Category       
- Short.Name         
- EI.Sector           
- Option.Group
- Option.Set
- SCC.Level.One
- SCC.Level.Two       
- SCC.Level.Three    
- SCC.Level.Four      
- Map.To              
- Last.Inventory.Year
- Created_Date        
- Revised_Date        
- Usage.Notes  

# Assignment

Generate the following plots.  Each plot has it's own Plot1.R, etc. file and is saved in seperate Plot1.png, etc file.

1. Have total emissions from PM2.5 d.ecreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?
