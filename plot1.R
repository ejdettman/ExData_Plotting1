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

# plot 1
hist(power$Global_active_power, xlab='Global Active Power (kilowatts)',
     col='red', main= 'Global Active Power', breaks=12  )
dev.copy(png, 'plot1.png')
dev.off()

