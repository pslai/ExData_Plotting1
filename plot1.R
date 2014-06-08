# plot1.R, assume you have run cleanData.R first
home.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1"
setwd(home.path)
tidydata.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1/tidydata"
dataset1 <- readRDS(file.path(tidydata.path, "tidydata_assign1.rds"))

png(file = "plot1.png") 
with(dataset1, hist(global_active_power,  main= "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()