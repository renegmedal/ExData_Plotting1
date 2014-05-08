## plot2.R

## get the data and store into a variable
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## transform data$Date into Date class
data$Date <- as.Date(data$Date, format='%d/%m/%Y')

## extract only the required record and store into the new variable
data2 <- data[data$Date >= as.Date('2007-02-01')  & data$Date < as.Date('2007-02-03'),]

## convert data2$Global_active_power into character and then into numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

# add new column for datetime 
data2$date_time <- as.POSIXct(paste(data2$Date,data2$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

plot(data2$date_time, data2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(data2$date_time, data2$Global_active_power)
 
## copy graph and put into the file
dev.copy(png, file="plot2.png", width=480, height=480)

## close the device
dev.off()

