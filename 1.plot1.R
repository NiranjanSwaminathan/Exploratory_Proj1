load("input.RData")

#Loading cleaned data

GlobalActivePower<-dffinal$Global_active_power
hist(GlobalActivePower,xlab="Global Active Power(kilowatts)",col="red")
