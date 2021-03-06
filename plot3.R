library(readr)
library(dplyr)
library(lubridate)

setwd("C:/Users/Somy/Dropbox/R_Data/Course_4/Chapter_1")
getwd()

if (!file.exists("data")){
        dir.create("data")
}

# 1) download the source data file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url, destfile = "./data/Dataset.zip", mode = "wb")
rm(url)
# 2) Unzip file using unzip command

#unzip("./data/Dataset.zip", exdir = "./data")

# 3) Read text data file

house_pwr_cons_df <- read_delim("./data/household_power_consumption.txt", delim = ";", na = "?")



# 4) convert date to date format

house_pwr_cons_df$Date <- dmy(house_pwr_cons_df$Date)


# 5) Filter for "2007-02-01" and "2007-02-02"
house_pwr_cons_df <- house_pwr_cons_df %>%
        filter(Date == ymd("2007-02-01") | Date == ymd("2007-02-02") )




house_pwr_cons_df <- house_pwr_cons_df %>%
        mutate(date_time = ymd_hms(paste(house_pwr_cons_df$Date,house_pwr_cons_df$Time)))



plot(Sub_metering_1 ~ date_time, data = house_pwr_cons_df, 
     type = "l",
     ylab = "Energy Sub Metering",
     xlab ="")
lines(Sub_metering_2 ~ date_time, data = house_pwr_cons_df, type = "l", col = "red")
lines(Sub_metering_3 ~ date_time, data = house_pwr_cons_df, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red", "blue"), lty=1, cex=1.1)



dev.copy(png, file = "plot3.png")
dev.off()

