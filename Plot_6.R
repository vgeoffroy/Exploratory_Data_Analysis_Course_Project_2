# EXPLORATORY DATA ANALYSIS - PROJECT 2 - PLOT 6:

# Read the files previously unziped from Datapm25.zip using readRDS:
NEI <- readRDS("summarySCC_PM25.rds"); SCC <- readRDS("Source_Classification_Code.rds")

# Merge both data together:
SCCNEI <- merge(NEI, SCC, by="SCC")

library(ggplot2)  # Load the ggplot2 library

# Get the data from both Baltimore City and Los Angeles for the type ON ROAD in order to compare emissions:
MotorSCCNEIBaltCityLosAngeles <- NEI[(NEI$fips == "24510"|NEI$fips == "06037") & NEI$type == "ON-ROAD", ]

# Create a table of summed emissions according to years and fips for Baltimore City and for Los Angeles:
TotalEmissionsByYearsAndFips <- aggregate(Emissions ~ year + fips, MotorSCCNEIBaltCityLosAngeles, sum)

# Replace fips by the name of the cities:
TotalEmissionsByYearsAndFips$fips[TotalEmissionsByYearsAndFips$fips=="24510"] <- "Baltimore, MD"
TotalEmissionsByYearsAndFips$fips[TotalEmissionsByYearsAndFips$fips=="06037"] <- "Los Angeles, CA"

# Create a plot of the total emissions from motor vehicule in Baltimore City and in Los Angeles:
png("Plot_6.png", width = 1040, height = 480)                                                                     # Open the plotting device
Year <- factor(TotalEmissionsByYearsAndFips$year)                                                                 # Define a factor of years
g <- ggplot(TotalEmissionsByYearsAndFips, aes(Year, Emissions, fill = Year))                                      # Create the plot
g <- g + facet_grid(. ~ fips)                                                                                     # Split the plot into 2 parts                                     
g <- g + geom_bar(stat = "identity", width = 0.3) +                                                               # Add black bars of width 0.3
        guides(fill = F) +                                                                                        # Remove the legend
        xlab("Year") +                                                                                            # Label the x axis
        ylab(expression('Total emissions from PM'[2.5]*' due to motor vehicle')) +                                # Label the y axis
        ggtitle('Total emissions from motor vehicule sources in Baltimore City vs Los Angeles from 1999 to 2008') # Create a title
print(g)                                                                                                          # Print the plot
dev.off()                                                                                                         # Close the plotting device

# QUESTION: Compare emissions from motor vehicule sources in Baltimore City with emissions from motor vehicule sources in Loas Angeles Couty California.
# Which city has seen greater changes over time in motor vehicule emissions?

# ANSWER: Emissions in Baltimore City are clearly less importants in average than emissions in Los Angeles. These emissions decreased over the time period 
# shown on the plot but not with a great amplitude. Emissions in Los Angeles are dramatically highest and changes observed are as a consequence, more importants.
