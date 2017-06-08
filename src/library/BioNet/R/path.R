#get vertex betweennesses
bionet.get.vertex.betweenness <- function(net) {
  return(.jcall(net,"[I","getVertexBetweenness"))
}

#query the shortest paths between a pair of nodes
bionet.get.shortest.path.by.index <- function(net,i,j) {
  return(.jcall(net,"[Ljava/lang/String;","getShortestPath",as.integer(i-1),as.integer(j-1)))
}

bionet.get.shortest.path.by.name <- function(net,i,j) {
  return(.jcall(net,"[Ljava/lang/String;","getShortestPath",as.character(i),as.character(j)))
}
