rleet <- function(casetype="alternating", leetness=.4, include.unicode=FALSE)
{
  leetname <- paste0(sample(.__hackR_first, size=1L), sample(.__hackR_second, size=1L))
  
  leetname <- leetify(name=leetname, leetness=leetness, include.unicode=include.unicode)
  
  return( leetname )
}

