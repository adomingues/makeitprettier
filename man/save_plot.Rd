% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/export_plot.R
\name{save_plot}
\alias{save_plot}
\title{Saves plots}
\usage{
save_plot(filename, plot = last_plot(), width = 15, height = 15,
  units = "cm", save_data = FALSE, ...)
}
\arguments{
\item{filename}{Base file name/path}

\item{plot}{The gggplot2 object to be saved}

\item{width}{width of the save image. Default: 15 cm}

\item{height}{height of the save image. Default: 15 cm}

\item{save_data}{whether to save the data underlying the plot. The filename will be a composite of _filename_ and ".data.txt"}

\item{...}{Additional ggsave arguments}
}
\value{
Files are saved
}
\description{
Helper function that saves (gg)plots as PNG and PDF simultaneously
The default size should save plots large enough for a poster
Modified from: https://gist.github.com/sheymann/2399659
}
