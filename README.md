# makeitprettier

The goal of makeitprettier is to create a set of visual schemes to:
1. generate visually consistent plots for the lab
2. make it easier for lab members to tweak plots for presentations, reports and publication.


## Installation

The easiest way is using `devtools` to install straight from github:

```r
# install.packages("devtools")
devtools::install_github("adomingues/makeitprettier")
```


## Example

See the vignette for full examples by running:

```r
browseVignettes("makeitprettier")
```

Very quickly, to add a theme to your plot:

```r
library(makeitprettier)
p1 <- ggplot(readcounts, aes(x = readlength, y = N, color = Mapping)) +
  geom_line() +
  facet_grid(IP ~ Replicate)
p1
p1 + theme_poster()
```

And change the colors with:

```r
p1 + 
    theme_poster() +
    scale_colour_ketting()
```


## Sources

I took inspiration and or used the code from:

[ggthemes](https://github.com/jrnold/ggthemes)
[ggplot_theme_Publication](https://github.com/koundy/ggplot_theme_Publication)