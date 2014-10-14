first <- readLines("first.txt")
second <- readLines("second.txt")

Rfirst <- paste0(".__hackR_first <- c(\"", paste0(first, collapse="\", \""), "\")")
Rsecond <- paste0(".__hackR_second <- c(\"", paste0(second, collapse="\", \""), "\")")

cat(paste(Rfirst, Rsecond, sep="\n"), file="../R/data.r", append=FALSE)
