bionet.degree <- function(net,adjacency.matrix=NULL) {
if (is.null(adjacency.matrix)) {
  adjacency.matrix<-bionet.adjacency.matrix(net)
}
return(rowSums(adjacency.matrix))
}

# power-law distribution
bionet.generate.power.law.distributed.degrees <- function(max.degree=50,alpha=3) {
return((1:max.degree)^(-(alpha-1)))
}

# exponential
bionet.generate.exponential.distributed.degrees <- function(max.degree=50,kappa=3) {
return(exp(-(1:max.degree)/kappa))
}
