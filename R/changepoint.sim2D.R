changepoint.sim2D <-  function(data.dim = c(100,100),sigma = 20,radius=NULL,cbase=80,ctop=130) {
  ## radius is the radius of the circle should be less than both dim(circle.data)/2
  ## circle.data is the dimensions of the blank canvas to draw the circle, should be set to some value different from 80
  ## sigma is the noise term
  circle.data <- matrix(130,data.dim[1],data.dim[2])
  if(is.null(radius)) radius <- data.dim[1]/4 # a default radius if none is specified
  img <- melt(id.var=1:nrow(circle.data), circle.data)
  names(img) <- c("rows","cols","z")

  # Find center of image
  center <- c(trunc(median(1:nrow(circle.data))), trunc(median(1:ncol(circle.data))))

  # Set values inside radius to 80
  img$z[sqrt((img$rows - center[1])^2 + (img$cols - center[2])^2) < radius] = 80

  # Plot image. Colors ordered from lowest (-1) to highest (1) value
  # image(1:nrow(circle.data), 1:ncol(circle.data), matrix(img$z, nrow=nrow(circle.data), byrow=FALSE), col=c("gray80", "green","red"))

  img$z <- img$z + rnorm(length(img$z),sd=sigma) #add noise
  circle.data <- dcast(data = img,formula = rows~cols,fun.aggregate = sum,value.var = "z")[,-1]
  return(as.matrix(circle.data))
}
