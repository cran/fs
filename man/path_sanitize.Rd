% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sanitize.R
\name{path_sanitize}
\alias{path_sanitize}
\title{Sanitize a filename by removing directory paths and invalid characters}
\usage{
path_sanitize(filename, replacement = "")
}
\arguments{
\item{filename}{A character vector to be sanitized.}

\item{replacement}{A character vector used to replace invalid characters.}
}
\description{
\code{path_sanitize()} removes the following:
\itemize{
\item \href{https://en.wikipedia.org/wiki/C0_and_C1_control_codes}{Control characters}
\item \href{https://web.archive.org/web/20230126161942/https://kb.acronis.com/content/39790}{Reserved characters}
\item Unix reserved filenames (\code{.} and \code{..})
\item Trailing periods and spaces (invalid on Windows)
\item Windows reserved filenames (\code{CON}, \code{PRN}, \code{AUX}, \code{NUL}, \code{COM1}, \code{COM2},
\code{COM3}, COM4, \code{COM5}, \code{COM6}, \code{COM7}, \code{COM8}, \code{COM9}, \code{LPT1}, \code{LPT2},
\code{LPT3}, \code{LPT4}, \code{LPT5}, \code{LPT6}, LPT7, \code{LPT8}, and \code{LPT9})
The resulting string is then truncated to \href{https://en.wikipedia.org/wiki/Comparison_of_file_systems#Limits}{255 bytes in length}
}
}
\examples{
# potentially unsafe string
str <- "~/.\u0001ssh/authorized_keys"
path_sanitize(str)

path_sanitize("..")
}
\seealso{
\url{https://www.npmjs.com/package/sanitize-filename}, upon which this
function is based.
}
