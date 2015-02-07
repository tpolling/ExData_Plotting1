# Plot 4: Combined plots

# Reading measurements file
consumptionFile <- "household_power_consumption__2007_02.txt"
consumption <- read.csv(consumptionFile, sep=";")

# Converting date and time
consumption$Time = strptime(paste(as.character(consumption$Date), 
                                  as.character(consumption$Time)), format="%d/%m/%Y %H:%M:%S")
consumption$Date = as.Date(as.character(consumption$Date), format="%d/%m/%Y")

# Plots
par(mfrow=c(2,2), mar=c(4,4,2,2))

# Plot 1
plot(consumption$Time, consumption$Global_active_power, 
     xlab="", ylab="Global Active Power", type="l")

# Plot 2
plot(consumption$Time, consumption$Voltage, 
     xlab="datetime", ylab="Voltage", type="l")

# Plot 3
plot(consumption$Time, consumption$Sub_metering_1, 
     xlab="", ylab="Energy sub metering", type="l")
points(consumption$Time, consumption$Sub_metering_2, col="red", type="l")
points(consumption$Time, consumption$Sub_metering_3, col="blue", type="l")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
plot(consumption$Time, consumption$Global_reactive_power, 
     xlab="datetime", ylab="Global_reactive_power", type="l")

dev.copy(png, filename="plot4.png", width=480, height=480)
dev.off()
