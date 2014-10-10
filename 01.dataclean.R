#Reading data from the URL , unzip and creating R file

t<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",t)
file<-unz(t,"household_power_consumption.txt")
df1<-read.table( file , sep=";", header=TRUE)
unlink(t)

#Subset data required for the two days 

d1<-as.Date("2007-02-01")
d2<-as.Date("2007-02-02")
df1$Date<-as.Date(strptime(df1$Date,"%d/%m/%Y"))
dffinal<-subset(df1,Date %in% c(d1,d2))
remove(df1)

#Changing factors to numeric types and creating date time variable for TS plots
dataclean(dffinal)
dffinal$FullTime<-paste(as.character(dffinal$Date),as.character(dffinal$Time),sep=" ")
dffinal$FullTime<-strptime(dffinal$FullTime,"%Y-%m-%d %H:%M:%S")
dffinal$Global_active_power<-as.numeric(as.character(dffinal$Global_active_power))
dffinal$Sub_metering_3<-as.numeric(as.character(dffinal$Sub_metering_3))
dffinal$Sub_metering_2<-as.numeric(as.character(dffinal$Sub_metering_2))
dffinal$Sub_metering_1<-as.numeric(as.character(dffinal$Sub_metering_1))
dffinal$Voltage<-as.numeric(as.character(dffinal$Voltage))

save.image("input.RData")
