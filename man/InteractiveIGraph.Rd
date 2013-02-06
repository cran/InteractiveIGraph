\name{InteractiveIGraph}

\alias{InteractiveIGraph}
\alias{InteractiveIGraph.Constructor}
\alias{plot.InteractiveIGraph}
\alias{as.igraph.InteractiveIGraph}


\title{Interactive igraph}

\description{
Interactive \code{igraph} - it creates opportunity to work with \code{\link{igraph}} interactively.
It enables user to analyse graph properties and structure. It is possible to change graph it self or customise it appearance. 

Please see \code{doc/Illustrations.pdf} for short graphical illustration of this function. 
}

\usage{

InteractiveIGraph(g, ...)

InteractiveIGraph.Constructor(g, ...)

\method{plot}{InteractiveIGraph}(x, ...)

\method{as.igraph}{InteractiveIGraph}(x, KeepAttr = NULL, ...)

}

\arguments{
  \item{g, x}{an object of the class \code{\link{InteractiveIGraph}}. }
  \item{KeepAttr}{ by default all special \code{\link{InteractiveIGraph}} attributes are deleted during transformation. 
	User might keep them if required.}
  \item{\dots}{further arguments. See details and examples.}
}
\details{

Before running \code{\link{InteractiveIGraph}} firstly you should create simple \code{\link{igraph}} object.
Later on, you must be sure you are running correct screen device. 
\code{\link{InteractiveIGraph}} works only on \code{\link{window}} 
and \code{\link{X11}(type = "Xlib")} screen devices,
therefore if working with RStudio(or smth.) you should activate one of the correct devices.

After running the function, you can play around by using computer mouse directly on screen device. 
You can grab vertex (or group if them), move it,
change any attributes. You may even create, or delete vertices and edges. 
If you want to save the results, press key <s> - it will \code{\link{dump}} object to text file.
More over you can save the picture by presing <Ctrl-B> or
press <q>, that stands for 'quite' - it will end the interaction program and assign the last value of the object to predefined variable.
See examples.

Keyboard is active if the graphical device is active. 
To apply the command you just need to know a HotKey. While ruining \code{\link{InteractiveIGraph}}
you may press <m> that stands for 'menu' and all the list will be printed in the console.
The list of commands are kept in \code{\link{CommandList}}. 
This list might by modified by user, therefore, 
any functionality might my easily added by creating a HotKey in the \code{\link{CommandList}}.
You can find out almost all the commands by exploring \code{\link{CommandList}} (run function \code{\link{PrintCommandList}}).
For example if you want to see \code{\link{minimum.spanning.tree}} of your graph you should pres button <t> while running 
\code{InteractiveIGraph}. You may see how this is realized with the command \code{CommandList[["t"]]}

There are some special features, that user might found interesting:
\itemize{
	\item active vertices. Vertices may by active / not active. HotKeys: a, A, ctrl-A.
	\item grouping. Vertices might be grouped interactively. HotKey: g, G,  ctrl-G.
	\item blocking. Groups might be 'closed' in blocks,
		Isolating huge amount of Vertices that not actual in the moment. 
		HotKey: b (while any groups is active).	
}

It should be notice that there are several modes, that influence the output of commands.
All modes might by seen in console by pressing <M>.
Main modes are:
\itemize{
	\item select. The \code{select} mode enables select multiple vertices(edges) by multiple clicking. 
		It means, vertices are not unselected after new click.
	\item ActiveObject. If any object is labeled as active (in bottom menu), then special commands might be applied to it. 
		For example \code{delete}, \code{block}.
	\item ViewObject. If it is in object's view mode it is labeled in the 'main' of the graph. 
		Special treatment of the commands might by applied. For example, if it is view mode of group, 
		then selecting vertices and pressing "g" will join or disjoin vertices to group (instead of creating new group.) 
	\item input. Specifies case, then system is waiting for some kind of input, for example command.
	\item AllEdges. By default, if there are more then one vertices selected no edge indexes are shown. 
		This mode forces to shoe active vertex edges.
}
If you are in the mode that you don't want to be, press <Esc> - it will restore default.

In \code{\dots} you may specify many parameters form \code{\link{igraph}}, namely: 
'layout' 'xlim', 'ylim', 'main', 'sub', 'axes', 'xlab', 'ylab' , 'add'.
User may specify the margins this parameter 'mar'.
Any vertex or edge parameters should be add via \code{\link{V}} and \code{\link{E}}.

User may also specify its own \link[=PlotAdjustment.default]{Adjustment Functions}, namely
'PlotAdjustment', 'BottomMenuAdjustment', 'ExtraInfo'.

And there is special attribute 'MainMenu' - this allows to create any menu that show by pressing right mouse button.

By default a very simple Menu is created. Menu is a list with special structure you can explore it with
\code{graph$Menu$MenuList$MainMenu}. Unfortunately, this part is in developing stage - 
it is now OK to make it work, but not to be user-friendly. 

}
\value{
An object of the class \code{\link{InteractiveIGraph}}. It is the extension 
of the \code{\link{igraph}} with special attributes.
}

\author{
Vygantas Butkus
}
\note{

This package is based on \code{\link{igraph}}, \code{\link{grDevices}} packages, 
therefore it has there advantages and disadvantages.

First of all, \code{InteractiveIGraph} works only on \code{Windows} 
and \code{X11(type = "Xlib")} screen devices,
therefore if working with RStudio yous should activate one of the devices.
Secondly, with the large graphs, reploting becomes really annoying, 
so, it is really for small graphs. 
On the other hand customising large graphs in console might my even more annoying.

}

\section{Warning }{
The function is tested only in windows (sorry for that).

Sometimes the program crashes. Most often it crashes while assigning wrong attributes values. For example
if trying to assign color attribute with command \code{'color="gree"'} instead of \code{'color="green"'} it will crash, because 
there are no color "gree". It is very hard to make system flexible and safe - wherefore be sure assigning correct values.
It should me mentioned that in very rare moments the reasons of crashing are not identified, thence it is recommended from time to time to press
'ctrl-S' - it will \code{\link{dump}} current graph to text file - thus you work wont be lost.
}

\seealso{
\code{\link{CommandList}}, \link[=PlotAdjustment.default]{Adjustment Functions}.

}
\examples{

# this is a regular igraph object
gOrg <- erdos.renyi.game(15, 1/10,  directed = TRUE)
plot(gOrg) 

# this is an 'InteractiveIGraph' object, up till now there is not much difference. Just some extra attributes.
g = InteractiveIGraph.Constructor(gOrg)
g = plot(g) 

# now it is interactive. Please enjoy :)
if(interactive()){
  g = InteractiveIGraph(gOrg)
}
# p.s. if you want to save changes please press 'q' while ruining InteractiveIGraph().

# Select some vertices and apply commands, for example 'a', 'A', or 'g', 'b'.
# you may change any attributes by key 'ctrl-F' and then typing attributes command, for example 'color="green"'
# (it will work only on selected vertices).

# you may run any command by key 'ctrl-C' and typing command, for example 'print(V(g)$name)'

# with key 's' you can change selection mode - in this way you can select multiple vertices. 

}

