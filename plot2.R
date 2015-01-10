household_power_consumption <- 
  read.table(file="household_power_consumption.txt",header=TRUE,
             sep=";",
             na.strings="?")
## Combine date and time
household_power_consumption$datetime<-
  strptime(paste(household_power_consumption$Date,"-",
                 household_power_consumption$Time),
           format="%d/%m/%Y - %T")
## Choose 2007-02-01 and 2007-02-02
power <- household_power_consumption[
  !is.na(household_power_consumption$datetime) &
    household_power_consumption$datetime >= "2007-02-01 00:00:00" &
    household_power_consumption$datetime < "2007-02-03 00:00:00"
  , ]

png(filename="plot2.png")
plot(x=power$datetime,
     y=power$Global_active_power,
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     type="l")
dev.off()