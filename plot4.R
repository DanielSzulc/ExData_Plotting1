##plot 4

##loading data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"power_consump.zip")
unzip("power_consump.zip")
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)



##conversion of date into R date format
hpc[,"Date"]<-as.Date(hpc[,"Date"],format="%d/%m/%Y")


##creating subset of data including only relevant dates:  2007-02-01 and 2007-02-02
sub_hpc<-data[hpc$Date>=as.Date("2007-02-01") & hpc$Date<=as.Date("2007-02-02"),]


##converting format of relevant variables to numeric (they are originally read as character, probably due to '?' as NA)
sub_hpc[,"Sub_metering_1"]<-as.numeric(sub_hpc[,"Sub_metering_1"])
sub_hpc[,"Sub_metering_2"]<-as.numeric(sub_hpc[,"Sub_metering_2"])
sub_hpc[,"Sub_metering_3"]<-as.numeric(sub_hpc[,"Sub_metering_3"])
sub_hpc[,"Global_active_power"]<-as.numeric(sub_hpc[,"Global_active_power"])
sub_hpc[,"Global_reactive_power"]<-as.numeric(sub_hpc[,"Global_reactive_power"])
sub_hpc[,"Voltage"]<-as.numeric(sub_hpc[,"Voltage"])


## setting 2x2 frame and png file
      
png(filename="plot4.png",width=480,height=480,units="px",type="cairo")
par(mfcol=c(2,2))

        ##plot 4-1
        plot(sub_hpc$Global_active_power,col="black",type="l",main="",ylab="Global Active Power",xlab="",xaxt="n")
        axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

        ##plot 4-2
        plot(sub_hpc$Sub_metering_1,col="black",type="l",main="",ylab="Energy sub metering",xlab="",xaxt="n")
        axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
        lines(sub_hpc$Sub_metering_2,col="red")
        lines(sub_hpc$Sub_metering_3,col="blue")
        legend("topright",col=c("black","red","blue"),bty="n",lty=1,legend=names(sub_hpc)[7:9])
        
        ##plot 4-3
        plot(sub_hpc$Voltage,col="black",type="l",main="",ylab="Voltage",xlab="datetime",xaxt="n",lwd=0.7)
        axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

        ##plot 4-4
        plot(sub_hpc$Global_reactive_power,col="black",type="l",lwd=0.7,main="",ylab="Global_reactive_power",xlab="datetime",xaxt="n")
        axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

##closing plotting device (png)
dev.off()