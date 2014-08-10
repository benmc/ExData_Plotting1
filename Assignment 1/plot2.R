if (!file.exists("hpc.zip")) {
  download.file(url="https://d396qusza40orc.cloudfront.net/exhpc%2Fhpc%2Fhousehold_power_consumption.zip", destfile="hpc.zip")
  unzip("hpc.zip")  
}

hpc <- read.csv("household_power_consumption.txt", skip=66637, nrows=2880, na.strings = "?", header=F, sep=";")
names(hpc) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", height=450, width=450)
plot(hpc$DateTime, hpc$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power (kilowatts)", main="")
dev.off()