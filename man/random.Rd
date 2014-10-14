\name{ rleet }

\alias{rleet}

\title{ Random Hacker Handle Generation }

\description{
  A random generator for l33t hacker handles.
}
\usage{
  rleet(case.type="alternating", sub.type="simple", leetness=.4, 
        include.unicode=FALSE)
}
\arguments{
  \item{case.type}{String that determines the kind of casing to
  give the input handle.  Choices are "lower", "upper", "unchanged",
  "random", and "alternating", and do basically exactly what they
  sound like.}
  \item{sub.type}{String that determines the kind of character
  substitutions}
  \item{leetness}{Heuristic between 0 and 1 (inclusive) that determines
  how often character substitutions (e.g., \code{a} to \code{@}) will
  take place.}
  \item{include.unicode}{Logical; determines if unicode substitutions
  should be allowed.}
}
\value{
  A leet hacker handle, for optimal gibson hacking.
}
\seealso{
  \code{\link{leetify}}
}
\examples{
\dontrun{
library(hackR, quietly=TRUE)
rleet()
}
}


