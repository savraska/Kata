library(RODBC)
chnl <- odbcConnect("CUBOS_LC")
data <- sqlQuery(chnl,"select * from CustomerSettings")
tables <- sqlTables(chnl,schema="dbo")
