# Clean up and environment setting
rm(list = ls())
setwd('C:/Nuova cartella/Exploratory Data Analysis')

#
source("getdata.R")
# get data
df = getdata()

# Plot histogram, on default Graphical device (screen)
hist(df$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', xlim = c(0, 6), axes = FALSE)
axis(side=1, at=c(0, 2, 4, 6), labels=c(0, 2, 4, 6))
axis(side=2, at=c(0, 200, 400, 600, 800, 1000, 1200))
dev.copy(png, file = 'plot1.png', width = 480, height = 480, units = "px")
dev.off()

# Compose plot straight into the png Graphics Device
png (file = 'plot1.png', width = 480, height = 480, units = "px")
hist(df$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)', xlim = c(0, 6), axes = FALSE)
axis(side=1, at=c(0, 2, 4, 6), labels=c(0, 2, 4, 6))
axis(side=1, at=c(0, 2, 4, 6), labels=c(0, 2, 4, 6))
axis(side=2, at=c(0, 200, 400, 600, 800, 1000, 1200))
dev.off()

