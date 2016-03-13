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

# Code to generate Plot #2
png("plot2.png",width=480,height=480)
plot(feb.data$time_obj, feb.data$Global_active_power, xlab="", 
     ylab="Global Active Power (kilowatts)", type="n")
lines(feb.data$time_obj, feb.data$Global_active_power)
dev.off()