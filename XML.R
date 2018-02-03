library(XML)


d<- xmlRoot(xmlTreeParse("//Vkovnascti003/ccus/BA/igor_processing/STD_COMMISSIONS_NEW/data/LOG.XML"))

> d[[1]][[1]]
<REPA>01PD_IMPORT</REPA>
> xmlName(d[[1]][[1]])
[1] "REPA"
> xmlValue(d[[1]][[1]])
[1] "01PD_IMPORT"


d$children[[1]] - first set of rows

> d$children[[4]][[1]] = 4 set, firts row
<REPA>PAPER_DOC</REPA>


> xmlSize(d)
[1] 41              <- rows


z<- xmlToDataFrame(getNodeSet(d,"//LOG"))
----------------------------------------------------

getNodeSet(d,"//LOG/REPA") <- get nodes for one column


> d<- xmlRoot(xmlTreeParse("//Vkovnascti003/ccus/BA/igor_processing/STD_COMMISSIONS_NEW/data/cubos_paper.XML"))
> z<- xmlToDataFrame(getNodeSet(d,"//PAPER_201408"))