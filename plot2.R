# plot2.R
# assumes you have run cleanData.R first

home.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1"
setwd(home.path)
tidydata.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1/tidydata"
dataset1 <- readRDS(file.path(tidydata.path, "tidydata_assign1.rds"))

png(file = "plot2.png") 
with(dataset1, plot(datetime, global_active_power, ylab="Global Active Power (kilowatts)", xlab="", main="", type="n", xaxt="n"))
with(dataset1, lines(datetime, global_active_power))
r <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-03 00:00:00"), format="%Y-%m-%d %H:%M:%S", tz="")
axis.POSIXct(1, at = seq(r[1], r[2], by = "day"), format = "%a")
dev.off()