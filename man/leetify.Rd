\name{ leetify }

\alias{leetify}
\alias{leetest}

\title{ Leetify }

\description{
  Functions for converting boring handles into \code{133+ \}\{@cKeR}
  handles.
}
\usage{
  leetify(handle, case.type="alternating", sub.type="simple", leetness=0.4, include.unicode=FALSE)
  leetest(handle, case.type="alternating", sub.type="simple", include.unicode=FALSE)
}
\arguments{
  \item{handle}{Input string to be l33tified.}
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
\details{
  There is an element of random chance, so re-running the same
  code can produce different outputs.  This is controlled to some
  degree by the \code{leetness} argument.
  
  \code{leetest()} is just sugar for \code{leetify(leetness=1)}.
}
\value{
  A leet hacker handle, for optimal gibson hacking.
}
\seealso{
  \code{\link{rleet}, \link{modifies}}
}
\examples{
\dontrun{
library(hackR, quietly=TRUE)
leetify("Hadley Wickham")
leetest("Hadley Wickham")
}
}


