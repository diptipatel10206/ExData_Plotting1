# EDA course project #1 - plot2

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
png(filename="./plot2.png", width=480,height=480, bg = "white")


# plot graph
plot(Power$Timestamp, Power$Global_active_power, "l", xlab =" ", 
     ylab="Global Active Power (kilowatts)")

# close png device
dev.off()
