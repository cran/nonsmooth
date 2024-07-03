\name{changepoint.sim1D}
\alias{changepoint.sim1D}

\title{
Simulated change-point data for one-dimension
}

\description{
This function simulates one-dimension change-point data for three data types,
and one smooth data type for testing change-point regression estimators.
}

\usage{
changepoint.sim1D(n,sigma=1,data.type = "continuousWithJump")
}

\arguments{
  \item{n}{Integer value for sample size.}
  \item{sigma}{Numeric value of standard deviation.}
  \item{data.type}{Character value for different data types. The options for
  change-point data are: constant functions seperated by two jumps
  (\code{"uniformJump"}), linear functions seperated by two change-points in
  the first derivative (\code{"gradualJump"}), and nonlinear data with a jump
  (\code{"continuousWithJump"}). A smooth continuous function with no
  change-points (\code{"continuous"}) is the same functions as
  \code{"continuousWithJump"} but without the change-point. See Thompson,
  J.R.J. (2024) for more details on these data types.}
}

\value{This function produces a data.frame, consisting of the simulated data
and the data generating process.

\item{X}{Numeric vector of explanatory data}
\item{Y}{Numeric vector of response data}
\item{oracle}{Numeric vector of the data generating process for \code{Y}}
}

\references{

    Thompson, J.R.J. (2024) \dQuote{Iterative Smoothing for Change-point Regression Function Estimation}, \emph{Journal of Applied Statistics}, 1-25. <doi:10.1080/02664763.2024.2352759>

}

\examples{
## 1D continuous data of nonlinear functions with a jump change-point
changepoint.data <- changepoint.sim1D(100)
plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",pch=1,col="grey",las=1)
lines(changepoint.data$X,changepoint.data$oracle,col="red",lty=1)

## 1D continuous data of constant functions with two jump change-points
changepoint.data <- changepoint.sim1D(100,data.type="uniformJump")
plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",pch=1,col="grey",las=1)
lines(changepoint.data$X,changepoint.data$oracle,col="red",lty=1)

## 1D continuous data of linear functions with two derivative change-points
changepoint.data <- changepoint.sim1D(100,data.type="gradualJump")
plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",pch=1,col="grey",las=1)
lines(changepoint.data$X,changepoint.data$oracle,col="red",lty=1)

## 1D continuous data of a nonlinear continuous function
changepoint.data <- changepoint.sim1D(100,data.type="continuous")
plot(changepoint.data$X,changepoint.data$Y,xlab = "X",ylab = "Y",pch=1,col="grey",las=1)
lines(changepoint.data$X,changepoint.data$oracle,col="red",lty=1)
}
