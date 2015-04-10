setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 1")
if(!file.exists("./data")){dir.create("./data")}
powerData<-read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")

powerDataSubset <- powerData[powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02",]
powerDataSubset$DateTime <- strptime(paste(format(powerDataSubset$Date,"%d/%m/%Y"),powerDataSubset$Time), format = "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

plot(powerDataSubset$DateTime,powerDataSubset$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(powerDataSubset$DateTime,powerDataSubset$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")

plot(powerDataSubset$DateTime,powerDataSubset$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "", col=1)

lines(powerDataSubset$DateTime,powerDataSubset$Sub_metering_2, type = "l",
      col=2)

lines(powerDataSubset$DateTime,powerDataSubset$Sub_metering_3, type = "l",
      col=3)

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c(1:3), pch = -1, lty = 1,cex = 0.75)

plot(powerDataSubset$DateTime,powerDataSubset$Global_reactive_power, type = "l",
     ylab = "Global_reactive_Power", xlab = "datetime")



png(width = 480, height = 480, file = "plot4.png")

par(mfrow=c(2,2))

plot(powerDataSubset$DateTime,powerDataSubset$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(powerDataSubset$DateTime,powerDataSubset$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")

plot(powerDataSubset$DateTime,powerDataSubset$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "", col=1)

lines(powerDataSubset$DateTime,powerDataSubset$Sub_metering_2, type = "l",
      col=2)

lines(powerDataSubset$DateTime,powerDataSubset$Sub_metering_3, type = "l",
      col=3)

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c(1:3), pch = -1, lty = 1,cex = 0.75)

plot(powerDataSubset$DateTime,powerDataSubset$Global_reactive_power, type = "l",
     ylab = "Global_reactive_Power", xlab = "datetime")

dev.off()