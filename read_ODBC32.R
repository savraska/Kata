#make DSN
#run RGui 32 (not 64)


library(RODBC)
#mail2 -is DSN
co<-odbcConnect("mail2", uid="admin")

get table
da <- sqlFetch(co, "Email")

get sql
datt <-sqlQuery (co, "select Subject from Email")

close(co)



 library(RODBC)
> co<- odbcConnect("CUBOS_PHASE_1")
> sqls <- "declare @stDate datetime, @enDate datetime; 
+ select @stDate = dateadd(wk, datediff(wk, 0, getdate()) - 1, 0) , @enDate = dateadd(d,6,@stDate); 
+ select mc.Maker, mc.Checker, count(s.ID) as  [check_qty] from [set] s join SetMakerChecker smc on s.ID = smc.SetId join MakerChecker mc on mc.MakerCheckerId = smc.MakerCheckerId where (mc.MakerDate between @stDate and @enDate) and mc.Checker is not null  group by  mc.Maker, mc.Checker"
dt<- sqlQuery(co, sqls)
close(co)



> library(RODBC)
> co <-odbcConnect("BCC")
> sqls <- "select * FROM VALUTA WHERE DATEK > '20151009'"
> dt <- sqlQuery(co, sqls)

