# plot3.R

file <- "household_power_consumption.txt"

dat <- read.table(
  file,
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

dat$Datetime <- strptime(
  paste(dat$Date, dat$Time),
  "%d/%m/%Y %H:%M:%S"
)

png("plot3.png", width = 480, height = 480)

plot(
  dat$Datetime,
  dat$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering",
  xaxt = "n"
)

lines(dat$Datetime, dat$Sub_metering_2, col = "red")
lines(dat$Datetime, dat$Sub_metering_3, col = "blue")

axis(
  1,
  at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
  labels = c("Thu", "Fri", "Sat")
)

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  lwd = 1,
  bty = "n"
)

dev.off()