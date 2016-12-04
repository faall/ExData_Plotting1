# Read file.
df<-read.csv("../data/household_power_consumption.txt", sep = ";",
             na.strings = "?", stringsAsFactors = F)

# Time column into time.
df$Time <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

# Date column into date (this is sort of redundant, the previous command already
# got the dates).
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

# Subset for days 01 and 02 of Febrary 2007.
df1<-subset(df, Date >= "2007-02-01" & Date <= "2007-02-02")

# Open Graphics Device PNG (480x480 is the default).
png("plot3.png")

# Create plot area for Sub metering 1. But with weekdays names in english. 
Sys.setlocale("LC_TIME", "en_US.utf8")
plot(df1$Time,df1$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")

# Add other sub metring with colors.
points(df1$Time, df1$Sub_metering_2, col = "red", type = "l")
points(df1$Time, df1$Sub_metering_3, col = "blue", type = "l")

# Add the legend.
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black", "red", "blue"), lwd = c(1,1,1))

# Close Graphics Device.
dev.off()