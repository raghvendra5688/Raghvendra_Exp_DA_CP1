df <- read.delim('household_power_consumption.txt',na.strings=c("?"),sep=";");
p <- as.Date(df$Date,"%d/%m/%Y");
df["Revised_Date"] <- p;
useful_data <- df[df$Revised_Date=="2007-02-01"|df$Revised_Date=="2007-02-02",];
#Create the plot
png("plot1.png",width=480,height=480,units="px");
hist(useful_data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red");
dev.off();
