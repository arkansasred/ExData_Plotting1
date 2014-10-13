### Function to create first plot--Histogram of Global Power Consumption
plot1<-function(data="household_power_consumption.txt"){
  # read in the data
  housePower<-read.table(data, sep=";", header=TRUE, na.strings="?", comment.char = "", colClasses = c("character","character","numeric","numeric", "numeric", "numeric","numeric","numeric", "numeric"))
  # extract the 2 day subset, assign it as a global environment variable
  twoDay<-subset(housePower,housePower$Date=='1/2/2007' | housePower$Date=='2/2/2007')
  png('plot1.png', width = 480, height = 480)
  # plot histogram of Global Active Power
  hist(twoDay$Global_active_power, ylab="Frequency",xlab="Global Active Power (killowats)",main="Global Active Power", col="red", breaks=12, freq=TRUE)
  dev.off()
}