housepower<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
housepower$Date<- as.Date(housepower$Date,"%d/%m/%Y")
set12<-subset(housepower,Date=="2007-02-01" | Date=="2007-02-02")
dtim<-with(set12,as.POSIXct(paste(Date,Time),format="%Y-%m-%d %H:%M:%S"))
set12$Date<-NULL
set12$Time<-NULL
set12$Date<-dtim

png(file="plot2.png")
with(set12,plot(Date,Global_active_power,type="l",
                ylab="Global Active Power (kilowatts)",xlab=''))
dev.off()