#Reading the data file
house_data <- read.table("household_power_consumption.txt",na.strings="?",sep=";",header=TRUE)
png("plot1.png", width = 480, height = 480)

#Subsetting data from 2007-02-01 to 2007-02-02

house_data$Date <- as.Date(house_data$Date,format="%d/%m/%Y")

house_data_subset <- subset(house_data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# plotting to graphic device
hist(house_data_subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()