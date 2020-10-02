df <- read.csv('household_power_consumption.txt', sep=";", header=TRUE, na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
df$Date <- as.Date(df$Date, format="%d/%m/%Y")

df_filtered <- subset(df, Date>="2007-02-01" & Date<="2007-02-02")

rm(df)

datet <- paste(as.Date(df_filtered$Date), df_filtered$Time)
df_filtered$Datetime <- as.POSIXct(datet)

head(df_filtered)

plot(x=df_filtered$Datetime,y=df_filtered$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)", type='S')

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
