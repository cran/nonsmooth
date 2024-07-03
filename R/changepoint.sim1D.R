changepoint.sim1D <- function(n,sigma=1,data.type = "continuousWithJump"){
  if (data.type=="uniformJump"){# 3 uniforms
    X <- c(seq(0,1,3/n),seq(1+3/n,2,3/n),seq(2+3/n,3,3/(n-1)))
    oracle <- c(rep(1,length(seq(0,1,3/n))),rep(7,length(seq(1+3/n,2,3/n))),rep(3,length(seq(2+3/n,3,3/n))))
    Y <- oracle+rnorm(length(oracle),sd=sigma)
  } else if (data.type=="continuous") { #continuous function
    X <- seq(1,3,length.out = n)
    oracle <- 50*((X/3)^2-(X/3)^3)
    Y <- oracle+rnorm(n,sd = sigma)
  } else if (data.type=="continuousWithJump"){
    X <- seq(0,3,length.out = n)
    X.1 <- X[1:round(length(X)/2)]
    X.2 <- X[(round(length(X)/2)+1):length(X)]
    oracle <- c(50*((X.1/3)^2-(X.1/3)^3),50*((X.2/3)^2-(X.2/3)^3)+5)
    Y <- oracle+rnorm(n,sd = sigma)
  } else if (data.type=="gradualJump"){
    X <- c(seq(0,1,3/n),seq(1+3/n,2,3/n),seq(2+3/n,3,3/(n-1)))
    oracle <- c(rep(1,length(seq(0,1,3/n))),seq(1,5,4/(length(seq(1+3/n,2,3/n))-1)),rep(5,length(seq(2+3/n,3,3/n))))
    Y <- oracle+rnorm(length(oracle),sd = sigma)
  }
  return(data.frame(X=X,Y=Y,oracle=oracle))
}
