# Expoloratory data analysis
# Magdalena Grzmiel
# Assignment #1

# Read the data
# set the working directory
setwd("/Users/magda/Desktop/Coursera/expoloratory_data_analysis/ExData_Plotting1")

# read the data 
dat <-read.table("/Users/magda/Desktop/Coursera/expoloratory_data_analysis/household_power_consumption.txt", header=TRUE,
                 sep=";")

# read in date/time info in format d/m/y h:m:s
dat$timestamp<-paste(dat$Date, dat$Time)
dat$timestamp<-as.character(dat$timestamp)
dat$time_obj<-strptime(dat$timestamp, "%d/%m/%Y %H:%M:%S")

# convert Date to Date object
dat$Date<-as.Date(dat$Date, "%d/%m/%Y")


#subset the data to only include data from Feb 1st and 2nd
feb.data <-dat[dat$Date>=as.Date("2007-02-01") & dat$Date<=as.Date("2007-02-02"),]

# convert all numeric column to numeric format
for (i in 3:9){
  feb.data[,i]<-as.numeric(as.character(feb.data[,i]))
}


# Code to generate the Plot #4
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