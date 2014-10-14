# 2l33t4u
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


