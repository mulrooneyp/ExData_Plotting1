setwd("E:/Dropbox/@Coursera/Exploritory Data Analysis/EDA Project 1")
if(!file.exists("./data")){dir.create("./data")}
powerData<-read.csv("./data/household_power_consumption.txt", sep = ";", na.strings = "?")

powerData$Date <- strptime(powerData$Date, format = "%d/%m/%Y")

powerDataSubset <- powerData[powerData$Date == "2007-02-01" | powerData$Date == "2007-02-02",]
hist(as.numeric(na.omit(powerDataSubset$Global_active_power)),col = "red",breaks = 15, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.copy(png, width = 480, height = 480, file = "plot1.png")
dev.off()