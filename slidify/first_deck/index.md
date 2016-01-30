---
title       : First Deck
subtitle    : First Deck Subtitle
author      : Brian Costa
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Read-And-Delete

1. Edit YAML front matter
2. Write using R Markdown
3. Use an empty line followed by three dashes to separate slides!

--- .class #id 

## Slide 2

Test Slide 2



```
## Warning in summary.lm(fit): essentially perfect fit: summary may be
## unreliable
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##          1          2          3 
## -9.065e-17  1.813e-16 -9.065e-17 
## 
## Coefficients:
##               Estimate Std. Error    t value Pr(>|t|)    
## (Intercept) -3.000e+00  7.954e-16 -3.771e+15   <2e-16 ***
## x            1.000e+00  1.570e-16  6.369e+15   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.22e-16 on 1 degrees of freedom
## Multiple R-squared:      1,	Adjusted R-squared:      1 
## F-statistic: 4.056e+31 on 1 and 1 DF,  p-value: < 2.2e-16
```



