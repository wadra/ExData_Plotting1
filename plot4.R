#provide file path as first argument of read.table function.
#make sure file is already downloaded and unzipped
dat <- read.table("/Users/AbdulWadood/Desktop/R/household_power_consumption.txt",header = T,sep = ";")

#dat2 <- as.Date(dat$Date,format = "%d/%m/%Y")
#dat3 <- format(dat2,"%d-%m-%Y")

#as.Date converts Date column from class factor data to Date with used format
#format formats the Date column to required format with -
dat$Date <- format(as.Date(dat$Date,format = "%d/%m/%Y"),"%Y-%m-%d")

# subset that part of data readings which fall with two days of 2007 feburary 1st and 2nd
# used AND condition
req_data <- subset(dat,dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02")

#combining date and time
date_time <- strptime(paste(req_data$Date, req_data$Time, sep= " "), "%Y-%m-%d %H:%M:%S")

#Opening .png graphic device and providing resolution detail
png("plot4.png", width=480, height=480)

# adding a 2*2 grid matrix for four indvidual graphic items
par(mfrow =c(2,2))

#plotting first (top left) date&time with required data's Global Active Power Variable values
plot(date_time, req_data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#plotting second (top right) date&time with required data's Voltage variable values
plot(date_time, req_data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plotting 3rd (bottom left) date&time with rquired data's submetering data
plot(date_time, req_data$Sub_metering_1, type = "l", xlab = "", ylab="Energy Submetering")
lines(date_time, req_data$Sub_metering_2, type = "l",col="red")
lines(date_time, req_data$Sub_metering_3, type = "l",col="blue")
#adding legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#plotting 4th (bottom right) date&time with required data's Global Reactive Power Variable values
plot(date_time, req_data$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")


#closing and saving the grpahic device 
dev.off()
