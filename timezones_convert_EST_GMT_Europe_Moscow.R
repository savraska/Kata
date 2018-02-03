library(lubridate)

> a<- as.POSIXct("2015-04-04 20:00:00", tz="EST")
> with_tz (a, "Europe/Moscow")
[1] "2015-04-05 05:00:00 MSK"  - 2 hours, actually 03:00 AM



> b<- as.POSIXct("2015-02-07 21:00:00", tz="GMT")
> with_tz (b, "Europe/Moscow")
[1] "2015-02-08 01:00:00 MSK"


For Moscow -1 hour winter time, so actually 2015-02-08 _00:00:00_ MSK
