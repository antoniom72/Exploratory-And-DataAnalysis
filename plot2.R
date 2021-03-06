data <- read.csv("./household_power_consumption.txt", header=T, sep=";", na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote="\"")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subdata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))

############################################
# Plot 2


# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(subdata$DateTime, subdata$Global_active_power, xlab = ""
     , ylab = "Global Active Power (kilowatt)", type = "l")
############################################

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

