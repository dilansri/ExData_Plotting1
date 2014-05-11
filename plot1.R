#reading data 
data <- read.table("household_power_consumption.txt",sep=";",header=FALSE,skip = 66637, nrow = 2880)
#replace ? with NAs
data[data == "?"] <- "NA"
png("plot1.png", width = 480, height = 480)
hist(data$V3, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()