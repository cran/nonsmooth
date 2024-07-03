\name{nonsmooth}
\alias{nonsmooth}
\alias{nonsmooth-package}
\docType{package}
\title{Nonparametric methods for smoothing nonsmooth data}
\description{

This package provides nonparametric methods for smoothing nonsmooth data.
Change-point data is the intended application, with a focus on those with
jumps in the regression function. Descriptions of the implementation of these
methods can be found in Thompson, J.R.J. (2024).

}

\details{

This package contains two additional functions for simulated one-D and two-D
change-point data. This package also contains a real fire spread dataset from
a micro-fire experiment. This data can be viewed as time dependent
two-dimensional change-point data. The boundaries between fuel, burning and
burn-out regions are seperated by two change-point curves. More information
on experimentation and data can befound in Thompson, Wang, and Braun (2020)
and Wang, Thompson, and Braun (2019).

}

\author{
  John R.J. Thompson <john.thompson@ubc.ca>

  Maintainer: John R.J. Thompson <john.thompson@ubc.ca>

  I would like to acknowledge funding support from the University of British
  Columbia Aspire Fund (UBC:www.ok.ubc.ca/).

}
\references{

    Thompson, J.R.J. (2024) \dQuote{Iterative Smoothing for Change-point Regression Function Estimation}, \emph{Journal of Applied Statistics}, 1-25. <doi:10.1080/02664763.2024.2352759>

    Thompson, J.R.J., Wang, X.J., & Braun, W.J. (2020) \dQuote{A mouse model for studying fire spread rates using experimental micro-fires}, \emph{Journal of Environmental Statistics}, 9(1), 1-19. <[https://www.jenvstat.org/v09/i06]https://www.jenvstat.org/v09/i06>

    Wang, X.J., Thompson, J.R.J., Braun, W.J., & Woolford, D.G. (2019) \dQuote{Fitting a stochastic fire spread model to data.} \emph{Advances in Statistical Climatology, Meteorology and Oceanography}, 5(1), 57-66. <[https://ascmo.copernicus.org/articles/5/57/2019/]https://ascmo.copernicus.org/articles/5/57/2019/>


}
\keyword{package}
