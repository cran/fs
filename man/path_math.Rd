% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/path.R
\name{path_math}
\alias{path_math}
\alias{path_real}
\alias{path_split}
\alias{path_join}
\alias{path_abs}
\alias{path_norm}
\alias{path_rel}
\alias{path_common}
\alias{path_has_parent}
\title{Path computations}
\usage{
path_real(path)

path_split(path)

path_join(parts)

path_abs(path, start = ".")

path_norm(path)

path_rel(path, start = ".")

path_common(path)

path_has_parent(path, parent)
}
\arguments{
\item{path}{A character vector of one or more paths.}

\item{parts}{A character vector or a list of character vectors, corresponding
to split paths.}

\item{start}{A starting directory to compute the path relative to.}

\item{parent}{The parent path.}
}
\value{
The new path(s) in an \code{fs_path} object, which is a character vector
that also has class \code{fs_path}. Except \code{path_split()}, which returns a list
of character vectors of path components.
}
\description{
All functions apart from \code{path_real()} are purely path computations, so the
files in question do not need to exist on the filesystem.
}
\section{Functions}{
\itemize{
\item \code{path_real()}: returns the canonical path, eliminating any symbolic
links and the special references \code{~}, \code{~user}, \code{.}, and \code{..}, , i.e. it
calls \code{path_expand()} (literally) and \code{path_norm()} (effectively).

\item \code{path_split()}: splits paths into parts.

\item \code{path_join()}: joins parts together. The inverse of \code{\link[=path_split]{path_split()}}.
See \code{\link[=path]{path()}} to concatenate vectorized strings into a path.

\item \code{path_abs()}: returns a normalized, absolute version of a path.

\item \code{path_norm()}: eliminates \code{.} references and rationalizes up-level
\code{..} references, so \code{A/./B} and \code{A/foo/../B} both become \code{A/B}, but \code{../B}
is not changed. If one of the paths is a symbolic link, this may change the
meaning of the path, so consider using \code{path_real()} instead.

\item \code{path_rel()}: computes the path relative to the \code{start} path,
which can be either an absolute or relative path.

\item \code{path_common()}: finds the common parts of two (or more) paths.

\item \code{path_has_parent()}: determine if a path has a given parent.

}}
\examples{
\dontshow{.old_wd <- setwd(tempdir())}
dir_create("a")
file_create("a/b")
link_create(path_abs("a"), "c")

# Realize the path
path_real("c/b")

# Split a path
parts <- path_split("a/b")
parts

# Join it together
path_join(parts)

# Find the absolute path
path_abs("..")

# Normalize a path
path_norm("a/../b\\\\c/.")

# Compute a relative path
path_rel("/foo/abc", "/foo/bar/baz")

# Find the common path between multiple paths
path_common(c("/foo/bar/baz", "/foo/bar/abc", "/foo/xyz/123"))

# Cleanup
dir_delete("a")
link_delete("c")
\dontshow{setwd(.old_wd)}
}
\seealso{
\code{\link[=path_expand]{path_expand()}} for expansion of user's home directory.
}
