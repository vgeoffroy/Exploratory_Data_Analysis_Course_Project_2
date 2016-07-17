# EXPLORATORY DATA ANALYSIS - PROJECT 2 - PLOT 1:

# Read the files previously unziped from Datapm25.zip using readRDS:
NEI <- readRDS("summarySCC_PM25.rds"); SCC <- readRDS("Source_Classification_Code.rds")

# Create a table of summed emissions according to years in the United States:
TotalEmissionsByYears <- aggregate(Emissions ~ year, NEI, sum)

# Create a plot of the total emissions from PM25 in the United States:
png('Plot_1.png')                                                                                    # Open the plotting device
barplot(height = TotalEmissionsByYears$Emissions,                                                    # Values of the y axis
        names.arg = TotalEmissionsByYears$year,                                                      # Values of the x axis
        col = "black",                                                                               # Change colors of bars
        space = 2,                                                                                   # Change spaces between bars
        xlab = "Years",                                                                              # Label the x axis
        ylab = expression('Total emissions from PM'[2.5]*' in the United States'),                   # Label the y axis
        main = expression('Total emissions from PM'[2.5]*' in the United States at various years'))  # Create a title
dev.off()                                                                                            # Close the plotting device

# QUESTION: Have the total emissions from PM25 decreased in the United States from 1999 to 2008?

# ANSWER: As shown on Plot_1.png, the total emissions from PM25 decreased in the United States from 1999 to 2008.
