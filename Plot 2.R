#Read in data and format as dates
data <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subset Data
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Convert and format dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Creat Plot 2
plot(data$Global_active_power~data$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

#Save File
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()