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
png(filename = "Plot1.png",width = 480,height = 480)
with(newconsdata,hist(as.numeric(Global_active_power),col="red",main = "Global Active Power",xlab="Global Active Power(kilowatts)"))
dev.off()
