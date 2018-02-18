#' Gives some color to plots
#'
#' A color scheme for plots that is both colorblind-friendly
#' and yet is still aesthetically pleasing
#'
#'
#' @export
#' @return A color scale for ggplot
scale_fill_ketting <- function(...){
      discrete_scale("fill","ketting",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)
      
}

#' Gives some color to plots
#'
#' A color scheme for plots that is both colorblind-friendly
#' and yet is still aesthetically pleasing
#'
#'
#' @export
#' @return A color scale for ggplot
scale_colour_ketting <- function(...){
      discrete_scale("colour","ketting",manual_pal(values = c("#386cb0","#fdb462","#7fc97f","#ef3b2c","#662506","#a6cee3","#fb9a99","#984ea3","#ffff33")), ...)
      
}