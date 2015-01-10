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

png(filename="plot4.png")
par(mfrow = c(2,2))

plot(x=power$datetime,
     y=power$Global_active_power,
     main="",
     xlab="",
     ylab="Global Active Power",
     type="l")
plot(x=power$datetime,
     y=power$Voltage,
     main="",
     xlab="datetime",
     ylab="Voltage",
     type="l")


plot(x=power$datetime,
     y=power$Sub_metering_1,
     main="",
     xlab="",
     ylab="Energy sub metering",
     type="l")
lines(x=power$datetime,
      y=power$Sub_metering_2,
      col="red")
lines(x=power$datetime,
      y=power$Sub_metering_3,
      col="blue")
legend("topright",lty="solid",
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n")
plot(x=power$datetime,
     y=power$Global_reactive_power,
     main="",
     xlab="datetime",
     ylab="Global_reactive_power",
     type="l")
dev.off()