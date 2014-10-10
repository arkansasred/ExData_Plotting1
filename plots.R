##code used to construct the 4 plots
##Used as follows:
##readData()
##plot1()
##plot2()
##plot3()
##plot4()

readData<-function(data="household_power_consumption.txt"){
    # read in the data
    housePower<-read.table(data, sep=";", header=TRUE, na.strings="?", comment.char = "", colClasses = c("character","character","numeric","numeric", "numeric", "numeric","numeric","numeric", "numeric"))
    # extract the 2 day subset, assign it as a global environment variable
    twoDay<<-subset(housePower,housePower$Date=='1/2/2007' | housePower$Date=='2/2/2007')
}

## Following functions make the plots. they take in a data argument, default to twoDay data returned from above

### Function to create first plot--Histogram of Global Power Consumption
plot1<-function(data=twoDay){
    png('plot1.png', width = 480, height = 480)
    # plot histogram of Global Active Power
    hist(data$Global_active_power, ylab="Frequency",xlab="Global Active Power (killowats)",main="Global Active Power", col="red", breaks=12, freq=TRUE)
    dev.off()
}

### Function to create second plot -- line plot of global power consump.
plot2<-function(data=twoDay){
    png('plot2.png', width = 480, height = 480)
    #plot line char of Global Active Power w/o axes
    plot(data$Global_active_power, type='l', axes = 0, ylab= "Global Active Power (killowats)", xlab="")
    #add x axis
    axis(1,at=c(0,nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
    #add y axis
    axis(2)
    ##add box lines
    box()
    dev.off()
}

plot3<-function(data=twoDay){
    png('plot3.png', width = 480, height = 480)
    #Plot sub metering 1
    plot(twoDay$Sub_metering_1, type="l", axes= 0, ylab="Energy sub metering", xlab = "")
    #Then the other two sub metering measurements in diff colors
    lines(twoDay$Sub_metering_2, col= "red")
    lines(twoDay$Sub_metering_3, col="blue")
    #add x axis
    axis(1,at=c(0,nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
    #y axis
    axis(2)
    #make legend w/ corresponding colors
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty=1)
    #put box around plot
    box()
    dev.off()
}

plot4<-function(data=twoDay){
    png('plot4.png', width = 480, height = 480)
    #set up two rows, two columns for subplots
    par(mfrow=c(2,2))
    
    #use same code from plot2()
    plot(data$Global_active_power, type='l', axes = 0, ylab= "Global Active Power", xlab="")
    axis(1,at=c(0,nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
    axis(2)
    box()
    
    #Same as plot2(), but with Voltage
    plot(data$Voltage, type='l', axes = 0, ylab= "Voltage", xlab="datetime")
    axis(1,at=c(0,nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
    axis(2)
    box()
    
    #same as plot3(), but no lines on legend box
    plot(twoDay$Sub_metering_1, type="l", axes= 0, ylab="Energy sub metering", xlab = "")
    lines(twoDay$Sub_metering_2, col= "red")
    lines(twoDay$Sub_metering_3, col="blue")
    axis(1,at=c(0,nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
    axis(2)
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c('black','red','blue'), lty=1, bty="n")
    box()
    
    #same as plot2(), but for Global Reactive Power
    plot(data$Global_reactive_power, type='l', axes = 0, ylab= "Global_reactive_power", xlab="datetime")
    axis(1,at=c(0,nrow(data)/2, nrow(data)),labels=c("Thu","Fri","Sat"))
    axis(2)
    box()
    dev.off()
    
}