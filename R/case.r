get_current_case <- function(letter, letters, LETTERS)
{
  match <- which(letter == letters)
  if (length(match) > 0)
    return( "lower" )
  
  match <- letters[which(letter == LETTERS)]
  if (length(match) > 0)
    return( "upper" )
  
  return( "neither" )
}



get_alt_case <- function(letter, letters, LETTERS)
{
  match <- LETTERS[which(letter == letters)]
  if (length(match) == 0)
    match <- letters[which(letter == LETTERS)]
  if (length(match) == 0)
    match <- letter
  
  return( match )
}



caseify <- function(name, type="alternating")
{
  type <- match.arg(tolower(type), c("lower", "upper", "unchanged", "random", "alternating"))
  
  if (type == "unchanged")
    return( name )
  else if (type == "lower")
    return( tolower(name) )
  else if (type == "upper")
    return( toupper(name) )
  
  # Someone could be a jerk and change letters/LETTERS in the global environment
  # generated via: cat(paste0("c(\"", paste(letters, collapse="\", \""), "\")"))
  letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
  LETTERS <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
  
  TF <- c(TRUE, FALSE)
#  prob <- c(leetness, 1-leetness)
  prob <- c(.5, .5)
  
  tmp <- unlist(strsplit(x=name, split=""))
  
  if (type == "random")
  {
    for (i in 1:length(tmp))
    {
      if (sample(TF, size=1, prob=prob))
        tmp[i] <- get_alt_case(letter=tmp[i], letters=letters, LETTERS=LETTERS)
    }
  }
  else if (type == "alternating")
  {
    if (sample(TF, size=1))
      tmp[1L] <- get_alt_case(letter=tmp[1L], letters=letters, LETTERS=LETTERS)
    
    prev.case <- get_current_case(letter=tmp[1L], letters=letters, LETTERS=LETTERS)
    
    if (length(tmp) == 1) break
    for (i in 2L:length(tmp))
    {
      current.case <- get_current_case(letter=tmp[i], letters=letters, LETTERS=LETTERS)
      
      if (prev.case == current.case)
      {
        tmp[i] <- get_alt_case(letter=tmp[i], letters=letters, LETTERS=LETTERS)
        
        if(current.case == "upper") 
          prev.case <- "lower" 
        else if (prev.case == "lower") 
          prev.case <- "upper" 
        else 
          prev.case <- current.case
      }
      else
        prev.case <- current.case
    }
  }
  
  leetname <- paste0(tmp, collapse="")
  return( leetname )
}

