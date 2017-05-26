setwd("D:/DataScience/course4/Course_project1") #set working place
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".") #read dataset
subSetData<-data[data$Date %in% c("1/2/2007", "2/2/2007"),] #select data subset

str(subSetData) #view structure of R object in subSetData

globalActivePower<-as.numeric(subSetData$Global_active_power) #set as numeric variable (Global_active_power)

png("plot1.png", width=480, height = 480) #open graphics device, and set width and height
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") #ploting histogram, set main title and label x-axis
dev.off() #close graphics device
