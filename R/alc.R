alc <- function(X,Y,bw.fixed.value=NULL,resmooths=1,...){
  ## Fit data using local constant kernel estimator (LC)
  bw.lc <- npregbw(xdat=X,ydat=Y,...)
  model.lc <- npreg(bw.lc)
  model.alc <- model.lc #set this temporarily

  ## Use LC \widehat{g}(x) as pilot g(x) in ALC for the first time,
  ## and then ALC for each repeat
  for (i in 1:resmooths){
    X.alc <- data.frame(X,gx=model.alc$mean)
    ## Refit data using the local constant estimator as an input
    if (!is.null(bw.fixed.value)){
      bw.llc <- npregbw(xdat=X.alc,ydat=Y,bandwidth.compute=FALSE,
                        bws=c(bw.lc$bw[1:(dim(X)[2])],bw.fixed.value),...)
    } else {
      bw.llc <- npregbw(xdat=X.alc,ydat=Y,...)
    }
    model.alc <- npreg(bw.llc)
  }
  return(model.alc)
}

