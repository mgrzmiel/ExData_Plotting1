# Expoloratory data analysis
# Magdalena Grzmiel
# Assignment #1

# Use the same data frame which was readed to R in plot1.R file

# Plot #4
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(feb.data, {
  plot(feb.data$time_obj, feb.data$Global_active_power, xlab="", ylab="Global Active Power", type="n")
  lines(feb.data$time_obj, feb.data$Global_active_power)
  plot(feb.data$time_obj, feb.data$Voltage, xlab="datetime", 
       ylab="Voltage", type="n")
  lines(feb.data$time_obj, feb.data$Voltage)
  plot(feb.data$time_obj, feb.data$Sub_metering_1, xlab="", ylab="Energy sub metering",
       type="n", ylim=c(0, max(feb.data$Sub_metering_1, feb.data$Sub_metering_2,
                               feb.data$Sub_metering_3)))
  lines(feb.data$time_obj, feb.data$Sub_metering_1, col="black")
  lines(feb.data$time_obj, feb.data$Sub_metering_2, col="red")
  lines(feb.data$time_obj, feb.data$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2",
                                                                         "Sub_metering_3"))
  plot(feb.data$time_obj, feb.data$Global_reactive_power, xlab="datetime", 
       ylab="Global_reactive_power", type="n")
  lines(feb.data$time_obj, feb.data$Global_reactive_power)
})
dev.off()