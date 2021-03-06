% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/plotCountsPerGene-methods.R
\docType{methods}
\name{plotCountsPerGene}
\alias{plotCountsPerGene}
\alias{plotCountsPerGene,bcbioRNASeq-method}
\title{Plot Counts Per Gene}
\usage{
plotCountsPerGene(object, ...)

\S4method{plotCountsPerGene}{bcbioRNASeq}(object, interestingGroups,
  normalized = c("tmm", "vst", "rlog", "tpm", "rle"),
  fill = getOption("bcbio.discrete.fill", NULL),
  flip = getOption("bcbio.flip", TRUE), title = "counts per gene")
}
\arguments{
\item{object}{Object.}

\item{...}{Additional arguments.}

\item{interestingGroups}{\code{character}. Groups of interest that define the
samples. If left unset, defaults to \code{sampleName}.}

\item{normalized}{\code{string}. Which normalization method to apply:
\itemize{
\item "\code{tpm}": Transcripts per million (tximport).
\item "\code{tmm}": edgeR trimmed mean of M-values. Calculated on the fly.
\item "\code{rlog}": DESeq2 \strong{log2} regularized log transformation.
\item "\code{vst}": DESeq2 \strong{log2} variance stabilizing transformation.
}}

\item{fill}{\code{ggproto}/\code{ScaleDiscrete} or \code{NULL}. Desired ggplot2 fill scale.
Must supply discrete values. When set to \code{NULL}, the default ggplot2 color
palette will be used. If manual color definitions are desired, we recommend
using \code{\link[ggplot2:scale_fill_manual]{ggplot2::scale_fill_manual()}}.
To set the discrete fill palette globally, use
\code{options(bcbio.discrete.fill = scale_fill_viridis_d())}.}

\item{flip}{\code{boolean}. Flip x and y axes. Recommended for quality control
plots containing many samples.}

\item{title}{\code{string} or \code{NULL}. Plot title.}
}
\value{
\code{ggplot}.
}
\description{
Generally, we expect similar count spreads for all genes between samples
unless the library sizes or total RNA expression are different.
}
\section{TMM}{

We recommend visualizing counts normalized with the Trimmed Mean of M-Values
(TMM) method here (Robinson, et al., 2010). TMM normalization equates the
overall expression levels of genes between samples under the assumption that
the majority of them are not differentially expressed. Therefore, by
normalizing for total RNA expression by sample, we expect the spread of the
TMM-normalized counts per gene to be similar for every sample.
}

\examples{
plotCountsPerGene(bcb_small)
}
\seealso{
Other Quality Control Functions: \code{\link{plot5Prime3PrimeBias}},
  \code{\link{plotCorrelationHeatmap}},
  \code{\link{plotCountDensity}},
  \code{\link{plotDispEsts}},
  \code{\link{plotExonicMappingRate}},
  \code{\link{plotGenderMarkers}},
  \code{\link{plotGeneSaturation}},
  \code{\link{plotGenesDetected}},
  \code{\link{plotIntronicMappingRate}},
  \code{\link{plotMappedReads}},
  \code{\link{plotMappingRate}}, \code{\link{plotMeanSD}},
  \code{\link{plotPCACovariates}}, \code{\link{plotPCA}},
  \code{\link{plotRRNAMappingRate}},
  \code{\link{plotTotalReads}}
}
\author{
Michael Steinbaugh, Rory Kirchner, Victor Barrera
}
\concept{Quality Control Functions}
