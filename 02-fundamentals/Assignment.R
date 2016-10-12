getwd()
setwd("C:/Users/Venkatesh/Documents/Machine Learning/tmp/CSX460/02-fundamentals/data")

#1
airports <- read.csv("airports.csv", stringsAsFactors = FALSE)
flights <- read.csv("flights.csv", stringsAsFactors = FALSE)
planes <- read.csv("planes.csv", stringsAsFactors = FALSE)
weather <- read.csv("weather.csv", stringsAsFactors = FALSE)

#2
hist(flights$arr_delay,main="Histogram for Air Passengers", 
     xlab="Arrival Delay", 
     border="blue", 
     col="green")

hist(flights$dep_delay,main="Histogram for Air Passengers", 
     xlab="Departure Delay", 
     border="blue", 
     col="green")

#3
plot(flights$arr_delay, flights$dep_delay,main="Scatterplot for Air Passengers", 
     xlab="Arrival Delay", ylab="Departure Delay", pch=20, col="green")

#4
install.packages("data.table")
library("data.table")

FLIGHTS <- data.table(flights$origin,flights$carrier)
setnames(FLIGHTS,"V1","Origin")
setnames(FLIGHTS,"V2","Carrier")
FLIGHTS


#5
airportTable <- data.table(airports)
flightTable <- data.table(flights)
planeTable <- data.table(planes)
weatherTable <- data.table(weather)

setkey(airportTable,faa)
setkey(flightTable,origin)
airportFlightTable <- airportTable[flightTable,nomatch=0]
setkey(airportFlightTable,tailnum)
setkey(planeTable,tailnum)
airportFlightPlaneTable <- airportFlightTable[planeTable,nomatch=0]
setkey(airportFlightPlaneTable,faa,year,month,day,hour)
setkey(weatherTable,origin,year,month,day,hour)
Result <- airportFlightPlaneTable[weatherTable]
Result
  
  
  
  
  
  

