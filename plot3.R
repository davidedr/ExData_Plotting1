# Clean up and environment setting
rm(list = ls())
setwd('C:/Nuova cartella/Exploratory Data Analysis')

#
source("getdata.R")
# get data
df = getdata()

Sys.setlocale("LC_TIME", "English")

# Plot data, on default Graphical device (screen)
plot(df$DateTime, df$Sub_metering_1, type = 'l', col = 'black', ylab = "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = 'l', col = 'red')
points(df$DateTime, df$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), legend = c(names(df)[7], names(df)[8], names(df)[9]))
dev.copy(png, file = 'plot3.png', width = 480, height = 480, units = "px")
dev.off()

# Compose plot straight into the png Graphics Device
png (file = 'plot3.png', width = 480, height = 480, units = "px")
plot(df$DateTime, df$Sub_metering_1, type = 'l', col = 'black', ylab = "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = 'l', col = 'red')
points(df$DateTime, df$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), legend = c(names(df)[7], names(df)[8], names(df)[9]))
dev.off()
