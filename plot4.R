setwd('c:/hh')
par(mfrow=c(1,1), bg='transparent')
# read in data table
power <- read.table("household_power_consumption.txt", sep=';',header=T)


# install.packages('lubridate')
library(lubridate)

# find feb 1st and 2nd dates
idx = which(power$Date == '1/2/2007' | power$Date == '2/2/2007')
power <- power[idx,]

# convert levels to numeric
power[,3:9] = sapply(3:9, function(x) as.numeric(as.character(power[,x])))


# create 4 part image plot 4
par(mfrow=c(2,2))
#part 1
plot(dmy_hms(paste(power$Date, power$Time) ), power$Global_active_power, 
     type='l', ylab='Global Active Power (kilowatts)', xlab='')

# part 2
plot(dmy_hms(paste(power$Date, power$Time) ), power$Voltage, 
     type='l', ylab='Voltage', xlab='datetime')

# part 3
plot(dmy_hms(paste(power$Date, power$Time) ), power$Sub_metering_1, type='n',
     ylab='Energy sub metering', xlab='')
points(dmy_hms(paste(power$Date, power$Time) ), power$Sub_metering_1, col='black',
       type='l')
points(dmy_hms(paste(power$Date, power$Time) ), power$Sub_metering_2, col='red',
       type='l')
points(dmy_hms(paste(power$Date, power$Time) ), power$Sub_metering_3, col='blue',
       type='l')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=1)

# part 4
plot(dmy_hms(paste(power$Date, power$Time) ), power$Global_reactive_power, 
     type='l', xlab='datetime', ylab='Global_reactive_power')

dev.copy(png, 'plot4.png')
dev.off()



