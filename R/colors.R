pretty_colors <- c(
  `blue` = "#386cb0",
  `orange` = "#fdb462",
  `green` = "#7fc97f",
  `red` = "#ef3b2c",
  `brown` = "#662506",
  `light blue` = "#a6cee3",
  `salmon` = "#fb9a99",
  `purple` = "#984ea3",
  `yellow` = "#ffff33"
)

#' Function to extract pretty colors as hex codes
#'
#' source:
#' https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2
#'
#' @param ... Character names of pretty_colors
#'
#' @export
prettier_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols)) {
    return(pretty_colors)
  }

  pretty_colors[cols]
}


prettier_palettes <- list(
  `main` = prettier_cols(),
  `cool` = prettier_cols("blue", "green"),
  `hot` = prettier_cols("yellow", "orange", "red"),
  `mixed` = prettier_cols("blue", "green", "yellow", "orange", "red")
)


#' Return function to interpolate a prettier color palette
#'
#' @param palette Character name of palette in prettier_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
prettier_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- prettier_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}


#' Color scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_drsimonj <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- prettier_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("drsimonj_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


#' Fill scale constructor for drsimonj colors
#'
#' @param palette Character name of palette in drsimonj_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_drsimonj <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- prettier_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("drsimonj_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}



#' Color scale constructor for prettier colors
#'
#' @param palette Character name of palette in prettier_palettes
#' @param ... Unused for now
#'
#' @export
scale_color_prettier <- function(palette = "main", ...) {
  pal <- prettier_palettes[[palette]]

  discrete_scale("colour", paste0("prettier_", palette), manual_pal(values = unname(pal)), ...)
}


#' Fill scale constructor for prettier colors
#'
#' @param palette Character name of palette in prettier_palettes
#' @param ... Unused for now
#'
#' @export
scale_fill_prettier <- function(palette = "main", ...) {
  pal <- prettier_palettes[[palette]]

  discrete_scale("fill", paste0("prettier_", palette), manual_pal(values = unname(pal)), na.value = "black", ...)
}
