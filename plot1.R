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

##col_names <- colnames(req_data)


plot1_data<- gsub(",","",req_data$Global_active_power)
plot1_data<- as.numeric(plot1_data)
#Opening .png graphic device and providing resolution detail
png("plot1.png", width=480, height=480)

#Plotting the histogram
hist(plot1_data,xlab ="Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#Saves in working directory of R and Closes the grpahic device off
dev.off()