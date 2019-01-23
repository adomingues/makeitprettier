#' Saves data underlying a ggplot
#'
#' Helper function that saves the data used to create a gglot.
#' This should help reproducing plots.
#'
#' @param filename Base file name/path
#' @param plot = last_plot() The ggplot for which the data will be saved
#'
#' @export
#' @return a file is saved
save_data <- function(filename, plot = last_plot()) {
   dat <- plot$data
   write.table(
      dat,
      file = filename,
      quote = FALSE,
      sep = "\t",
      row.names = FALSE
   )
}

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
#' @param save_data whether to save the data underlying the plot. The filename will be a composite of _filename_ and ".data.txt"
#' @param ... Additional ggsave arguments
#'
#' @export
#' @return Files are saved
save_plot <- function(filename, plot = last_plot(), width=15, height=15, units = "cm", save_data = FALSE, ...) {
  # Export plot in PDF and PNG
  ggsave(paste(filename, ".pdf", sep = ""), plot, width = width, height = height, ...)
  ggsave(paste(filename, ".png", sep = ""), plot, width = width, height = height, ...)

  if (save_data == TRUE){
   data_file <- paste0(filename, ".data.tsv")
   save_data(data_file)
  }
}


