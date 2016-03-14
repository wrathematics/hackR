#' caseify
#' 
#' Makes the input string have l33t casing.
#' 
#' @description
#' 2l33t4u
#' 
#' @param handle 
#' Input string to be caseified.
#' @param case.type 
#' String that determines the kind of casing to give the input
#' handle.  Choices are "lower", "upper", "unchanged", "random", and
#' "alternating", and do basically exactly what they sound like.
#' @param leetness
#' Heuristic between 0 and 1 (inclusive) that determines how
#' often character substitutions (e.g., \code{a} to \code{@}) will take place.
#' 
#' @return
#' The input string with l33t casing, LiKe ThIs.
#' 
#' @examples
#' hackR::caseify("This is what the internet looked like 20 years ago")
#' 
#' @seealso \code{\link{rleet}}
#' @export
caseify <- function(handle, case.type="alternating", leetness=.4)
{
  case.type <- match.arg(tolower(case.type), c("lower", "upper", "unchanged", "random", "alternating"))
  
  if (case.type == "unchanged")
    return( handle )
  else if (case.type == "lower")
    return( tolower(handle) )
  else if (case.type == "upper")
    return( toupper(handle) )
  
  # Someone could be a jerk and change letters/LETTERS in the global environment
  # generated via: cat(paste0("c(\"", paste(letters, collapse="\", \""), "\")"))
  letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
  LETTERS <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
  
  TF <- c(TRUE, FALSE)
  prob <- c(leetness, 1-leetness)
  # prob <- c(.5, .5)
  
  tmp <- unlist(strsplit(x=handle, split=""))
  
  if (case.type == "random")
  {
    for (i in 1:length(tmp))
    {
      if (sample(TF, size=1, prob=prob))
        tmp[i] <- get_alt_case(letter=tmp[i], letters=letters, LETTERS=LETTERS)
    }
  }
  else if (case.type == "alternating")
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
      else if (prev.case == "neither")
      {
        if (sample(TF, size=1))
          tmp[i] <- get_alt_case(letter=tmp[i], letters=letters, LETTERS=LETTERS)
        
        prev.case <- get_current_case(letter=tmp[i], letters=letters, LETTERS=LETTERS)
      }
      else
        prev.case <- current.case
    }
  }
  
  leethandle <- paste0(tmp, collapse="")
  return( leethandle )
}



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
