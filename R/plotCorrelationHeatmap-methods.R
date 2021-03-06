#' Plot Correlation Heatmap
#'
#' This function calculates a correlation matrix based on feature expression per
#' sample.
#'
#' @name plotCorrelationHeatmap
#' @family Quality Control Functions
#' @author Michael Steinbaugh
#'
#' @importFrom basejump plotCorrelationHeatmap
#' @export
#'
#' @inherit basejump::plotCorrelationHeatmap
#'
#' @inheritParams general
#' @param ... Passthrough arguments to `SummarizedExperiment` method.
#'
#' @seealso
#' - `help("plotCorrelationHeatmap", "bcbioBase")`.
#' - `findMethod("plotCorrelationHeatmap", "SummarizedExperiment")`.
#'
#' @examples
#' # bcbioRNASeq ====
#' # Pearson correlation
#' plotCorrelationHeatmap(bcb_small, method = "pearson")
#'
#' # Spearman correlation
#' plotCorrelationHeatmap(bcb_small, method = "spearman")
NULL



#' @rdname plotCorrelationHeatmap
#' @export
setMethod(
    "plotCorrelationHeatmap",
    signature("bcbioRNASeq"),
    function(
        object,
        normalized = c("vst", "rlog", "tmm", "tpm", "rle"),
        ...
    ) {
        validObject(object)
        normalized <- match.arg(normalized)
        message(paste("Using", normalized, "counts"))
        counts <- counts(object, normalized = normalized)

        # Coerce to RangedSummarizedExperiment
        rse <- as(object, "RangedSummarizedExperiment")
        assays(rse) <- list(counts = counts)
        validObject(rse)

        plotCorrelationHeatmap(rse, ...)
    }
)



#' @rdname plotCorrelationHeatmap
#' @export
setMethod(
    "plotCorrelationHeatmap",
    signature("DESeqTransform"),
    function(object, ...) {
        validObject(object)
        counts <- assay(object)

        # Coerce to RangedSummarizedExperiment
        rse <- as(object, "RangedSummarizedExperiment")
        assays(rse) <- list(counts = counts)
        validObject(rse)

        plotCorrelationHeatmap(rse, ...)
    }
)
