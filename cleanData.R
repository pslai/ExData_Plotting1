#cleanData.R  
# code for downloading dataset from internet and reformatting variables
# set working directory
home.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1"
setwd(home.path)

# can either manually download data from the internet and place in subfolder of your home directory called rawdata, or run following code (runs on Windows 7)
date_download <- date()
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists(file.path(home.path, "rawdata"))) {dir.create("rawdata")}
rawdata.path <- file.path(home.path, "rawdata")
download.file(fileUrl, destfile=file.path(rawdata.path, "dataset.zip"))
unzip(file.path(rawdata.path, "dataset.zip"), unzip="unzip", exdir=rawdata.path) 

# read in data and reformat
dataset <- read.table(file.path(rawdata.path, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
colnames(dataset) <- tolower(colnames(dataset))
dataset$datetime <- paste(dataset$date, dataset$time, sep = " ")
dataset$datetime <- strptime(dataset$datetime, format = "%d/%m/%Y %H:%M:%S")
dataset$date <- as.Date(dataset$date, format="%d/%m/%Y")

# subsetting data according to instructions
dataset1 <- dataset[dataset$date >= as.Date("2007-02-01") & dataset$date <= as.Date("2007-02-02"), ]

# save formatted dataset in a .rds file, in a subfolder of your home directory called tidydata
if(!file.exists(file.path(home.path, "tidydata"))) {dir.create("tidydata")}
tidydata.path <- file.path(home.path, "tidydata")
saveRDS(dataset1, file.path(tidydata.path, "tidydata_assign1.rds"))