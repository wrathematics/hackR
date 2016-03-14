#' replaceify
#' 
#' Makes the input string use l33t character substitutions.
#' 
#' @description
#' 2l33t4u
#' 
#' @param handle 
#' Input string to be l33tified.
#' @param sub.type 
#' String that determines the kind of character substitutions
#' @param leetness
#' Heuristic between 0 and 1 (inclusive) that determines how
#' often character substitutions (e.g., \code{a} to \code{@}) will take place.
#' @param include.unicode
#' Logical; should unicode substitutions should be allowed?
#' 
#' @return
#' The input string with l33t substitutions, 1ik3 tHi5.
#' 
#' @examples
#' hackR::replaceify("This is what the internet looked like 20 years ago")
#' 
#' @seealso \code{\link{rleet}, \link{caseify}}
#' @export
replaceify <- function(handle, sub.type="simple", leetness=.4, include.unicode=FALSE)
{
  sub.type <- match.arg(tolower(sub.type), c("simple", "complex"))
  
  if (sub.type == "simple")
  {
    leet.out <- list(
      a="@", 
      b="8", 
      c="<", 
      d="d",
      e="3",
      f="f", 
      g="6", 
      h="}{", 
      i="!",
      j=";", 
      k="X", 
      l="1", 
      m="^^", 
      n="n",
      o="0", 
      p="p",
      q="q",
      r="r", 
      s=c("5", "$"),
      t="+", 
      u="u",
      v="v",
      w="w", 
      x="><",
      y="y",
      z="2"
    )
  }
  else if (sub.type == "complex")
  {
    leet.out <- list(
      a=c("4", "/\\", "@", "/-\\", "^"),
      b=c("8", "6", "|3"),
      c=c("[", "<"),
      d=c("|)", "[)", "I>", "|>"),
      e=c("3", "[-", "|=-"),
      f=c("|=", "|#"),
      g=c("6", "(_+"),
      h=c("}{", "#", "/-/", "[-]", "{=}", "|-|", "]~["), 
      i=c("!", "]["),
      j=";", 
      k=c("X", "|<", "|("),
      l=c("1", "|_"),
      m=c("^^", "//.", "{V}", "/\\/\\", "[]V[]", "(V)"),
      n=c("//", "^/", "|\\|", "/\\/", "[\\]", "<\\>", "{\\}"),
      o=c("0", "()", "*"),
      p=c("|^", "|o", "|\"", "[]D", "|7"),
      q=c("9", "<|"),
      r=c("|2", "|z"),
      s=c("5", "$", "z"),
      t=c("+", "-|-"),
      u=c("(_)", "|_|"),
      v="\\/",
      w=c("vv", "(n)", "\\^/", "\\X/"),
      x=c("><", ")("),
      y=c("'/", "%"),
      z="2"
    )
  }
  
  if (include.unicode)
  {
    leet.out$a <- c(leet.out$a, "\u00E4")
    leet.out$b <- c(leet.out$b, "\u00DF")
    leet.out$c <- c(leet.out$c, "\u00A2")
    leet.out$e <- c(leet.out$e, c("\u00EB", "\u20AC", "\u00EA"))
    leet.out$i <- c(leet.out$i, "\u00EF")
    leet.out$l <- c(leet.out$l, "\u00A3")
    leet.out$n <- c(leet.out$n, c("\u0418", "\u20AA"))
    leet.out$o <- c(leet.out$o, "\u00F6")
    leet.out$p <- c(leet.out$p, "\u00FE")
    leet.out$q <- c(leet.out$q, "\u00B6")
    leet.out$r <- c(leet.out$r, "\u042F")
    leet.out$s <- c(leet.out$s, "\u00A7")
    leet.out$u <- c(leet.out$u, c("\u00B5", "\u00FC"))
    leet.out$x <- c(leet.out$x, "\u0416")
    leet.out$y <- c(leet.out$y, "\u00A5")
  }
  
  letters <- names(leet.out)
  
  TF <- c(TRUE, FALSE)
  prob <- c(leetness, 1-leetness)
  
  tmp <- unlist(strsplit(x=handle, split=""))
  for (letter in letters)
  {
    matches <- grep(x=tmp, pattern=letter, ignore.case=TRUE)
    
    for (match in matches)
    {
      if (sample(TF, size=1L, prob=prob))
        tmp[match] <- sample(leet.out[[letter]], size=1L)
    }
  }
  
  leethandle <- paste0(tmp, collapse="")
  return( leethandle )
}
