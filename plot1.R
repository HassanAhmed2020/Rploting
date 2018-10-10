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


hist(house_pwr_cons_df$Global_active_power, col = "red",
                        xlab = "Global Active Power (kilowatts)",
                        main  = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()

