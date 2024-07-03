\name{changepoint.sim2D}
\alias{changepoint.sim2D}

\title{
Simulated change-point data for two-dimensions
}

\description{
This function simulates circular change-point data with Gaussian noise.
}

\usage{
changepoint.sim2D(data.dim = c(100,100),sigma = 20,radius=NULL,cbase=80,ctop=130)
}

\arguments{
  \item{data.dim}{
  Vector of two integers for the size of the two-dimensional dataset. The dimensions
  are suggested to be the same. However, for uneven dimensions, the first value must
  be larger. The default is an image of 100 by 100 pixels.}
  \item{sigma}{
  Numeric value of standard deviation.
  }
  \item{radius}{
  Numeric value of the radius of the inner disk before the change-point. The radius cannot be larger than one-half of either dimension in \code{data.dim}. Defaults to one-quarter of the first dimension of \code{data.dim}.
  }
  \item{cbase}{
  Numeric value for the disk that radiates out from the approximate center of the dataset.
  }
  \item{ctop}{
  Numeric value after the circular change-point, seperating the disk and the outer region.
  }
}


\value{
  This function produces a matrix of integer values of the same dimensions as \code{data.dim}.
}

\references{

    Thompson, J.R.J. (2024) \dQuote{Iterative Smoothing for Change-point Regression Function Estimation}, \emph{Journal of Applied Statistics}, 1-25. <doi:10.1080/02664763.2024.2352759>

}

\examples{
## Simulate 2D data and plot it
library(reshape2)
changepoint.data <- changepoint.sim2D()
image(1:nrow(changepoint.data), 1:ncol(changepoint.data),
      matrix(changepoint.data, nrow=nrow(changepoint.data), byrow=FALSE))
}

