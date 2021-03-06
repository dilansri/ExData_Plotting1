#Reading the data file
house_data <- read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)
png("plot3.png", width = 480, height = 480)

#Subsetting data from 2007-02-01 to 2007-02-02
house_data$Date <- as.Date(house_data$Date,format="%d/%m/%Y")
house_data_subset <- subset(house_data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Combining Date & Time for the plot
date_time<- paste(house_data_subset$Date,house_data_subset$Time)

#Creating the plot
x<-strptime(date_time,format="%Y-%m-%d %H:%M:%S")
sub_metering_1 <- house_data_subset$Sub_metering_1
sub_metering_2 <- house_data_subset$Sub_metering_2
sub_metering_3 <- house_data_subset$Sub_metering_3

plot(x,sub_metering_1,type="l",ylab="Energy sub metering")
lines(x,sub_metering_2,type="l",col="red")
lines(x,sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()