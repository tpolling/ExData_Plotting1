# Plot 2: Global active power over time

# Reading measurements file
consumptionFile <- "household_power_consumption__2007_02.txt"
consumption <- read.csv(consumptionFile, sep=";")

# Converting date and time
consumption$Time = strptime(paste(as.character(consumption$Date), 
                                  as.character(consumption$Time)), format="%d/%m/%Y %H:%M:%S")
consumption$Date = as.Date(as.character(consumption$Date), format="%d/%m/%Y")

# Graph
plot(consumption$Time, consumption$Global_active_power, 
     xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png, filename="plot2.png", width=480, height=480)
dev.off()
