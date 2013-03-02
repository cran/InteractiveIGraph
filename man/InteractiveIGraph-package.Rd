\name{InteractiveIGraph-package}

\alias{InteractiveIGraph-package}

\docType{package}
\title{
Interactive igraph
}
\description{
This package is an extension of the package \code{\link{igraph}}. 
It allows to work with graph interactively similarly as with function \code{\link{tkplot}},
but it has advantage of much greater flexibility (with the cost of simplicity).

Please see \code{doc/Illustrations.pdf} for short graphical illustration of this package. 

The main function in this package is \code{\link{InteractiveIGraph}} - in fact, all package is all about this function. 

}
\details{
\tabular{ll}{
Package: \tab InteractiveIGraph\cr
Type: \tab Package\cr
Version: \tab 1.0.6.1\cr
Date: \tab 2013-03-02\cr
Author: \tab Vygantas Butkus \cr
Maintainer:  \tab Vygantas Butkus <Vygantas.Butkus@gmail.com> \cr
Institution: \tab the Bank of Lithuania \cr
Depends: \tab igraph, grDevices \cr
License: \tab GPL-2\cr
}

This package is based on \code{\link{igraph}}, \code{\link{grDevices}} packages, 
therefore it has their advantages and disadvantages.

First of all, \code{\link{InteractiveIGraph}} works only on \code{Windows} 
and \code{X11(type = "Xlib")} screen devices,
therefore if working with RStudio you should activate one of the devices.
Secondly, with the large graphs, reploting becomes really annoying, 
so, it is really for small graphs. 
On the other hand customising large graphs in console might by even more annoying.

This package has several huge advantages comparing with \code{\link{tkplot}}. Firstly, it is much more flexible.
You can change any attributes or vertexes or edges. Moreover, you may easily create any extra functionality 
in menu commands.
On the other hand, it is not so much intuitive and stable. In the case of wrong entrees it may crash. 

}

\note{

This project is not fully completed, but unfortunately it is not in active development any more.
Up till now it fulfills all my needs. In the case of new ideas I might join further development. 

}

\author{
Author and maintainer: Vygantas Butkus <Vygantas.Butkus@gmail.com>.
}

\section{Warning}{
The system is tested only in Windows (sorry for that).
}

\seealso{
The main function is \code{\link{InteractiveIGraph}}. 
}

\examples{


# this is a regular igraph object
gOrg <- erdos.renyi.game(15, 1/10,  directed = TRUE)
plot(gOrg) 

# this is an 'InteractiveIGraph' object, up till now there is not much difference. 
# Just some extra attributes.
g = InteractiveIGraph.Constructor(gOrg)
g = plot(g) 

# now it is interactive. Please enjoy :)
if(interactive()){
  g = InteractiveIGraph(gOrg)
}
# p.s. if you want to save changes please press 'q' while ruining InteractiveIGraph().

# Select some vertices and apply commands, for example 'a', 'A', or 'g', 'b'.
# you may change any attributes by key 'ctrl-F' and then typing attributes command,
# for example 'color="green"'
# (it will work only on selected vertices).

# you may run any command by key 'ctrl-C' and typing command, for example 'print(V(g)$name)'

# with key 's' you can change selection mode - in this way you can select multiple vertices. 

}
