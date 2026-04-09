# plot2.R

file <- "household_power_consumption.txt"

if (!file.exists(file)) {
  if (!file.exists("exdata_data_household_power_consumption.zip")) {
    download.file(
      "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      destfile = "exdata_data_household_power_consumption.zip",
      mode = "wb"
    )
  }
  unzip("exdata_data_household_power_consumption.zip")
}

file <- "household_power_consumption.txt"

dat <- read.table(
  file,
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
dat$Datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(
  dat$Datetime,
  dat$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)",
  xaxt = "n"
)

axis(
  1,
  at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
  labels = c("Thu", "Fri", "Sat")
)

dev.off()