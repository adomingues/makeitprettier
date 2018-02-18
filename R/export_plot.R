#' Saves plots
#'
#' Helper function that saves (gg)plots as PNG and PDF simultaneously
#' The default size should save plots large enough for a poster 
#' Modified from: https://gist.github.com/sheymann/2399659
#'
#' @param plot The gggplot2 object to be saved
#' @param filename Base file name/path 
#' @param width width of the save image. Default: 15 cm 
#' @param height height of the save image. Default: 15 cm 
#'
#' @export
#' @return A file is saved

save_poster <- function(plot, filename, width=15, height=15, units = "cm") {
    # Export plot in PDF and PNG
    ggsave(paste(filename, '.pdf', sep=""), plot, width = width, height = height)
    ggsave(paste(filename, '.png', sep=""), plot, width = width, height = height)
}