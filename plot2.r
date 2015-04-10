setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 1")
if(!file.exists("./data")){dir.create("./data")}
powerData<-read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")

powerDataSubset <- powerData[powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02",]
powerDataSubset$DateTime <- strptime(paste(format(powerDataSubset$Date,"%d/%m/%Y"),powerDataSubset$Time), format = "%d/%m/%Y %H:%M:%S")

plot(powerDataSubset$DateTime,powerDataSubset$Global_active_power, type = "l",
               ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off()