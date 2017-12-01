housepower<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
housepower$Date<- as.Date(housepower$Date,"%d/%m/%Y")
set12<-subset(housepower,Date=="2007-02-01" | Date=="2007-02-02")
dtim<-with(set12,as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))
set12$Date<-NULL
set12$Time<-NULL
set12$Date<-dtim

png(file="plot3.png")
with(set12, {
  plot(Date,Sub_metering_1,type="n",ylab="Energy sub metering",xlab='')
  lines(Date,Sub_metering_1,type="l",col="black")
  lines(Date,Sub_metering_2,type="l",col="red")
  lines(Date,Sub_metering_3,type="l",col="blue")
  legend("topright",lty=1,lwd=1,
         col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)
})
dev.off()
