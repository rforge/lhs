\name{improvedLHS}
\alias{improvedLHS}
\title{Improved Latin Hypercube Sample}
\description{
Draws a Latin Hypercube Sample from a set of uniform distributions for use in
creating a Latin Hypercube Design.  This function attempts to optimize the
sample with respect to an optimum euclidean distance between design points.
}
\usage{improvedLHS(n, k, dup=1)}
\arguments{
  \item{n}{The number of partitions (simulations or design points)}
  \item{k}{The number of replications (variables)}
  \item{dup}{A factor that determines the number of candidate points used in the
             search. A multiple of the number of remaining points than can be
             added.}
}
\details{
Latin hypercube sampling (LHS) was developed to generate a distribution
of collections of parameter values from a multidimensional distribution.
A square grid containing possible sample points is a Latin square iff there
is only one sample in each row and each column. A Latin hypercube is the
generalisation of this concept to an arbitrary number of dimensions.  When
sampling a function of \code{k} variables, the range of each variable is divided
into \code{n} equally probable intervals. \code{n} sample points are then drawn such that a
Latin Hypercube is created.  Latin Hypercube sampling generates more efficient
estimates of desired parameters than simple Monte Carlo sampling.

This program generates a Latin Hypercube Sample by creating random permutations
of the first \code{n} integers in each of \code{k} columns and then transforming those
integers into n sections of a standard uniform distribution.  Random values are
then sampled from within each of the n sections.  Once the sample is generated,
the uniform sample from a column can be transformed to any distribution by
using the quantile functions, e.g. qnorm().  Different columns can have
different distributions.

This function attempts to optimize the sample with respect to an optimum
euclidean distance between design points.
\deqn{Optimum distance = frac{n}{n^{\frac{1.0}{k}}}}{Optimum distance = n/n^(1.0/k)}
}
\value{
An \code{n} by \code{k} Latin Hypercube Sample matrix with values uniformly distributed on [0,1]
}
\references{
  Beachkofski, B., Grandhi, R.  (2002)
  Improved Distributed Hypercube Sampling
  \emph{American Institute of Aeronautics and Astronautics Paper}
  \bold{1274}.
  
  This function is based on the MATLAB program written by
  John Burkardt and modified 16 Feb 2005
  \url{http://www.csit.fsu.edu/~burkardt/m_src/ihs/ihs.m}
}
\author{Rob Carnell}
\seealso{
  \code{\link{randomLHS}}, \code{\link{geneticLHS}},
  \code{\link{maximinLHS}}, and
  \code{\link{optimumLHS}} to generate Latin Hypercube Samples.
  \code{\link{optAugmentLHS}}, \code{\link{optSeededLHS}}, and
  \code{\link{augmentLHS}} to modify and augment existing designs.
}
\examples{
  improvedLHS(4, 3, 2)
}
\keyword{design}
