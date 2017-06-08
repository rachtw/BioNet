network.analysis<-function(path,n=NULL,p=NULL) {
      old.ask <- par()$ask
      par(ask=TRUE)

	if (is.null(n)) {
		print(c("Read in the file ",path))
		net<-bionet.open(path)
	} else {
		print("Generate a random graph with a specified number of vertices and a specified probability that an edge occurs")
		net<-bionet.new.random(n,p)
	}

	print("Save the network to mynetwork.sif in the current directory")
	bionet.save(net)

	print("A list of vertices in the networks:")
	bionet.get.vertices(net)

	print("The adjacency matrix which represents the topology of the networks")
	a<-bionet.adjacency.matrix(net)

	print("Number of vertices")
	print(bionet.get.num.vertices(net))

	print("Number of edges")
	print(bionet.get.num.edges(net))

	#### Centrality Measures ###

	d<-bionet.degree(net,a)

	print("Max vertex degree")
	print(max(d))

	print("Mean vertex degree")
	print(mean(d))
	
	print("Vertices with top 10% vertex degree")
	n<-bionet.nodes.of.top.measures(net,d)
	print(n)

	print("The vertices within distance 1 of the first vertex")
	print(bionet.get.neighbors.by.distance.name(net,n[1]))

	print("The vertices within distance 2 of the first vertex")
	print(bionet.get.neighbors.by.distance.name(net,n[1],2))

	print("Plotting the distribution of vertex degree")
	bionet.hist.with.exp.bins(d,"vertex degree")
	bionet.double.log.ecdf.plot(d,name="vertex degree","vertex degree")

  	dist<-bionet.distance(net)
  
	print("The mean geodesic (i.e., shortest) distance between vertex pairs")
	print(bionet.mean.shortest.distance(net,dist))
	
	print("The \"harmonic mean\" geodesic distance between vertex pairs")
	print(bionet.harmonic.mean.shortest.distance(net,dist))

	print("Plotting the vertex eccentricity")
	e<-bionet.eccentricity(net)
	hist(e,main="vertex eccentricity")
	
	print("Vertices with top 10% vertex eccentricity")
	t<-bionet.nodes.of.top.measures(net,e)
	print(t)

	print("Network diameter")
	print(bionet.diameter(net,e))

	print("Network radius")
	print(bionet.radius(net,e))

	print("The shortest path between first two nodes")
	print(bionet.get.shortest.path.by.name(net,t[1],t[2]))
	
	print("Plotting the vertex centrality")
	c<-bionet.graph.centrality(net,e)
	hist(c,main="vertex centrality")

	print("Vertices with top 10% vertex centrality")
	print(bionet.nodes.of.top.measures(net,c))

	print("Plotting the vertex radiality")
	r<-bionet.radiality(net,dist)
	hist(r,main="vertex radiality")

	print("Vertices with top 10% vertex radiality")
	print(bionet.nodes.of.top.measures(net,r))

	print("Plotting the vertex closeness")
	cl<-bionet.closeness(net,dist)
	hist(cl,main="vertex closeness")

	print("Vertices with top 10% vertex closeness")
	print(bionet.nodes.of.top.measures(net,cl))

	#### Structural Properties ###

	print("Number of triangles within the networks")
	print(bionet.num.triangles(net,a))

	print("Clustering coefficient of the network")
	print(bionet.clustering.coefficient(net,a))

	print("Watts-Strogatz Clustering coefficient of the network")
	print(bionet.WS.clustering.coefficient(net,a))

	par(ask=old.ask)
}
library(rJava)
.jinit(classpath=paste(system.file(package="BioNet"),"/Network.jar",sep=""),parameters="-client -Xmx512M -Xms512M")    

# A social network
network.analysis("data/Erdos.net.sif")

# Small protein-protein interaction networks
network.analysis("data/galFiltered.sif")

# Large protein-protein interaction networks
network.analysis("data/worm.sif")

# Poisson random graph
network.analysis(n=500,p=0.01)
