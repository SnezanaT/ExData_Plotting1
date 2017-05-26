setwd("D:/DataScience/course4/Course_project1") #set working place
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".") #read dataset
subSetData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),] #select data subset

str(subSetData) #view structure of R object in subSetData

pasteDateTime<-paste(subSetData$Date, subSetData$Time)
datetime<-strptime(pasteDateTime, "%d/%m/%Y %H:%M:%S") #converting date and time in datatime
datetime
globalActivePower<-as.numeric(subSetData$Global_active_power) #set as numeric variable (Global_active_power)

png("plot2.png", width=480, height = 480) #open graphics device, and set width and height
plot(datetime, globalActivePower, type="l", xlab = "", ylab="Global Active Power (kilowatts)") #ploting and annotation plot
dev.off()#close graphics device
