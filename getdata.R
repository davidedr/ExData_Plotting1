# Prepared the data for plotting (and other uses!)
# This function contains the common code of all plotting task that are required.
# Should be included in every .R file that makes the required plots
# and then invoked to get the data in a data frame.
# Data are already cleaned up and subsetted. If the data file already exists
# it is read; otherwise if is downloaded, unzipped and read into a data frame.
# A new conveninent column is added containing the timestamp (date, time) 
# in an unique column. Otherwise date and time infomations is scattered
# in two columns.
# 
# Args:
#   filename: optional filename containing the data, already downloaded and
#             unzipped
#             if missing assumes standard name
# Returns:
#   The already subsetted data in a data frame
#
# Usage:
#   source("getdata.R")
#   df = getdata()
#   ...
#
getdata <- function(filename = 'household_power_consumption.txt') {
  
  
  if(!file.exists(filename)) {
    
    print('File does not esist. Downloading and reading...')
    destfile = 'cache.zip'
    download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', destfile)
    con <- unz(destfile, "household_power_consumption.txt")
    df = read.table(con, sep = ';', header = TRUE, na.strings = '?', as.is = TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    
  }  
  else {
    print('File does esist. Reading...')
    df = read.csv(filename, sep = ';', header = TRUE, na.strings = '?', as.is = TRUE, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  }
  
  # type conversions
  df$DateTime <- strptime(paste(df$Date, df$Time, sep = " "), format = '%d/%m/%Y %H:%M:%S')  
  df$Date <- as.POSIXct(df$Date, format = '%d/%m/%Y')
  df$Time <- strptime(df$Time, format = '%H:%M:%S')
  
  # prepare being and end date for subsetting
  date_begin <- '01/02/2007'
  date_begin_date <- as.POSIXct(date_begin, format = '%d/%m/%Y')
  date_end   <- '02/02/2007'
  date_end_date <- as.POSIXct(date_end, format = '%d/%m/%Y')
  
  # Subsetting!
  keep <- df$Date >= date_begin_date & df$Date <= date_end_date
  keep_df <- df[keep, ]  
  
  # Returned dataframe
  keep_df

}