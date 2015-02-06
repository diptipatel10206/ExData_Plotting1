# EDA course project #1 - plot4

# assign data file a variable
datafile<-"./household_power_consumption.txt"

# Read data file for dates 1/2/2007 & 2/2/2007
Power<-subset(read.table(datafile, header=TRUE, sep=";", na.strings = "?"), 
              Date=="1/2/2007" | Date=="2/2/2007")

# join date and time columns into new date/time column
Power$Timestamp<-paste(Power$Date,Power$Time, sep=" ")

# convert date column to Date format
Power$Timestamp<-strptime(Power$Timestamp, "%d/%m/%Y %H:%M:%S")
Power$Date<-as.Date(Power$Date, "%d/%m/%Y")

# open png device 
png(filename="./plot4.png", width=480,height=480, bg = "white")

par(mfrow= c(2,2))
par(mar=c(4,4,1,1))

# plot graph 1
with(Power, plot(Timestamp, Global_active_power, "l", xlab =" ", 
     ylab="Global Active Power (kilowatts)"))

# plot graph 2
with(Power, plot(Timestamp, Voltage, "l", xlab="datetime", ylab="Voltage"))

# plot graph 3
sublegend<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
with(Power, plot(Timestamp, Sub_metering_1, "l", xlab=" ", ylab="Energy sub metering"))
with(Power, lines(Timestamp, Sub_metering_2, "l", col="red"))
with(Power, lines(Timestamp, Sub_metering_3, "l", col="blue"))
with(Power, legend("topright", legend=sublegend, lwd=1,
                   col=c("black","red","blue"),  bty="n", cex=1, xjust=1))

# plot graph 4
with(Power, plot(Timestamp,Global_reactive_power, "l"))

# open png device and copy graph to file
#dev.copy(png, file="./plot4.png")

# close png device
dev.off()
