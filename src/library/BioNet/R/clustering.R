# # of triangles
bionet.num.triangles <- function(net,adjacency.matrix=NULL) {
  if (is.null(adjacency.matrix)) {
    adjacency.matrix<-bionet.adjacency.matrix(net)
  }
  m.3 <- adjacency.matrix %*% adjacency.matrix %*% adjacency.matrix
  
  return(sum(diag(m.3))/6)
}

# Clustering.coefficient
bionet.clustering.coefficient <- function(net,adjacency.matrix=NULL){
  if (is.null(adjacency.matrix)) {
    adjacency.matrix<-bionet.adjacency.matrix(net)
  }
  m.3 <- adjacency.matrix %*% adjacency.matrix %*% adjacency.matrix
  
  distance.list<-as.vector(bionet.distance(net))
  return( sum(diag(m.3))/sum(distance.list==2) )
}

# Watts.Strogatz.clustering.coefficient
bionet.WS.clustering.coefficient <- function(net,adjacency.matrix=NULL) {
  if (is.null(adjacency.matrix)) {
    adjacency.matrix<-bionet.adjacency.matrix(net)
  }
  m.3 <- adjacency.matrix %*% adjacency.matrix %*% adjacency.matrix

  n<-nrow(adjacency.matrix)
  num.triangles <- diag(m.3)/2
  num.neighbors <- rowSums(adjacency.matrix)
  denominator <- choose(num.neighbors,2)
  denominator[denominator==0] <- 1

  return(sum(num.triangles/denominator)/n)
}
