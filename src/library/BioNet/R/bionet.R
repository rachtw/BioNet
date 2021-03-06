bionet.init <- function(path) {
  library(rJava)
  .jinit(classpath=paste(path,"/Network.jar"),parameters="-client -Xmx512M -Xms512M")    
}
bionet.open <- function(path) {
return(.jnew("Network",path))
}
bionet.save <- function(net,path="./mynetwork.sif") {
.jcall(net,"V","writeNetworkInSIF",path)
}
bionet.new.random <- function(n=500,p=0.01) {
return(.jnew("Network",as.integer(n),p))
}
bionet.get.vertices <- function(net) {
return(.jcall(net,"[Ljava/lang/String;","getVertices"))
}
bionet.get.num.vertices <- function(net) {
return(.jcall(net,"I","getNumVertices"))
}
bionet.get.num.edges <- function(net) {
return(.jcall(net,"I","getNumEdges"))
}
bionet.get.vertex.by.index <- function(net,index) {
return(.jcall(net,"Ljava/lang/String;","getNodeName",as.integer(index-1)))
}
bionet.get.vertices.by.indices <- function(net,indices) {
return(.jcall(net,"[Ljava/lang/String;","getNodeName",.jarray(as.integer(indices-1))))
}
bionet.get.neighbors.by.distance.index <- function(net,vertex.no,distance=1) {
return(.jcall(net,"[Ljava/lang/String;","getNeighborsWithDistance",as.integer(vertex.no-1),as.integer(distance)))
}
bionet.get.neighbors.by.distance.name <- function(net,vertex.name,distance=1) {
return(.jcall(net,"[Ljava/lang/String;","getNeighborsWithDistance",as.character(vertex.name),as.integer(distance)))
}
bionet.get.vertices.by.degree <- function(net,degree) {
return(.jcall(net,"[Ljava/lang/String;","getNodesWithDegree",as.integer(degree)))
}
bionet.adjacency.matrix <- function(net) {
a<-.jcall(net,"[[I","getAdjacencyMatrix")
return(sapply(a,.jevalArray))
}
.First.lib <- function(lib, pkg)
{
    require(rJava)
    library(rJava)
    .jinit(classpath=paste(system.file(package="BioNet"),"/Network.jar",sep=""),parameters="-client -Xmx512M -Xms512M")    
}