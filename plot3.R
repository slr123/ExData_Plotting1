##Exploratory Data Analysis
##Week 1 Poject
##12/24/2016
##Plot 3

##check if file exists, download, unzip if necessary and read in data
if (!file.exists("household_power_consumption.txt")) {
        fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileurl, destfile = "household_power_consumption.zip")
        date_downloaded <- date()
        unzip("household_power_consumption.zip")
}
##load 'tidyverse' to use 'tibbles' and work within the 'tidyverse'
##see: http://r4ds.had.co.nz/introduction.html Section 1.4.3
library(tidyverse)
library(lubridate)
hpcdata <- as_tibble(read.table("household_power_consumption.txt", header = FALSE, sep = ";",
                                stringsAsFactors = FALSE, skip = 66637, nrows = 2880))
names(hpcdata) <- read.table("household_power_consumption.txt", header = FALSE, sep = ";",
                             stringsAsFactors = FALSE, nrows = 1)
hpcdata <- as_tibble(mutate(hpcdata, date = dmy_hms(paste(hpcdata$Date, hpcdata$Time))))


##initialize png file
png(filename = "plot3.png", width = 480, height = 480)

##create plot
par(mfrow = c(1,1))
with(hpcdata, plot(date, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
        with(hpcdata, lines(date, Sub_metering_1))
        with(hpcdata, lines(date, Sub_metering_2, col = "red"))
        with(hpcdata, lines(date, Sub_metering_3, col = "blue"))
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"), lty = 1)
        
##turn off graphics device
dev.off()
        