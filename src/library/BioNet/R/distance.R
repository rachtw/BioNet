bionet.distance <- function(net){
  distance <- .jcall(net,"[[I","getDistanceMatrix")
  return(sapply(distance,.jevalArray))
}

#the mean geodesic (i.e., shortest) distance between vertex pairs in a network:
bionet.mean.shortest.distance <- function(net,distance=NULL) {
  if (is.null(distance)) {
    distance<-bionet.distance(net)
  }
  n<-nrow(distance)
  num.unreachable.pairs<-sum(distance==-1)/2
  return((sum(distance)/2-num.unreachable.pairs*(-1)) / (n*(n+1)/2 - num.unreachable.pairs))
}

#the "harmonic mean" geodesic (i.e., shortest) distance between vertex pairs in a network:
bionet.harmonic.mean.shortest.distance <- function(net,distance=NULL) {
  if (is.null(distance)) {
    distance<-bionet.distance(net)
  }
  n<-nrow(distance)
  distance.list<-as.vector(distance)
  #infinite & 0 distances are taken off
  distance.list[distance.list==-1]=NA
  distance.list[distance.list==0]=NA
  return(sum(1/distance.list,na.rm=TRUE) / (n * (n+1) / 2))
}

#eccentricity
bionet.eccentricity <- function(net,distance=NULL) {
  if (is.null(distance)) {
    distance<-bionet.distance(net)
  }
  return(apply(distance,1,max))
}

#diameter
bionet.diameter <- function(net,eccentricity=NULL) {
  if (is.null(eccentricity)) {
    eccentricity<-bionet.eccentricity(net)
  }
  return(max(eccentricity))
}

#radius
bionet.radius <- function(net,eccentricity=NULL) {
  if (is.null(eccentricity)) {
    eccentricity<-bionet.eccentricity(net)
  }
  return(min(eccentricity))
}

#graph.centrality
bionet.graph.centrality <- function(net,eccentricity=NULL) {
  if (is.null(eccentricity)) {
    eccentricity<-bionet.eccentricity(net)
  }
  graph.centrality=1/eccentricity
  graph.centrality[is.na(graph.centrality)]=0
  return(graph.centrality)
}

#radiality
bionet.radiality <- function(net,distance=NULL) {
  if (is.null(distance)) {
    distance<-bionet.distance(net)
  }
  max.distance<-max(distance)
  n<-nrow(distance)
  num.unreachable.nodes<-rowSums(distance==-1)
  return( (n-num.unreachable.nodes)*(max.distance+1)/(n-1)/max.distance
  	-(rowSums(distance)+num.unreachable.nodes)/(n-1)/max.distance )
}

#closeness
bionet.closeness <- function(net,distance=NULL) {
  if (is.null(distance)) {
    distance<-bionet.distance(net)
  }
  return(1/(rowSums(distance)+rowSums(distance==-1)))
}

