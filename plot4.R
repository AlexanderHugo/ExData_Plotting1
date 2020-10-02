
df <- read.csv('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df_filtered <- subset(df, Date>="2007-02-01" & Date<="2007-02-02")

rm(df)

datet <- paste(as.Date(df_filtered$Date), df_filtered$Time)
df_filtered$Datetime <- as.POSIXct(datet)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(df_filtered, {
  plot(x=Datetime,y=Global_active_power,type="l", xlab="", ylab="Global Active Power")
  plot(x=Datetime,y=Voltage, type="l", xlab="datetime", ylab="Voltage")
  plot(x=Datetime,y=Sub_metering_1, type="n",ylab="Energy sub metering")
  lines(x=Datetime,y=Sub_metering_1, xlab="", type='l', col="black")
  lines(x=Datetime,y=Sub_metering_2, xlab="", type='l', col="red")
  lines(x=Datetime,y=Sub_metering_3, xlab="", type='l', col="blue")
  legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c("black","red","blue"), lty=1,lwd=2)
  plot(x=Datetime,y=Global_reactive_power, type="l", xlab="datetime")
})
     
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
