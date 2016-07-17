# EXPLORATORY DATA ANALYSIS - PROJECT 2 - PLOT 2:

# Read the files previously unziped from Datapm25.zip using readRDS:
NEI <- readRDS("summarySCC_PM25.rds"); SCC <- readRDS("Source_Classification_Code.rds")

# Select data only related to Baltimore City:
NEIBaltCity  <- NEI[NEI$fips == "24510", ]

# Create a table of summed emissions according to years in Baltimore City:
TotalEmissionsByYearsBaltCity <- aggregate(Emissions ~ year, NEIBaltCity, sum)

# Create a plot of the total emissions from PM25 in Baltimore City:
png('Plot_2.png')                                                                                 # Open the plotting device
barplot(height = TotalEmissionsByYearsBaltCity$Emissions,                                         # Values of the y axis
        names.arg = TotalEmissionsByYearsBaltCity$year,                                           # Values of the x axis
        col = "black",                                                                            # Change colors of bars
        space = 2,                                                                                # Change spaces between bars
        xlab = "Years",                                                                           # Label the x axis
        ylab = expression('Total emissions from PM'[2.5]*' in Baltimore City'),                   # Label the y axis
        main = expression('Total emissions from PM'[2.5]*' in Baltimore City at various years'))  # Create a title
dev.off()                                                                                         # Close the plotting device

# QUESTION: Have total emissions from PM25 decreased in Baltimore City, Maryland from 1999 to 2008?

# ANSWER: As shown on Plot_2.png, emissions were more important in 2005 than they were in 2002.
# As a consequence, total emissionns from PM25 did not decrease in Baltimore City, Maryland from 1999 to 2008.
