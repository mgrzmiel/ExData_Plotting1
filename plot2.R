# Expoloratory data analysis
# Magdalena Grzmiel
# Assignment #1

# Use the same data frame which was readed to R in plot1.R file

# Code to generate Plot #2
png("plot2.png",width=480,height=480)
plot(feb.data$time_obj, feb.data$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="n")
lines(feb.data$time_obj, feb.data$Global_active_power)
dev.off()