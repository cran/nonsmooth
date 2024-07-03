\name{alc}
\alias{alc}
\title{Iterative anisotropic local constant smoothing
}
\description{
This function implements the method in Thompson, J.R.J. (2024) for iterative smoothing
of change-point data that utilizes oversmoothed estimates of the underlying data
generating process to inform re-smoothing. The function calculates a local constant
estimator \eqn{\tilde{g}(X)} of \eqn{Y=g(X)+\epsilon}, and then utilizes \eqn{\tilde{g}(x)}
in the range kernel of another local constant estimator. This process is iterated
for a specified number of resmooth iterations.
}
\usage{
alc(X,Y,bw.fixed.value=NULL,resmooths=1,\dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
  numeric matrix of \eqn{p} columns of the observations for continuous explanatory variables.
}
  \item{Y}{
  numeric vector of the continuous response variable.
}
  \item{bw.fixed.value}{
  numeric value for the bandwidth of the range kernel. Setting this value sets the
  iterative smoothing bandwidths to be the local constant estimator bandwidths for
  domain kernels and the set value for the range kernel. Default is \code{NULL}, which
  isan optimal bandwidth selection procedure during each re-smooth through the
  \code{npreg} function.
}
  \item{resmooths}{
  integer number of resmooth iterations. Default is 1 resmooth, which is a suggested starting point
  for iterative smoothing.
}
  \item{\dots}{
  additional specifications for \code{np} smoothing, such as optimal bandwidth selection
  procedure, kernel type,  regression estimator, and so on. See \code{npreg} function for
  more details and defaults.
}
}

\value{
 The code here returns a \code{npregression} object of the iteratively smoothed estimator.
 For more details, see the \code{npreg} function in the \code{np} package.
}

\seealso{
  \code{\link[np]{npreg}}, \code{\link[np]{npregbw}}
}

\references{

    Thompson, J.R.J. (2024) \dQuote{Iterative Smoothing for Change-point Regression Function Estimation}, \emph{Journal of Applied Statistics}, 1-25. <doi:10.1080/02664763.2024.2352759>
}

\examples{
\donttest{
library(np)
options(np.messages=FALSE)

## 1D Simulated change-point data
changepoint.data <- changepoint.sim1D(500)

## Isotropic local constant model
bw.lc <- npregbw(Y~X,data=changepoint.data)
model.lc <- npreg(bw.lc)

## Anisotropic local constant model with one resmooth iteration
model.alc <- alc(changepoint.data$X,changepoint.data$Y)

## Plot isotropic and anistropic smoothers
plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",
     pch=1,col="grey",las=1)
lines(changepoint.data$X,model.lc$mean,col="blue",lty=1)
lines(changepoint.data$X,model.alc$mean,col="red",lty=1)

## 2D Simulated image change-point data
## This simulation and estimation can take up to 5 minutes
library(reshape2)
changepoint.data <- changepoint.sim2D(data.dim=c(50,50))
image(changepoint.data)

## Melt the 2D image data for model estimation
changepoint.data.melt <- melt(id.var=1:nrow(changepoint.data), changepoint.data)

## Isotropic local constant model
bw.lc <- npregbw(xdat=changepoint.data.melt[,1:2],ydat=changepoint.data.melt[,3])
model.lc <- npreg(bw.lc)

image(1:dim(changepoint.data)[1], 1:dim(changepoint.data)[2],
      matrix(model.lc$mean, nrow=dim(changepoint.data)[1], byrow=FALSE))

## Anisotropic local constant model with one resmooth iteration and
## and fixed range kernel bandwidth
model.alc <- alc(changepoint.data.melt[,1:2],changepoint.data.melt[,3],bw.fixed.value=10)

image(1:dim(changepoint.data)[1], 1:dim(changepoint.data)[2],
      matrix(model.alc$mean, nrow=dim(changepoint.data)[1], byrow=FALSE))

## 2D real fire spread change-point data
  data("fireData")
  changepoint.data <- fireData[,,1,20]

  ## Plot with pixel locations
  image(1:dim(changepoint.data)[1], 1:dim(changepoint.data)[2],
      matrix(changepoint.data, nrow=dim(changepoint.data)[1], byrow=FALSE))

  ## Melt the 2D image data for model estimation
  changepoint.data.melt <- melt(id.var=1:nrow(changepoint.data), changepoint.data)

  ## Isotropic local constant model
  bw.lc <- npregbw(xdat=changepoint.data.melt[,1:2],ydat=changepoint.data.melt[,3])
  model.lc <- npreg(bw.lc)

  image(1:dim(changepoint.data)[1], 1:dim(changepoint.data)[2],
      matrix(model.lc$mean, nrow=dim(changepoint.data)[1], byrow=FALSE))

  ## Anisotropic local constant model with one resmooth iteration and
  ## and fixed range kernel bandwidth
  model.alc <- alc(changepoint.data.melt[,1:2],changepoint.data.melt[,3],bw.fixed.value=10)

  image(1:dim(changepoint.data)[1], 1:dim(changepoint.data)[2],
      matrix(model.alc$mean, nrow=dim(changepoint.data)[1], byrow=FALSE))
  }
options(np.messages=TRUE)
}

\keyword{nonparametric}
