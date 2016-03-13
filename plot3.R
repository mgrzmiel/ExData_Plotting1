# Expoloratory data analysis
# Magdalena Grzmiel
# Assignment #1

# Use the same data frame which was readed to R in plot1.R file

# Code to generate Plot #3
png("plot3.png",width=480,height=480)
plot(feb.data$time_obj, feb.data$Sub_metering_1, xlab="", ylab="Energy sub metering",
     type="n", ylim=c(0, max(feb.data$Sub_metering_1, feb.data$Sub_metering_2,
                             feb.data$Sub_metering_3)))
lines(feb.data$time_obj, feb.data$Sub_metering_1, col="black")
lines(feb.data$time_obj, feb.data$Sub_metering_2, col="red")
lines(feb.data$time_obj, feb.data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2",
                                                                       "Sub_metering_3"))
dev.off()