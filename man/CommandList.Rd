\name{CommandList}

\alias{PrintCommandList}

\alias{CommandList}

\title{CommandList}

\description{
The list of commands that could be applied during \code{\link{InteractiveIGraph}}.
}

\usage{

PrintCommandList()

CommandList
	
}

\details{
Almost all commands of HotKeys that could be applied in \code{\link{InteractiveIGraph}} are recorded in the \code{CommandList}.
The names of the \code{CommandList} correspond to an key and the elements of
\code{CommandList} contains a list with label, description and the function. 

You can append this list, but be aware of the \code{CommandList} structure and be sure to
 return an object of the class \code{\link{InteractiveIGraph}} at the end of the function.

Please apply \code{PrintCommandList} function to find out possible commands.

There are some special keys that are not in the list.
\itemize{
	\item{<Esc>}{Drop any selection and exit any mode.}
	\item{<ctrl-Z>}{Undo, it will rester your last action.}
	\item{<Enter>}{Enter to view mode if any object is active, or enters command if system is waiting for some input.}
	\item{<ctrl-V>}{Use method paste if system is waiting for some input.}
	\item{<Backspace>}{Applies Backspace if system is waiting for some input.}
}

}
\value{
The list of commands. 
}


\seealso{
\code{\link{InteractiveIGraph}} 
}
\examples{
PrintCommandList()
}

