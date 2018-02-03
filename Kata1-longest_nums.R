find_longest <- function(arr) {
  v=c(arr)
  winner=""
  if(length(v)>1)
  {
    winner=gsub('[., ]','',toString(v[1]))
    
    for(i in c(1:length(v)))
    {
      print (paste(i))
      print(paste(toString(winner) , ' VS ' , toString(v[i]), sep=''))
      
      if (!is.na(v[i]) && i > 1) # first is winner by default
      {
        
        if (nchar(gsub('[., ]','',toString(v[i]))) == nchar(gsub('[., ]','',toString(winner))))
        {
          # to prevent redefine winner is they same size
        }
        else
        {
          if (nchar(gsub('[., ]','',toString(v[i]))) > nchar(gsub('[., ]','',toString(winner))))
          {
            winner = v[i]
          }
        }
        
      }#is.na
    }#for i
  }# len(v)
  print(paste('Winner : ', winner, sep=''))
  return(winner)
}

find_longest(as.double(c(9000, 8, 800)))
