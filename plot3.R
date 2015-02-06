# EDA course project #1 - plot3

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
png(filename="./plot3.png", width=480,height=480, bg = "white")

# plot graph
with(Power, plot(Timestamp, Sub_metering_1, "l", xlab=" ", ylab="Energy sub metering"))
with(Power, lines(Timestamp, Sub_metering_2, "l", col="red"))
with(Power, lines(Timestamp, Sub_metering_3, "l", col="blue"))
sublegend<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
with(Power, legend("topright", legend=sublegend, lwd=2,
                   col=c("black","red","blue")))


# close png device
dev.off()
