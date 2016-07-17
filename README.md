# Exploratory_Data_Analysis_Course_Project_2

* Introduction:

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that will be used for this assignment are for 1999, 2002, 2005, and 2008.

* Questions:

1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
- Answer: For this question, please see Plot_1.png. The total emissions from PM2.5 decreased in the United States from 1999 to 2008

2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
- Answer: For this question, please see Plot_2.png. Emissions were more important in 2005 than they were in 2002. As a consequence, total emissions from PM2.5 did not decrease in Baltimore City, Maryland from 1999 to 2008

3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
- Answer: For this question, please see Plot_3.png. The types NONPOINT, ON-ROAD and NON-ROAD have seen decreases in emissions from 1999 to 2008. For the type POINT, it is slightly more complicated as emissions seem to increase from 1999 to 2005 and then, they seem to decrease from 2005 to 2008. Therefore, it is difficult to conclude anything about the type POINT.

4) Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
- Answer: For this question, please see Plot_4.png. Across the United States, emissions from coal combustion-related sources seem to decrease from 1999 to 2008. 

5) How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
- Answer: For this question, please see Plot_5.png. Emissions from vehicule sources decreased from 1999 to 2008 in Baltimore City.

6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
- Answer: For this question, please see Plot_6.png. Emissions in Baltimore City are clearly less importants in average than emissions in Los Angeles. These emissions decreased over the time period shown on the plot but not with a great amplitude. Emissions in Los Angeles are dramatically highest and changes observed are as a consequence, more importants.
