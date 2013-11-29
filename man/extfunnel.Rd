\name{extfunnel}
\alias{extfunnel}
\title{Additional Funnel Plot Augmentations}
\description{This is a package containing the function \code{extfunnel()} which produces a funnel plot including additional augmentations such as statistical significance contours and heterogeneity contours.}
\usage{extfunnel(SS, seSS, method, 
	  sig.level=0.05, contour=FALSE, isquared=NULL, tausquared=NULL, 
	  contour.points=200, summ=FALSE, summ.pos=0, pred.interval=FALSE, 
	  plot.zero=FALSE, plot.summ=FALSE, ylim=NULL, xlim=NULL, legend=TRUE,
	  expxticks=NULL, xticks=NULL, yticks=NULL, zero=0, xlab=NULL, 
	  ylab=NULL, rand.load=10, legendpos=c(xlim[2]+0.05*(xlim[2]-xlim[1]),ylim[2]), 
	  xpoints=NULL, ypoints=NULL, points=TRUE)}
\arguments{
 
  \item{SS}{Effect estimates of the current studies.  \code{SS} is assumed to be normally distributed meaning odds ratios, for example, 
	should be log-transformed.}
  \item{seSS}{Standard errors of the study effect estimates \code{SS}.}
  \item{method}{Choice of fixed or random effects, \code{method="fixed"} or \code{method="random"}.}
  \item{sig.level}{Significance level in decimal form.}
  \item{contour}{If \code{contour="TRUE"}, displays statistical significance contours.}
  \item{isquared}{Values that define the I-squared contours.  Must be a vector of maximum length 4 and should have elements in the range 0-100.
	To compute an I-squared contour based on the current I-squared, set one element of the vector to -1. The I-squared contours will not be displayed
	if the \code{isquared} argument is not used.}
  \item{tausquared}{Values that define the Tau-squared contours.  Must be a vector of maximum length 4 and should have elements in the range 0-Inf.
	To compute a Tau-squared contour based on the current Tau-squared, set one element of the vector to -1. The Tau-squared contours will not be displayed
	if the \code{tausquared} argument is not used.}
  \item{contour.points}{The smoothing constant for any contour. A greater number means a smoother contour but this takes longer to compute.}
  \item{summ}{If \code{summ="TRUE"}, a summary diamond including pooled effect and confidence interval is included (significance level as defined by \code{sig.level}).}
  \item{summ.pos}{Vertical position of the summary diamond \code{summ}.}
  \item{pred.interval}{Displays a predicitve interval (Higgins J, 2009) along with the summary diamond \code{"summ"} 
	(significance level as defined by \code{"sig.level"}).}
  \item{plot.zero}{If \code{plot.zero="TRUE"}, plots a vertical line which represents the null effect (defined by \code{zero}).}
  \item{plot.summ}{If \code{plot.summ="TRUE"}, plots a vertical line which represents the current pooled estimate.}
  \item{ylim}{Limits of the y-axis, in the form \code{c(y1,y2)}.}
  \item{xlim}{Limits of the x-axis, in the form \code{c(x1,x2)}.}
  \item{legend}{If \code{legend="TRUE"} (default), a key/legend is displayed.}
  \item{expxticks}{A vector of custom ticks for the x-axis on an exponential scale in the form \code{c(x1,x2,...)}. 
	If this argument is used, the input effect estimates \code{SS} are assumed to be log-transformed.}
  \item{xticks}{A vector of custom ticks for the x-axis in the form \code{c(x1,x2,...)}.}
  \item{yticks}{A vector of custom ticks for the y-axis in the form \code{c(y1,y2,...)}.}
  \item{zero}{Value for the null effect.}
  \item{xlab}{Label for the x-axis.}
  \item{ylab}{Label for the y-axis.}
  \item{legendpos}{Position of the legend (where \code{legend="TRUE"}). Defined at the upper left hand corner on the x and y axis scales in the form \code{c(x,y)}.}
  \item{xpoints}{Add extra point(s) in the plot to show as an example - Values along the x-axis.  Must be the same length as \code{ypoints}.}
  \item{ypoints}{Add extra point(s) in the plot to show as an example - Values along the y-axis.  Must be the same length as \code{xpoints}.}
  \item{points}{If \code{points="FALSE"}, the scatter of studies is not displayed.}
  \item{rand.load}{How often to update percentage of computations that are complete. Only when \code{method="random"}.}

}
\details{
Note that this function becomes computationally intense if \code{method="random"} and \code{contour="TRUE"}.  
Choosing as small number of contour points (i.e. \code{contour.points=50})  is recommended which produces a 'rough'graph for exploratory purposes before producing a final graph.  In this case, \code{contour.points=500} is recommended for producing smoothed/detailed graphs.


The R-package \code{rmeta} must be installed and loaded before \code{extfunnel} will work.

}

\author{
Dean Langan, Julian PT Higgins, Walter gregory, Alexander Sutton.
}

\examples{

#load package once installed
library(extfunnel)

####Example 1: statistical significance contours

#common effect estimate of each study (difference in the epworth score)
SS<-c(0, 4, -0.4, 0.9)

#corresponding standard errors of each study effect estimate (SS)
seSS<-c(0.566, 1.158, 0.939, 1.332)

#plots a funnel plot including statistical significance contours (contour=TRUE) 
#and summary diamond (summ=TRUE)
extfunnel(SS, seSS, method="fixed", plot.summ=TRUE, plot.zero=TRUE, zero=0, 
   xlab="Difference in Epworth Score", contour.points=50, contour=TRUE, 
   summ=TRUE, legend=FALSE, ylim=c(1.7,0), xlim=c(-2,5), legendpos=c(5.2,0))

####Example 2: heterogeneity contours

#common effect estimate of each study (log risk ratios)
#Note: risk ratios should be log-transofrmed before input in the extfunnel() function
SS<-c(-1.95, -1.42, -2.03, -0.93, 0.024)

#corresponding standard errors of each study effect estimate (SS)
seSS<-c(1.021, 1.088, 0.718, 0.536, 0.673)

#plots a funnel plot including heterogeneity contours with the following 
#I-Squared values:  6.5%, 15%, 40% and the current I-Squared value of 24.8%
extfunnel(SS, seSS, method="fixed", plot.summ=TRUE, plot.zero=TRUE, zero=0, 
   xlab="Risk Ratio", contour.points=200, contour=FALSE, summ=FALSE, 
   legend=TRUE, xlim=c(-3,1), expxticks=c(0.05,0.1,0.25,0.5,1,2,4), 
   isquared=c(6.5,15,40,-1), ylim=c(1.4,0))

}

\references{

Higgins J, Thompson S, Spiegelhalter D.  A re-evaluation of random-effects meta-analysis. J R Stat Soc Ser A Stat Soc Jan 2009; 172:137-159

}

\keyword{Meta-analysis}
\keyword{Funnel}
\keyword{plot}
\keyword{graph}

