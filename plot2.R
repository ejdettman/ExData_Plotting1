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



# plot 2
plot(dmy_hms(paste(power$Date, power$Time) ), power$Global_active_power, 
     type='l', ylab='Global Active Power (kilowatts)', xlab='') 
dev.copy(png, 'plot2.png')
dev.off()
