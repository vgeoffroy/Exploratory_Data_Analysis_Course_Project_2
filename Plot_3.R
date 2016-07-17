# EXPLORATORY DATA ANALYSIS - PROJECT 2 - PLOT 3:

# Read the files previously unziped from Datapm25.zip using readRDS:
NEI <- readRDS("summarySCC_PM25.rds"); SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)  # Load the ggplot2 library

# Select data only related to Baltimore City:
NEIBaltCity  <- NEI[NEI$fips == "24510", ]

# Create a table of summed emissions according to years and types in Baltimore City:
TotalEmissionsByYearsBaltCity <- aggregate(Emissions ~ year + type, NEIBaltCity, sum)

# Create a plot of the total emissions from PM25 in Baltimore City:
png("Plot_3.png", width = 640, height = 480)                                     # Open the plotting device
g <- ggplot(TotalEmissionsByYearsBaltCity, aes(year, Emissions, fill = type)) +  # Create the plot
        facet_grid(. ~ type)                                                     # Split the plot into 4 parts
g <- g + geom_bar(stat = "identity", width = 0.8) +                              # Add bars of width 0.8
        guides(fill = F) +                                                       # Remove the legend                                          
        xlab("Year") +                                                           # Label the x axis
        ylab(expression('Total emissions from PM'[2.5]*' in Baltimore City')) +  # Label the y axis
        ggtitle('Total Emissions in Baltimore City from 1999 to 2008')           # Create a title
print(g)                                                                         # Print the plot
dev.off()                                                                        # Close the plotting device

# QUESTION: Of the four types of sources indicated by the type variable, which of these four sources have seen
# decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008?

# ANSWER: The types NONPOINT, ON-ROAD and NON-ROAD have seen decreases in emissions from 1999-2008.
# For the type POINT, it is slightly more complicated as emissions seem to increase from 1999 to 2005 and then, they
# seem to decrease from 2005 to 2008. Therefore, it is difficult to conclude anything about the type POINT.
