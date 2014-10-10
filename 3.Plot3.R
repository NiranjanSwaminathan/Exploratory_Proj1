load("input.RData")
#Reading colnames for the legend and plotting
cola<-colnames(dffinal)
with(dffinal,plot(FullTime,Sub_metering_1,type="l",col=1,ylab="Energy Sub Metering",xlab=""))
lines(dffinal$FullTime,dffinal$Sub_metering_2,col=2)
lines(dffinal$FullTime,dffinal$Sub_metering_3,col=4)
legend(x="topright",legend=cola[7:9],lwd=1,col=c(1,2,3),cex=1)
