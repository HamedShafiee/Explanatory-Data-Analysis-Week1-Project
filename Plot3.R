#setting the working directory for downloading the project data
setwd("C:/Users/hamed/Desktop/Data Science/Working Directory")

#creating the required folder 
if(!file.exists("./plottingweek1")){dir.create("./plottingweek1")}

# setting download url path

downloadPath <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

# Downloading the required data
download.file(downloadPath,destfile="./plottingweek1/Dataset.zip")
# the data should be unzipped in the created directory
unzip(zipfile="./plottingweek1/Dataset.zip",exdir="./plottingweek1")

# reading existing files in unzipped folder and storing them into data tables
# setting path of the unzipped files
Path <- "C:/Users/hamed/Desktop/Data Science/Working Directory/plottingweek1"
# Read files of subjects
consdata <- read.csv("./plottingweek1/household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,colClasses = NA)
#filtering data for specified dates
newconsdata<-consdata[consdata$Date =="1/2/2007" | consdata$Date =="2/2/2007" ,]
#add both day and time together
range <- strptime(paste(newconsdata$Date, newconsdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png(filename = "Plot3.png",width = 480,height = 480)
plot(range,as.numeric(newconsdata$Sub_metering_1), type="l",xlab="",ylab="Energy Sub Metering")
lines(range, as.numeric(newconsdata$Sub_metering_2), type="l", col="red")
lines(range, as.numeric(newconsdata$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1)
dev.off()
