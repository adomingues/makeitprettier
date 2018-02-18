# makeitprettier

The goal of makeitprettier is to create a set of visual schemes to:
1. generate visually consistent plots for the lab
2. make it easier for lab members to tweak plots for presentations, reports and publication.

## Example

This is a basic example which shows you how to use the functions:

First create a fake dataset:

```r
set.seed(123)
counts <- data.frame(IP = rep(c("ProtA", "ProtB"), 60),
    Tissue = rep(c("Testis", "Brain"), 60),
    Length = rep(c(21:35), 4),
    RPM = c(
        rnorm(30, mean = 100, sd = 20),
        rnorm(30, mean = 50, sd = 10)
        )
    )    

counts$Sample <- paste(counts$Tissue, counts$IP, sep="_")
counts
```


``` r
library(ggplot2)
## basic example code
p_ex <- ggplot(counts, aes(x = Length, y = RPM, color = Sample)) +
    geom_line() + 
    facet_wrap(~ Sample, ncol=1)
p_ex
```

Now we can use the themes by adding the desired function:

```r
library(makeitprettier)
p_ex + theme_poster()
```

The default colors are still on the meh side of life, so let's perk things up:

```r
p_ex + 
    theme_poster() +
    scale_colour_ketting()
```

I took inspiration and or used the code from:
[ggthemes](https://github.com/jrnold/ggthemes)
[ggplot_theme_Publication](https://github.com/koundy/ggplot_theme_Publication)