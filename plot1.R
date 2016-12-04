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
png("plot1.png")

# Create histogram with color red, main title and x label.
hist(df1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Close Graphics Device.
dev.off()