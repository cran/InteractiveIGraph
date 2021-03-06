\name{MenuAddItems}

\alias{MenuAddItems}


\title{Adjustment Functions}

\description{
An internal function that helps to control bottom menu items.
}

\usage{

MenuAddItems(Items, MenuLine='Info', g=g)

}

\arguments{
  \item{g}{ an object of the class \code{\link{InteractiveIGraph}}. }
  \item{MenuLine}{ the string that correspond to the bottom menu line ("Info", "A", "G", "Log")}
  \item{Items}{The list with menu iltem structure.}
}
\details{
Just add an item to the menu.
}


\seealso{
\code{\link{CommandList}}, \link[=PlotAdjustment.default]{Adjustment Functions}.
}

\examples{
gOrg <- erdos.renyi.game(15, 1/10,  directed = TRUE)
V(gOrg)$comment = paste("Some comment about vertex with number:", V(gOrg)) 


ExtraInfo.New <- function(type="V", ProgId=0, g=g){  # taisytina  
msg = ""
  
  if(type=="V"){  
    vid = which(V(g)$ProgId == ProgId)
    msg = paste(",", V(g)[vid]$comment)
  }
  if(type=="E"){
    msg = ", E..."    
  }
  if(type=="G"){
    msg = ", G..."    
  }
    
  Item = list(list(label=msg, RegionParams=list(XBufCof = 0, YBufCof=0.2), RecParams=list(lwd = NA, border=NA), TextParams=list(cex=0.8)))
  g <- MenuAddItems(Items=Item,  MenuLine='Info', g=g)  
  
  return(g)
}

if(interactive()){
  g = InteractiveIGraph(gOrg, ExtraInfo=ExtraInfo.New)
}

}
\keyword{internal}
