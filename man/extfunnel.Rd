\name{extfunnel}
\alias{extfunnel}
\title{Additional Funnel Plot Augmentations}
\description{This is a package containing the function extfunnel() which produces 
	a funnel plot including additional augmentations such as the statistical significance 
	contours and the heterogeneity contours.}
\usage{extfunnel(SS, seSS, method, 
	sig.level=0.05, contour=FALSE, isquared=NULL, tausquared=NULL, contour.points=200, summ=FALSE,
	summ.pos=0, pred.interval=FALSE, plot.zero=FALSE, plot.summ=FALSE, ylim=NULL, xlim=NULL, legend=TRUE,
	expxticks=NULL, xticks=NULL, yticks=NULL, zero=0, xlab=NULL, ylab=NULL, 
	legendpos=c(xlim[2]+0.05*(xlim[2]-xlim[1]),ylim[2]), xpoints=NULL, ypoints=NULL, points=TRUE)}
\arguments{
  \item{SS}{effect estimates of the current studies.  \code{SS} is assumed to be normally distributed. Odds ratios , for example, 
	should be log-transformed}
  \item{seSS}{standard errors of the current studies}
  \item{method}{Choice of inverse variance method, "fixed" or "random"}
  \item{sig.level}{significance level}
  \item{contour}{If TRUE, displays the statistical significance contours}
  \item{isquared}{Values that define the i-squared contours.  Must be a vector of maximum length 4 and should be in the range 0-100.
	To compute an i-squared contour based on the current i-squared, set one element of the vector to -1.)}
  \item{tausquared}{Values that define the tau-squared contours.  Must be a vector of maximum length 4 and should be in the range 0-Inf.
	To compute a tau-squared contour based on the current tau-squared, set one element of the vector to -1.}
  \item{contour.points}{Number of points for additional features. A greater number means a smoother contour but takes longer to compute}
  \item{summ}{Plots a summary diamond including pooled effect and confidence interval (significance level as defined by \code{sig.level})}
  \item{summ.pos}{Vertical position of the summary diamond \code{summ}}
  \item{pred.interval}{Displays a predicitve interval along with the summary diamond \code{summ} 
	(significance level as defined by \code{sig.level})}
  \item{plot.zero}{If TRUE, plots the a vertical line which represents the null effect (defined by \code{zero}}
  \item{plot.summ}{If TRUE, plots the a vertical line which represents the current pooled estimate}
  \item{ylim}{Limits of the y-axis, in the form c(y1,y2)}
  \item{xlim}{Limits of the x-axis, in the form c(x1,x2)}
  \item{legend}{If TRUE, displays a key/legend}
  \item{expxticks}{Custom ticks for the x-axis on an exponential scale}
  \item{xticks}{Custom ticks for the x-axis}
  \item{yticks}{Custom ticks for the y-axis}
  \item{zero}{Value for the null effect}
  \item{xlab}{Label for the x-axis}
  \item{ylab}{Label for the y-axis}
  \item{legendpos}{Position of the legend (where \code{legend}=TRUE) defined at the upper left hand corner on the x/y axis scale}
  \item{xpoints}{Add extra point(s) in the plot just to show as an example - Values along the x-axis}
  \item{ypoints}{Add extra point(s) in the plot just to show as an example - Values along the y-axis}
  \item{points}{If TRUE, displays the scatter of studies}
}
\details{
Note that this function becomes computationally intense if method="random" and contour=TRUE.  
Initally, choosing as small number of contour points (i.e. contour.points=50)  is recommended which produces a 'rough'
graph for exploratory purposes.

The R-package \code{rmeta} must be installed and loaded before \code{extfunnel} will work.
}

\author{
Dean Langan
}

\examples{
####Example 1: statistical significance contours

#common estimates of each study (difference in the epworth score)
SS<-c(0.0, 4, -0.4, 0.9)

#corresponding standard errors of each study
seSS<-c(0.566, 1.158, 0.939, 1.332)

#plots funnel plot including statistical significance contours and summary diamond
extfunnel(SS, seSS, method="fixed", plot.summ=TRUE, plot.zero=TRUE, zero=0, 
   xlab="Difference in Epworth Score", contour.points=50, contour=TRUE, summ=TRUE, 
   legend=FALSE, ylim=c(1.7,0), xlim=c(-2,5), legendpos=c(5.2,0))

####Example 2: heterogeneity contours

#common estimates of each study (log risk ratios)
SS<-c(-1.94591015, -1.41908418, -2.02595286, -0.92953596, 0.02353050)

#corresponding standard errors of each study
seSS<-c(1.0212038, 1.0883054, 0.7176478, 0.5355764, 0.6730042)

#plots funnel plot including heterogeneity contours with the following I-Squared values:
#6.5%, 15%, 40% and the current I-Squared value (24.8%) 
extfunnel(SS, seSS, method="fixed", plot.summ=TRUE, plot.zero=TRUE, zero=0, 
   xlab="Risk Ratio", contour.points=200, contour=FALSE, summ=FALSE, 
   legend=TRUE, xlim=c(-3,1), expxticks=c(0.05,0.1,0.25,0.5,1,2,4), 
   isquared=c(6.5,15,40,-1), ylim=c(1.4,0))

}
\keyword{Meta-analysis}
\keyword{Funnel}
