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

#add weekday column (not necessary)
weekdays<- strftime(req_data$Date,'%A')
req_data<- cbind(weekdays,req_data)

#combining date and time
date_time <- strptime(paste(req_data$Date, req_data$Time, sep= " "), "%Y-%m-%d %H:%M:%S")

#Opening .png graphic device and providing resolution detail
png("plot2.png", width=480, height=480)
#plotting date&time with rquired data's Global Active Power Variable
plot(date_time, req_data$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
#closing grpahic device off
dev.off()
