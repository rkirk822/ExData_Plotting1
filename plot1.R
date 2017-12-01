housepower<- read.table("household_power_consumption.txt",sep=";",header=TRUE)
housepower$Date<- as.Date(housepower$Date,"%d/%m/%Y")
set12<-subset(housepower,Date=="2007-02-01" | Date=="2007-02-02")

png(file="plot1.png")
with(set12,hist(Global_active_power,col="red",
                main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()