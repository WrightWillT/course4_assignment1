# check to see if the project folder exists; if not, create it
if(!file.exists("./course4_assignment1")){dir.create("./course4_assignment1")}

# download the file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./course4_assignment1/Dataset.zip")

# because keeping track of the download date helps when troubleshooting
dateDownloaded <- date()

# unzip the file
unzip(zipfile="./course4_assignment1/Dataset.zip",exdir="./course4_assignment1")
path_rf <- file.path("./course4_assignment1" , "household_power_consumption.txt")

# Read the Activity Files
data.all  <- read.table(file.path(path_rf), header = TRUE, sep = ";", na.strings="?")

# subset by the two days we're after
data <- subset(data.all, data.all$Date == "1/2/2007" | data.all$Date =="2/2/2007")
globalActivePower <- as.numeric(as.character(data$Global_active_power))

# create histogram using the hexcode for the weird orange color (used Photoshop to get)
# and also save that as a png
png("plot2.png")
plot(data$Date,globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()