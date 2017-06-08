# histogram with bins of exponentially increasing sizes
bionet.hist.with.exp.bins <- function(data, main="") {
  m<-max(data)
  b<-c(1)
  i<-0
  while (1) {
  	if ( (j<-b[length(b)]+2^i) > m )
  		break
  	b<-c(b,j)
        i<-i+1
  }
  b<-c(b,m)
  b<-c(0,b)
  hist(data,br=b,main=main)
}

# double logarithmic cumulative distribution
bionet.double.log.ecdf.plot <- function(data, name="data", main="") {
  m<-max(data)
  cdata <- numeric(m)
  n <- length(data)
  for (i in 1:m) {
  	cdata[i] <- sum(table(data)[as.character(1:(m-i+1))],na.rm=TRUE) / n
  }
  if (main!="") main=paste(" of ",main)
  plot(log(1:max(data)),log(cdata),type="l",xlab=paste("log(",name,")"),ylab="log(p)",main=c("Doublely logarithmic cumulative distribution",main))
}

# nodes with top measures
bionet.nodes.of.top.measures <- function(net,measures,percent=0.1) {
  return( bionet.get.vertices.by.indices(net,c(1:length(measures))[measures>=(1-percent)*max(measures)]) )
}
