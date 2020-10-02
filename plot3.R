df <- read.csv('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df_filtered <- subset(df, Date>="2007-02-01" & Date<="2007-02-02")

rm(df)

datet <- paste(as.Date(df_filtered$Date), df_filtered$Time)
df_filtered$Datetime <- as.POSIXct(datet)


plot(x=df_filtered$Datetime,y=df_filtered$Sub_metering_1, type="n")
lines(x=df_filtered$Datetime,y=df_filtered$Sub_metering_1, xlab="",ylab="Energy sub metering", type='l', col="black")
lines(x=df_filtered$Datetime,y=df_filtered$Sub_metering_2, xlab="",ylab="Energy sub metering", type='l', col="red")
lines(x=df_filtered$Datetime,y=df_filtered$Sub_metering_3, xlab="",ylab="Energy sub metering", type='l', col="blue")
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c("black","red","blue"), lty=1,lwd=2)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
