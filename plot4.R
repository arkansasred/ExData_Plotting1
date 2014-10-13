plot4<-function(data="household_power_consumption.txt"){
  housePower<-read.table(data, sep=";", header=TRUE, na.strings="?", comment.char = "", colClasses = c("character","character","numeric","numeric", "numeric", "numeric","numeric","numeric", "numeric"))
  # extract the 2 day subset, assign it as a global environment variable
  twoDay<-subset(housePower,housePower$Date=='1/2/2007' | housePower$Date=='2/2/2007')
  png('plot4.png', width = 480, height = 480)
  #set up two rows, two columns for subplots
  par(mfrow=c(2,2))
  
  #use same code from plot2()
  plot(twoDay$Global_active_power, type='l', axes = 0, ylab= "Global Active Power", xlab="")
  axis(1,at=c(0,nrow(twoDay)/2, nrow(twoDay)),labels=c("Thu","Fri","Sat"))
  axis(2)
  box()
  
  #Same as plot2(), but with Voltage
  plot(twoDay$Voltage, type='l', axes = 0, ylab= "Voltage", xlab="datetime")
  axis(1,at=c(0,nrow(twoDay)/2, nrow(twoDay)),labels=c("Thu","Fri","Sat"))
  axis(2)
  box()
  
  #same as plot3(), but no lines on legend box
  plot(twoDay$Sub_metering_1, type="l", axes= 0, ylab="Energy sub metering", xlab = "")
  lines(twoDay$Sub_metering_2, col= "red")
  lines(twoDay$Sub_metering_3, col="blue")
  axis(1,at=c(0,nrow(twoDay)/2, nrow(twoDay)),labels=c("Thu","Fri","Sat"))
  axis(2)
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty=1, bty="n")
  box()
  
  #same as plot2(), but for Global Reactive Power
  plot(twoDay$Global_reactive_power, type='l', axes = 0, ylab= "Global_reactive_power", xlab="datetime")
  axis(1,at=c(0,nrow(twoDay)/2, nrow(twoDay)),labels=c("Thu","Fri","Sat"))
  axis(2)
  box()
  dev.off()
  
}