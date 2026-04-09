# plot1.R

if (!file.exists("household_power_consumption.txt")) {
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

png("plot1.png", width = 480, height = 480)
hist(
  dat$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)",
  ylab = "Frequency"
)
dev.off()