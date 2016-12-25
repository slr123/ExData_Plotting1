##Exploratory Data Analysis
##Week 1 Poject
##12/24/2016
##Plot 2

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
png(filename = "plot2.png", width = 480, height = 480)

##create plot
par(mfrow = c(1,1))
with(hpcdata, plot(date, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
     with(hpcdata, lines(date, Global_active_power))
     
##close device
dev.off()
     