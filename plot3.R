
### Function to create second plot -- line plot of global power consump.
plot3<-function(data="household_power_consumption.txt"){
  housePower<-read.table(data, sep=";", header=TRUE, na.strings="?", comment.char = "", colClasses = c("character","character","numeric","numeric", "numeric", "numeric","numeric","numeric", "numeric"))
  # extract the 2 day subset, assign it as a global environment variable
  twoDay<-subset(housePower,housePower$Date=='1/2/2007' | housePower$Date=='2/2/2007')
  png('plot3.png', width = 480, height = 480)
  #Plot sub metering 1
  plot(twoDay$Sub_metering_1, type="l", axes= 0, ylab="Energy sub metering", xlab = "")
  #Then the other two sub metering measurements in diff colors
  lines(twoDay$Sub_metering_2, col= "red")
  lines(twoDay$Sub_metering_3, col="blue")
  #add x axis
  axis(1,at=c(0,nrow(twoDay)/2, nrow(twoDay)),labels=c("Thu","Fri","Sat"))
  #y axis
  axis(2)
  #make legend w/ corresponding colors
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty=1)
  #put box around plot
  box()
  dev.off()
}