# plot3.R
# assumes you have run cleanData.R first

home.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1"
setwd(home.path)
tidydata.path <- "~/Dropbox/Coursera/ExploratoryDataAnalysis/assignment1/ExData_Plotting1/tidydata"
dataset1 <- readRDS(file.path(tidydata.path, "tidydata_assign1.rds"))

png(file = "plot3.png") 
with(dataset1, plot(datetime, sub_metering_1, ylab="Energy sub metering", xlab="", main="", type="n", xaxt="n"))
r <- as.POSIXct(c("2007-02-01 00:00:00", "2007-02-03 00:00:00"), format="%Y-%m-%d %H:%M:%S", tz="")
axis.POSIXct(1, at = seq(r[1], r[2], by = "day"), format = "%a")
with(dataset1, lines(datetime, sub_metering_1, col="black", lwd=1))
with(dataset1, lines(datetime, sub_metering_2, col="red", lwd=1))
with(dataset1, lines(datetime, sub_metering_3, col="blue", lwd=1))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c("solid", "solid", "solid"), lwd=c(1, 1, 1), col=c("black", "red", "blue"),  xjust=0, yjust=0, cex=0.8)
dev.off()