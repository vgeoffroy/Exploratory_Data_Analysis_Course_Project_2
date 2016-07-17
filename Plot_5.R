# EXPLORATORY DATA ANALYSIS - PROJECT 2 - PLOT 5:

# Read the files previously unziped from Datapm25.zip using readRDS:
NEI <- readRDS("summarySCC_PM25.rds"); SCC <- readRDS("Source_Classification_Code.rds")

# Merge both data together:
SCCNEI <- merge(NEI, SCC, by="SCC")

library(ggplot2)  # Load the ggplot2 library

# Get the data of emissions in Baltimore City and from motor vehicle sources which actually is of type ON-ROAD:
MotorSCCNEIBaltCity <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]

# Create a table of summed emissions from motor vehicule according to years in Baltimore City:
TotalEmissionsByYearsBaltCity <- aggregate(Emissions ~ year, MotorSCCNEIBaltCity, sum)

# Create a plot of the total emissions from motor vehicule in Baltimore City:
png("Plot_5.png", width = 840, height = 480)                                                        # Open the plotting device
g <- ggplot(TotalEmissionsByYearsBaltCity, aes(factor(year), Emissions))                            # Create the plot
g <- g + geom_bar(stat="identity", width = 0.3, fill="#000000", colour = "black") +                 # Add black bars of width 0.3
        xlab("Year") +                                                                              # Label the x axis
        ylab(expression('Total emissions from PM'[2.5]*' due to motor vehicle')) +                  # Label the y axis
        ggtitle('Total emissions from motor vehicule sources in Baltimore City from 1999 to 2008')  # Create a title
print(g)                                                                                            # Print the plot
dev.off()                                                                                           # Close the plotting device

# QUESTION: How have emissions from motor vehicule sources changed from 1999-2008 in Baltimore City?

# ANSWER: As shown on Plot_5.png, emissions from vehicule sources decreased from 1999 to 2008 in Baltimore City.
