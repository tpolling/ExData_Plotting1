# Plot 3: Sub meetering energy over time

# Reading measurements file
consumptionFile <- "household_power_consumption__2007_02.txt"
consumption <- read.csv(consumptionFile, sep=";")

# Converting date and time
consumption$Time = strptime(paste(as.character(consumption$Date), 
                                  as.character(consumption$Time)), format="%d/%m/%Y %H:%M:%S")
consumption$Date = as.Date(as.character(consumption$Date), format="%d/%m/%Y")

# Graph
plot(consumption$Time, consumption$Sub_metering_1, 
     xlab="", ylab="Energy sub metering", type="l")
points(consumption$Time, consumption$Sub_metering_2, col="red", type="l")
points(consumption$Time, consumption$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, filename="plot3.png", width=480, height=480)
dev.off()
