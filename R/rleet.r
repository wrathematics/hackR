#' Random Hacker Handle Generation
#' 
#' A random generator for l33t hacker handles.
#' 
#' @param case.type
#' String that determines the kind of casing to give the input
#' handle.  Choices are "lower", "upper", "unchanged", "random", and
#' "alternating", and do basically exactly what they sound like.
#' @param sub.type 
#' String that determines the kind of character substitutions
#' @param leetness 
#' Heuristic between 0 and 1 (inclusive) that determines how
#' often character substitutions (e.g., \code{a} to \code{@}) will take place.
#' @param include.unicode 
#' Logical; determines if unicode substitutions should
#' be allowed.
#' 
#' @return
#' A leet hacker handle, for optimal gibson hacking.
#' 
#' @examples
#' hackR::rleet()
#' 
#' @seealso \code{\link{leetify}}
#' @export
rleet <- function(case.type="alternating", sub.type="simple", leetness=.4, include.unicode=FALSE)
{
  leethandle <- paste0(sample(.__hackR_first, size=1L), sample(.__hackR_second, size=1L))
  
  leethandle <- leetify(handle=leethandle, case.type=case.type, sub.type=sub.type, leetness=leetness, include.unicode=include.unicode)
  
  return( leethandle )
}
