## Script to create Plot2

# Reading in Data for 2007-02-01 to 2007-02-02
column_names <- c("Date", "Time", "Global_active_power",
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
data <- fread("data/household_power_consumption.txt", header = FALSE, 
              na.strings = "?", skip = 66637, 
              nrows = 2880, col.names = column_names)

# Add a datetime column
data[, dtime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %T")]

# Setting png file device and plotting to it.
png("plot2.png")
plot(data$dtime, data$Global_active_power, type="l", 
     ylab="Global Active Power (killowattt)", xlab="")
dev.off()