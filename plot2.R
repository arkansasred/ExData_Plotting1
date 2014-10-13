
### Function to create second plot -- line plot of global power consump.
plot2<-function(data="household_power_consumption.txt"){
  # read in the data
  housePower<-read.table(data, sep=";", header=TRUE, na.strings="?", comment.char = "", colClasses = c("character","character","numeric","numeric", "numeric", "numeric","numeric","numeric", "numeric"))
  # extract the 2 day subset, assign it as a global environment variable
  twoDay<-subset(housePower,housePower$Date=='1/2/2007' | housePower$Date=='2/2/2007')
  png('plot2.png', width = 480, height = 480)
  #plot line char of Global Active Power w/o axes
  plot(twoDay$Global_active_power, type='l', axes = 0, ylab= "Global Active Power (killowats)", xlab="")
  #add x axis
  axis(1,at=c(0,nrow(twoDay)/2, nrow(twoDay)),labels=c("Thu","Fri","Sat"))
  #add y axis
  axis(2)
  ##add box lines
  box()
  dev.off()
}