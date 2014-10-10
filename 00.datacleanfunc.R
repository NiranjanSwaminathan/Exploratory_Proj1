dataclean<- function(x)
{
  r=dim(x)
  i=1;
  j=1;
  while(i <= r[1])
  {
    while(j<=r[2])
    {
      if(as.character(x[i,j])=="?")
      {x[i,j] <- NA}
    j=j+1;
    }
  i=i+1;
  }
}
