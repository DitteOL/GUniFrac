\name{PermanovaG}
\alias{PermanovaG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Permutational multivariate analysis of variance using multiple distance
matrices
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
In practice, we do not know a priori which type of change happens in 
the microbiome. Each distance measure is most powerful in detecting
only a certain scenario. When multiple distance matrices are available,
separate tests using each distance matrix will lead to loss of power 
due to multiple testing correction. Combing the distance matrices
in a single test will improve power. PermanovaG combines multiple distance
matrices  by taking the maximum of pseudo-F statistics for each distance
matrix. Significance is assessed by permutation.
}
\usage{
PermanovaG(formula, dat = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{formula}{
%%     ~~Describe \code{formula} here~~
Left side of the formula (\code{Y ~ X}) is a three dimensional ARRAY
containing the supplied distance matrices as produced by \code{\link{GUniFrac}}
 function.
}
  \item{dat}{
%%     ~~Describe \code{dat} here~~
DATA.FRAME containing the covariates
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
Parameter passing to \code{adonis} function
}
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
Return a LIST containing:
\item{aov.tab}{DATA.FRAME (columns - F.model, p.value, rows - covariates)}
}

\references{
%% ~put references to the literature/web site here ~
Jun Chen and Hongzhe Li(2012). Associating microbiome composition with 
environmental covariates using generalized UniFrac distances. (Submitted)
}
\author{
%%  ~~who you are~~
Jun Chen <chenjun@mail.med.upenn.edu>
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{Rarefy}}, \code{\link{GUniFrac}}
}
\examples{
data(throat.otu.tab)
data(throat.tree)
data(throat.meta)

groups <- throat.meta$SmokingStatus

# Rarefaction
otu.tab.rff <- Rarefy(throat.otu.tab)$otu.tab.rff

# Calculate the UniFracs
unifracs <- GUniFrac(otu.tab.rff, throat.tree, alpha=c(0, 0.5, 1))$unifracs

#	Combine unweighted and weighted UniFrac for testing
PermanovaG(unifracs[, , c("d_1", "d_UW")] ~ groups)
# Combine d(0), d(0.5), d(1) for testing
PermanovaG(unifracs[, , c("d_0", "d_0.5", "d_1")] ~ groups)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ htest }
\keyword{ distance }
\keyword{ multivariate }
\keyword{ nonparametric }
\keyword{ regression }% __ONLY ONE__ keyword per line
