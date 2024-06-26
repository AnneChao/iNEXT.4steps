% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MainFun.R
\name{Completeness}
\alias{Completeness}
\title{Main function for STEP 1: Assessment of sample completeness}
\usage{
Completeness(
  data,
  q = seq(0, 2, 0.2),
  datatype = "abundance",
  nboot = 30,
  conf = 0.95,
  nT = NULL
)
}
\arguments{
\item{data}{(a) For \code{datatype = "abundance"}, data can be input as a vector of species abundances (for a single assemblage), matrix/data.frame (species by assemblages), or a list of species abundance vectors. \cr
(b) For \code{datatype = "incidence_raw"}, data can be input as a list of matrix/data.frame (species by sampling units); data can also be input as a matrix/data.frame by merging all sampling units across assemblages based on species identity; in this case, the number of sampling units (nT, see below for this argument) must be input.}

\item{q}{a numerical vector specifying the orders of sample completeness. Default is \code{seq(0, 2, by = 0.2)}.}

\item{datatype}{data type of input data: individual-based abundance data (\code{datatype = "abundance"}) or species by sampling-units incidence matrix (\code{datatype = "incidence_raw"}) with all entries being 0 (non-detection) or 1 (detection).}

\item{nboot}{a positive integer specifying the number of bootstrap replications when assessing sampling uncertainty and constructing confidence intervals. Enter 0 to skip the bootstrap procedures. Default is 30.}

\item{conf}{a positive number < 1 specifying the level of confidence interval. Default is 0.95.}

\item{nT}{(required only when \code{datatype = "incidence_raw"} and input data in a single matrix/data.frame) a vector of positive integers specifying the number of sampling units in each assemblage. If assemblage names are not specified (i.e., \code{names(nT) = NULL}), then assemblages are automatically named as "Assemblage1", "Assemblage2",..., etc.}
}
\value{
a matrix of estimated sample completeness of order q: 
        \item{Order.q}{the order of sample completeness.}
        \item{Estimate.SC}{the estimated sample completeness of order q.}
        \item{s.e.}{standard error of sample completeness estimate.}
        \item{SC.LCL, SC.UCL}{the bootstrap lower and upper confidence limits for the sample completeness of order q at the specified level (with a default value of \code{0.95}).}
        \item{Assemblage}{the assemblage name.}
}
\description{
\code{Completeness} computes sample completeness estimates of orders q = 0 to 2 in increments of 0.2 (by default).
}
\examples{
\donttest{
## Sample completeness for abundance data
data(Data_spider)
SC_out1 <- Completeness(data = Data_spider, datatype = "abundance")
SC_out1
}

## Sample completeness for incidence raw data
data(Data_woody_plant)
SC_out2 <- Completeness(data = Data_woody_plant, datatype = "incidence_raw")
SC_out2


}
