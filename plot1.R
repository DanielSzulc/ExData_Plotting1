
##loading the data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"power_consump.zip")
unzip("power_consump.zip")
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)

##conversion of date and time into R date and time format
data[,"Date"]<-as.Date(data[,"Date"],format="%d/%m/%Y")

##data[,"Time"]<-as.POSIXlt(data[,"Time"],format="%H:%M:%S")

##creating subset of data including only relevant dates:  2007-02-01 and 2007-02-02
sub_data<-data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
##converting format of relevant variable to numeric
sub_data[,"Global_active_power"]<-as.numeric(sub_data[,"Global_active_power"])

png(filename="plot1.png",width=480,height=480,units="px")
hist(sub_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
