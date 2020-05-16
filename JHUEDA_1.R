library("data.table")

getwd()


power <- data.table::fread(input = "household_power_consumption.txt"
                                    , na.strings="?"
)


power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power") ]

power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]


png("plot2.png", width=480, height=480)


hist(power[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Blue")


dev.off()
