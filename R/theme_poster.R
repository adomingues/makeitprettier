#' Theme optimized for poster presentations
#'
#' Colors sizes, legends and in particular font sizes have been optimized
#' for posters.
#' When saving, a size of 10 cm will make sure that very little editing is
#' needed in illustrator.
#'
#' @param base_size The font size. Default 16
#' @param base_family The font type. Default "Helvetica"
#'
#' @export
#' @return A gggplot theme function
theme_poster <- function(base_size=16, base_family="Helvetica") {
  (ggthemes::theme_foundation(base_size = base_size, base_family = base_family)
  + theme(
      plot.title = element_text(
        face = "bold",
        size = rel(1.2), hjust = 0.5
      ),
      text = element_text(),
      panel.background = element_rect(colour = NA),
      plot.background = element_rect(colour = NA),
      panel.border = element_rect(colour = NA),
      axis.title = element_text(face = "bold", size = rel(1)),
      axis.title.y = element_text(angle = 90, vjust = 2),
      axis.title.x = element_text(vjust = -0.2),
      axis.text = element_text(),
      axis.line.x = element_line(colour = "black"),
      axis.line.y = element_line(colour = "black"),
      axis.ticks = element_line(),
      panel.grid.major = element_line(colour = "#f0f0f0"),
      panel.grid.minor = element_blank(),
      legend.key = element_rect(colour = NA),
      legend.key.size = unit(0.5, "cm"),
      legend.spacing = unit(0.5, "cm"),
      legend.spacing.y = unit(0.5, "cm"),
      legend.title = element_text(face = "bold"),
      plot.margin = unit(c(10, 5, 5, 5), "mm"),
      strip.background = element_rect(colour = "#f0f0f0", fill = "#f0f0f0"),
      strip.text = element_text(face = "bold")
    ))
}
