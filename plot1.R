## get the data and store into a variable
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
##str(data)

## transform data$Date into Date class
data$Date <- as.Date(data$Date, format='%d/%m/%Y')

## extract only the required record and store into the new variable
data2 <- data[data$Date >= as.Date('2007-02-01')  & data$Date < as.Date('2007-02-03'),]

##data2$Global_active_power
##sub("\\?", "NA", data2$Global_active_power)
##str(data2)

## convert data2$Global_active_power into character and then into numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

## Generate histogram into the screen
hist(data2$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)" )

## copy histogram and put into the file
dev.copy(png, file="plot1.png")

## close the device
dev.off()

