\name{AdjustmentFunctions}

\alias{ExtraInfo.default}
\alias{BottomMenuAdjustment.default}
\alias{PlotAdjustment.default}


\title{Adjustment Functions}

\description{
Special functions that control the behaviour of \code{\link{InteractiveIGraph}}.
}

\usage{

PlotAdjustment.default(g)

ExtraInfo.default(type="V", ProgId=0, g=g)

BottomMenuAdjustment.default(g)

}

\arguments{
  \item{g}{ an object of the class \code{\link{InteractiveIGraph}}. }
  \item{type}{the type of active object. Might be "V", "E", "G".}
  \item{ProgId}{The id of the active object.}
}
\details{
The user may create its own functions and replace the default funcions to change the behavor of the \code{\link{InteractiveIGraph}}. See examples.
}
\value{
Adjustment functions must return an object of the class \code{\link{InteractiveIGraph}}.
}


\seealso{
\code{\link{InteractiveIGraph}} 
}
\examples{
gOrg <- erdos.renyi.game(15, 1/10,  directed = TRUE)
V(gOrg)$comment = paste("Some comment about vertex with number:", V(gOrg)) 


ExtraInfo.New <- function(type="V", ProgId=0, g=g){  
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
    
  Item = list(list(label=msg, RegionParams=list(XBufCof = 0, YBufCof=0.2), 
			RecParams=list(lwd = NA, border=NA), TextParams=list(cex=0.8)))
  g <- MenuAddItems(Items=Item,  MenuLine='Info', g=g)  
  
  return(g)
}

if(interactive()){
  g = InteractiveIGraph(gOrg, ExtraInfo=ExtraInfo.New)
}

}

