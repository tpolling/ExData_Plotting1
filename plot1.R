# Plot 1: Histogram for global active power

# Reading measurements file
consumptionFile <- "household_power_consumption__2007_02.txt"
consumption <- read.csv(consumptionFile, sep=";")

# Converting date and time
consumption$Time = strptime(paste(as.character(consumption$Date), 
                                  as.character(consumption$Time)), format="%d/%m/%Y %H:%M:%S")
consumption$Date = as.Date(as.character(consumption$Date), format="%d/%m/%Y")

# Histogram
hist(consumption$Global_active_power, xlab="Global Active Power (kilowatts)", 
     col="red")
dev.copy(png, filename="plot1.png", width=480, height=480)
dev.off()
