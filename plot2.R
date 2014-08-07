# Clean up and environment setting
rm(list = ls())
setwd('C:/Nuova cartella/Exploratory Data Analysis/ExData_Plotting1')

#
source('getdata.R')
# get data
df = getdata()

# Setting for names of weekdays
Sys.setlocale('LC_TIME', 'English')

# Plot data, on default Graphical device (screen)
plot(df$DateTime, df$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.copy(png, file = 'plot2.png', width = 480, height = 480, units = "px")
dev.off()

# Compose plot straight into the png Graphics Device
png (file = 'plot2.png', width = 480, height = 480, units = "px")
Sys.setlocale('LC_TIME', 'English')
plot(df$DateTime, df$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()
