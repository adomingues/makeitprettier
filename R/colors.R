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

tab20b <- c("#393b79", "#5254a3", "#6b6ecf", "#9c9ede", "#637939", "#8ca252", "#b5cf6b", "#cedb9c", "#8c6d31", "#bd9e39", "#e7ba52", "#e7cb94", "#843c39", "#ad494a", "#d6616b", "#e7969c", "#7b4173", "#a55194", "#ce6dbd", "#de9ed6")
tab20c <- c("#3182bd", "#6baed6", "#9ecae1", "#c6dbef", "#e6550d", "#fd8d3c", "#fdae6b", "#fdd0a2", "#31a354", "#74c476", "#a1d99b", "#c7e9c0", "#756bb1", "#9e9ac8", "#bcbddc", "#dadaeb", "#636363", "#969696", "#bdbdbd", "#d9d9d9")


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
