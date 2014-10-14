rleet <- function(case.type="alternating", sub.type="simple", leetness=.4, include.unicode=FALSE)
{
  leethandle <- paste0(sample(.__hackR_first, size=1L), sample(.__hackR_second, size=1L))
  
  leethandle <- leetify(handle=leethandle, case.type=case.type, sub.type=sub.type, leetness=leetness, include.unicode=include.unicode)
  
  return( leethandle )
}

