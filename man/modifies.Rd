\name{ modifies }

\alias{modifies}
\alias{caseify}
\alias{replaceify}

\title{ Modifies }

\description{
  A set of utilities for creating hacker handles.  One modifies
  case of characters to be annoying, while the other does
  character substitutions to make the handle varying degrees of
  unreadable.
}
\usage{
  caseify(handle, case.type="alternating")
  replaceify(handle, sub.type="simple", leetness=.4, include.unicode=FALSE)
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
}
\seealso{
  \code{\link{rleet}}
}
\examples{
\dontrun{
library(hackR, quietly=TRUE)

}
}


