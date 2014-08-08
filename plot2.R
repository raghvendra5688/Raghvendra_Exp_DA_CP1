df <- read.delim('household_power_consumption.txt',na.strings=c("?"),sep=";");
p <- as.Date(df$Date,"%d/%m/%Y");
df["Revised_Date"] <- p;
remove(p);
useful_data <- df[df$Revised_Date=="2007-02-01"|df$Revised_Date=="2007-02-02",];
p <- paste(useful_data$Revised_Date,useful_data$Time,sep=" ");
p <- strptime(p,"%Y-%m-%d %H:%M:%S");
weekday_id <- as.POSIXct(p);
useful_data["Weekday"] <- weekday_id;
remove(p);
remove(weekday_id);
#Create the plot
png("plot2.png",width=480,height=480,units="px");
plot(useful_data$Weekday,useful_data$Global_active_power,type="s",xlab="",ylab="Global Active Power (kilowatts)",main="");
dev.off();
