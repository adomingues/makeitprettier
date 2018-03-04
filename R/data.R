#' Read counts for a typical experiment.
#'
#' An example dataset for a typical IP experiment looking at piRNAs
#'
#' @format A data frame with 324 rows and 8 variables:
#' \describe{
#'   \item{Genotype}{Genotype of interest}
#'   \item{Replicate}{Experimental replicate}
#'   \item{IP}{Antibody used to perform the pull-down}
#'   \item{readlength}{The length of reads, piRNAs, in the samples}
#'   \item{Mapping}{Strandedness of the read. Does it map sens or antisense to a gene}
#'   \item{N}{Number of reads}
#'   \item{libSize}{libSize, total number of mapped reads}
#'   \item{RPM}{RPM, normalized read counts}
#' }
#' 
#' @source Sampled from an actual experimental dataset @KettingLab
"readcounts"