# Clean up and environment setting
rm(list = ls())
setwd('C:/Nuova cartella/Exploratory Data Analysis/ExData_Plotting1')

#
source("getdata.R")
# get data
df = getdata()

Sys.setlocale("LC_TIME", "English")

# Plot data, on default Graphical device (screen)
par(mfrow = c(2, 2))
plot(df$DateTime, df$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')

plot(df$DateTime, df$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(df$DateTime, df$Sub_metering_1, type = 'l', col = 'black', ylab = "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = 'l', col = 'red')
points(df$DateTime, df$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', bty = 'n', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), legend = c(names(df)[7], names(df)[8], names(df)[9]))

plot(df$DateTime, df$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = names(df)[4])

# Compose plot straight into the png Graphics Device
png (file = 'plot4.png', width = 480, height = 480, units = "px")
Sys.setlocale('LC_TIME', 'English')
par(mfrow = c(2, 2))
plot(df$DateTime, df$Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power')

plot(df$DateTime, df$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')

plot(df$DateTime, df$Sub_metering_1, type = 'l', col = 'black', ylab = "Energy sub metering")
points(df$DateTime, df$Sub_metering_2, type = 'l', col = 'red')
points(df$DateTime, df$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', bty = 'n', lty = c(1, 1, 1), col = c('black', 'red', 'blue'), legend = c(names(df)[7], names(df)[8], names(df)[9]))

plot(df$DateTime, df$Global_reactive_power, type = 'l', xlab = 'datetime', ylab = names(df)[4])
dev.off()
