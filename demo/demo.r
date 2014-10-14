setwd("~/dev/hackeR/")


source("R/gen.r")
source("R/case.r")

nm <- rleet()
nm
leetest(nm)


nm <- rleet(0)
nm
#caseify(nm, "rand")
#caseify(nm, "alt")

caseify(leetest(nm), "alt")
