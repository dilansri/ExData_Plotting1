#Reading the data file
house_data <- read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)
png("plot2.png", width = 480, height = 480)

#Subsetting data from 2007-02-01 to 2007-02-02
house_data$Date <- as.Date(house_data$Date,format="%d/%m/%Y")
house_data_subset <- subset(house_data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Combining Date & Time for the plot
date_time<- paste(house_data_subset$Date,house_data_subset$Time)

#Creating the plot
x<-strptime(date_time,format="%Y-%m-%d %H:%M:%S")
y <- house_data_subset$Global_active_power
plot(x,y,type="l",ylab="Global Active Power (kilowatts)")
dev.off()