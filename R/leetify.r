# 2l33t4u
replaceify <- function(name, leetness=.4, include.unicode=FALSE)
{
  leet.in <-  c("a", "b", "e", "g", "h",  "i", "k", "l", "m",  "o", "p",  "s", "t", "w",     "z")
  leet.out <- c("@", "8", "3", "6", "}{", "!", "X", "1", "^^", "0", "|>", "5", "+", "(/\\)", "2")
  
  if (include.unicode)
  {
    leet.in <- c(leet.in,   "r", "n")
    leet.out <- c(leet.out, "Я", "И")
  }
  
  TF <- c(TRUE, FALSE)
  prob <- c(leetness, 1-leetness)
  
  tmp <- unlist(strsplit(x=name, split=""))
  for (i in 1:length(leet.in))
  {
    matches <- grep(x=tmp, pattern=leet.in[i], ignore.case=TRUE)
    
    for (match in matches)
    {
      if (sample(TF, size=1, prob=prob))
        tmp[match] <- leet.out[i]
    }
  }
  
  leetname <- paste0(tmp, collapse="")
  return( leetname )
}



leetify <- function(name, casetype="alternating", leetness=.4, include.unicode=FALSE)
{
  type <- match.arg(tolower(casetype), c("lower", "upper", "unchanged", "random", "alternating"))
  
  if (type == "lower")
    name <- tolower(name)
  else if (type == "upper")
    name <- toupper(name)
  
  leetname <- replaceify(name=name, leetness=leetness, include.unicode=include.unicode)
  leetname <- caseify(leetname, type=casetype)
  
  return( leetname )
}



leetest <- function(name, include.unicode=FALSE)
{
  leetify(name=name, casetype="alternating", leetness=1, include.unicode=include.unicode)
}


