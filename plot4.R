## plot4.R

## get the data and store into a variable
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

## transform data$Date into Date class
data$Date <- as.Date(data$Date, format='%d/%m/%Y')

## extract only the required record and store into the new variable
data2 <- data[data$Date >= as.Date('2007-02-01')  & data$Date < as.Date('2007-02-03'),]

# add new column for datetime 
data2$date_time <- as.POSIXct(paste(data2$Date,data2$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

## convert data2$Global_active_power into character and then into numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))

## convert data2$Global_reactive_power into character and then into numeric
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))

## convert data2$Voltage into character and then into numeric
data2$Voltage <- as.numeric(as.character(data2$Voltage))

## convert data2$Sub_metering_1 into character and then into numeric
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))

## convert data2$Sub_metering_2 into character and then into numeric
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))

## convert data2$Sub_metering_3 into character and then into numeric
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))

## Start plotting graphs
par(mfrow = c(2,2))

plot(data2$date_time, data2$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="n")
lines(data2$date_time, data2$Global_active_power)

plot(data2$date_time, data2$Voltage, xlab = "datetime", ylab = "Voltage", type="n")
lines(data2$date_time, data2$Voltage)

plot(data2$date_time, data2$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n")
lines(data2$date_time, data2$Sub_metering_1)
lines(data2$date_time, data2$Sub_metering_2, col="red")
lines(data2$date_time, data2$Sub_metering_3, col="blue")

legend("topright", box.lty=0, pt.cex=1, cex=0.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue" ), lty=c(1,1,1))

plot(data2$date_time, data2$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="n")
lines(data2$date_time, data2$Global_reactive_power)

## copy graph and put into the file
dev.copy(png, file="plot4.png", width=480, height=480)

## close the device
dev.off()
