#' Leetify
#' 
#' Functions for converting boring handles into \code{133+ }{@cKeR} handles.
#' 
#' There is an element of random chance, so re-running the same code can
#' produce different outputs.  This is controlled to some degree by the
#' \code{leetness} argument.
#' 
#' \code{leetest()} is just sugar for \code{leetify(leetness=1)}.
#' 
#' @aliases leetify leetest
#' @param handle Input string to be l33tified.
#' @param case.type String that determines the kind of casing to give the input
#' handle.  Choices are "lower", "upper", "unchanged", "random", and
#' "alternating", and do basically exactly what they sound like.
#' @param sub.type String that determines the kind of character substitutions
#' @param leetness Heuristic between 0 and 1 (inclusive) that determines how
#' often character substitutions (e.g., \code{a} to \code{@}) will take place.
#' @param include.unicode Logical; determines if unicode substitutions should
#' be allowed.
#' @return A leet hacker handle, for optimal gibson hacking.
#' @seealso \code{\link{rleet}, \link{modifies}}
#' @examples
#' 
#' \dontrun{
#' library(hackR, quietly=TRUE)
#' leetify("Hadley Wickham")
#' leetest("Hadley Wickham")
#' }
#' 



leetify <- function(handle, case.type="alternating", sub.type="simple", leetness=.4, include.unicode=FALSE)
{
  leethandle <- replaceify(handle=handle, sub.type=sub.type, leetness=leetness, include.unicode=include.unicode)
  leethandle <- caseify(leethandle, case.type=case.type)
  
  return( leethandle )
}



leetest <- function(handle, case.type="alternating", sub.type="simple", include.unicode=FALSE)
{
  leetify(handle=handle, case.type=case.type, sub.type=sub.type, leetness=1, include.unicode=include.unicode)
}
