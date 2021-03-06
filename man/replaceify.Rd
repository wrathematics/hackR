% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replaceify.r
\name{replaceify}
\alias{replaceify}
\title{replaceify}
\usage{
replaceify(handle, sub.type = "simple", leetness = 0.4,
  include.unicode = FALSE)
}
\arguments{
\item{handle}{Input string to be l33tified.}

\item{sub.type}{String that determines the kind of character substitutions}

\item{leetness}{Heuristic between 0 and 1 (inclusive) that determines how
often character substitutions (e.g., \code{a} to \code{@}) will take place.}

\item{include.unicode}{Logical; should unicode substitutions should be allowed?}
}
\value{
The input string with l33t substitutions, 1ik3 tHi5.
}
\description{
2l33t4u
}
\details{
Makes the input string use l33t character substitutions.
}
\examples{
hackR::replaceify("This is what the internet looked like 20 years ago")

}
\seealso{
\code{\link{rleet}, \link{caseify}}
}

