setwd("D:/DataScience/course4/Course_project1") #set working place
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".") #read dataset
subSetData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),] #select data subset

str(subSetData) #view structure of R object in subSetData

pasteDateTime<-paste(subSetData$Date, subSetData$Time)
datetime<-strptime(pasteDateTime, "%d/%m/%Y %H:%M:%S") #converting date and time in datatime
datetime

globalActivePower <- as.numeric(subSetData$Global_active_power) #set as numeric variables
globalReactivePower<- as.numeric(subSetData$Global_reactive_power)

subMatering1<- as.numeric(subSetData$Sub_metering_1) #set as numeric variables
subMatering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot4.png", width=480, height = 480) #open graphics device, and set width and height
par(mfrow = c(2,2)) #share plot windows into 4 parts

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2) #plotting first plot

plot(datetime, subSetData$Voltage, type="l", xlab="datetime", ylab="Voltage") #plotting second plot

plot(datetime, subMatering1, type="l", xlab ="", ylab="Energy Submetering") #ploting and annotation third plot
lines(datetime, subMatering2, type="l", col="red") #adding lines on the plot
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n") #adding legend on the plot

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power") #plotting fourth plot

dev.off()#close graphics device
