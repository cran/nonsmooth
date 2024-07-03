\name{fireData}
\docType{data}
\alias{fireData}
\title{Wax paper fire smouldering experiment conducted in a fume hood}
\description{

The fire spread data consists of 45 segmented RGB images from a fire
smouldering experiment of wax paper. The data were measured using
a digital camera at a birds-eye view above the experiment. The data
is segmented 1 frame per second.

}

\usage{data("fireData")}

\format{

The movie of the fire spread is a data frame with four dimensions. The
first and second dimensions of the data frame are the pixel coordinates
of one image. The third dimension is the RGB channel, with the red channel
(1), blue channel (2), and green channel (3). The fourth dimension is time,
starting at ignition (time point 1), and then each RGB image is separated by
one second for a total of 45 seconds.

}

\source{John R.J. Thompson}

\references{

  Thompson, J.R.J., Wang, X.J., & Braun, W.J. (2020) \dQuote{A mouse
  model for studying fire spread rates using experimental micro-fires},
  \emph{Journal of Environmental Statistics}, 9(1), 1-19.
  <[https://www.jenvstat.org/v09/i06]https://www.jenvstat.org/v09/i06>

  Wang, X.J., Thompson, J.R.J., Braun, W.J., & Woolford, D.G. (2019)
  \dQuote{Fitting a stochastic fire spread model to data.}
  \emph{Advances in Statistical Climatology, Meteorology and
  Oceanography}, 5(1), 57-66.
  <[https://ascmo.copernicus.org/articles/5/57/2019/]https://ascmo.copernicus.org/articles/5/57/2019/>

}

\keyword{datasets}

\examples{
## Example - viewing a fire spread experiment that contains change-points

data("fireData")

## Plot the red channel at 10 seconds as a 2d image

image(1:dim(fireData)[1], 1:dim(fireData)[2],
      matrix(fireData[,,1,10], nrow=dim(fireData)[1], byrow=FALSE))
}
