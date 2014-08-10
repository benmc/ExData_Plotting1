if (!file.exists("hpc.zip")) {
    download.file(url="https://d396qusza40orc.cloudfront.net/exhpc%2Fhpc%2Fhousehold_power_consumption.zip", destfile="hpc.zip")
    unzip("hpc.zip")  
}

hpc <- read.csv("household_power_consumption.txt", 
                 # Just pull in the data for the dates 2007-02-01 and 2007-02-02
                 skip=66637,
                 nrows=2880,
                 # recode missing values 
                 na.strings = "?",
                 header=F,
                 sep=";")
# use the 1st row of csv as header names 
names(hpc) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

# convert date and time variables to Date?Time classes
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%y")
hpc$Time <- strptime(hpc$Time, format="%H:%M:%S")

# open plot device, generate the plot, close the device
png(filename="plot1.png", height=450, width=450 )
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()