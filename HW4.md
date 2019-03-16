---
title: "Homework 4"
author: "Lauren Alimento"
date: "3/16/2019"
output: 
  html_document: 
    keep_md: yes
---



## Practice and Homework
We will work together on the next part (time permitting) and this will end up being your homework. Make sure that you save your work and copy and paste your responses into the RMarkdown homework file.

Aren't mammals fun? Let's load up some more mammal data. This will be life history data for mammals. The [data](http://esapubs.org/archive/ecol/E084/093/) are from: *S. K. Morgan Ernest. 2003. Life history characteristics of placental non-volant mammals. Ecology 84:3402.*  


```r
library("tidyverse")
```

```
## Warning: package 'tidyverse' was built under R version 3.4.2
```

```
## ── Attaching packages ────────────────────────────────── tidyverse 1.2.1 ──
```

```
## ✔ ggplot2 3.1.0       ✔ purrr   0.3.2  
## ✔ tibble  2.0.1       ✔ dplyr   0.8.0.1
## ✔ tidyr   0.8.3       ✔ stringr 1.4.0  
## ✔ readr   1.3.1       ✔ forcats 0.4.0
```

```
## Warning: package 'ggplot2' was built under R version 3.4.4
```

```
## Warning: package 'tibble' was built under R version 3.4.4
```

```
## Warning: package 'tidyr' was built under R version 3.4.4
```

```
## Warning: package 'readr' was built under R version 3.4.4
```

```
## Warning: package 'dplyr' was built under R version 3.4.4
```

```
## Warning: package 'stringr' was built under R version 3.4.4
```

```
## Warning: package 'forcats' was built under R version 3.4.4
```

```
## ── Conflicts ───────────────────────────────────── tidyverse_conflicts() ──
## ✖ dplyr::filter() masks stats::filter()
## ✖ dplyr::lag()    masks stats::lag()
```


```r
life_history <- readr::read_csv("~/Desktop/FRS 417/class_files-master/data/mammal_lifehistories_v2.csv")
```

```
## Parsed with column specification:
## cols(
##   order = col_character(),
##   family = col_character(),
##   Genus = col_character(),
##   species = col_character(),
##   mass = col_double(),
##   gestation = col_double(),
##   newborn = col_double(),
##   weaning = col_double(),
##   `wean mass` = col_double(),
##   AFR = col_double(),
##   `max. life` = col_double(),
##   `litter size` = col_double(),
##   `litters/year` = col_double()
## )
```

```r
?life_history
```

```
## No documentation for 'life_history' in specified packages and libraries:
## you could try '??life_history'
```

Rename some of the variables. Notice that I am replacing the old `life_history` data.

```r
life_history <- 
  life_history %>% 
  dplyr::rename(
          genus        = Genus,
          wean_mass    = `wean mass`,
          max_life     = `max. life`,
          litter_size  = `litter size`,
          litters_yr   = `litters/year`
          )
life_history
```

```
## # A tibble: 1,440 x 13
##    order family genus species   mass gestation newborn weaning wean_mass
##    <chr> <chr>  <chr> <chr>    <dbl>     <dbl>   <dbl>   <dbl>     <dbl>
##  1 Arti… Antil… Anti… americ… 4.54e4      8.13   3246.    3         8900
##  2 Arti… Bovid… Addax nasoma… 1.82e5      9.39   5480     6.5       -999
##  3 Arti… Bovid… Aepy… melamp… 4.15e4      6.35   5093     5.63     15900
##  4 Arti… Bovid… Alce… busela… 1.50e5      7.9   10167.    6.5       -999
##  5 Arti… Bovid… Ammo… clarkei 2.85e4      6.8    -999  -999         -999
##  6 Arti… Bovid… Ammo… lervia  5.55e4      5.08   3810     4         -999
##  7 Arti… Bovid… Anti… marsup… 3.00e4      5.72   3910     4.04      -999
##  8 Arti… Bovid… Anti… cervic… 3.75e4      5.5    3846     2.13      -999
##  9 Arti… Bovid… Bison bison   4.98e5      8.93  20000    10.7     157500
## 10 Arti… Bovid… Bison bonasus 5.00e5      9.14  23000.    6.6       -999
## # … with 1,430 more rows, and 4 more variables: AFR <dbl>, max_life <dbl>,
## #   litter_size <dbl>, litters_yr <dbl>
```

1. Explore the data using the method that you prefer. Below, I am using a new package called `skimr`. If you want to use this, make sure that it is installed.

```r
#install.packages("skimr")
```


```r
library("skimr")
```

```
## Warning: package 'skimr' was built under R version 3.4.4
```

```
## 
## Attaching package: 'skimr'
```

```
## The following object is masked from 'package:stats':
## 
##     filter
```


```r
life_history %>% 
  skimr::skim()
```

```
## Skim summary statistics
##  n obs: 1440 
##  n variables: 13 
## 
## ── Variable type:character ────────────────────────────────────────────────
##  variable missing complete    n min max empty n_unique
##    family       0     1440 1440   6  15     0       96
##     genus       0     1440 1440   3  16     0      618
##     order       0     1440 1440   7  14     0       17
##   species       0     1440 1440   3  17     0     1191
## 
## ── Variable type:numeric ──────────────────────────────────────────────────
##     variable missing complete    n      mean         sd   p0  p25     p50
##          AFR       0     1440 1440   -408.12     504.97 -999 -999    2.5 
##    gestation       0     1440 1440   -287.25     455.36 -999 -999    1.05
##  litter_size       0     1440 1440    -55.63     234.88 -999    1    2.27
##   litters_yr       0     1440 1440   -477.14     500.03 -999 -999    0.38
##         mass       0     1440 1440 383576.72 5055162.92 -999   50  403.02
##     max_life       0     1440 1440   -490.26     615.3  -999 -999 -999   
##      newborn       0     1440 1440   6703.15   90912.52 -999 -999    2.65
##    wean_mass       0     1440 1440  16048.93   5e+05    -999 -999 -999   
##      weaning       0     1440 1440   -427.17     496.71 -999 -999    0.73
##      p75          p100     hist
##    15.61     210       ▆▁▁▁▁▁▇▁
##     4.5       21.46    ▃▁▁▁▁▁▁▇
##     3.83      14.18    ▁▁▁▁▁▁▁▇
##     1.15       7.5     ▇▁▁▁▁▁▁▇
##  7009.17       1.5e+08 ▇▁▁▁▁▁▁▁
##   147.25    1368       ▇▁▁▃▂▁▁▁
##    98    2250000       ▇▁▁▁▁▁▁▁
##    10          1.9e+07 ▇▁▁▁▁▁▁▁
##     2         48       ▆▁▁▁▁▁▁▇
```

2. Run the code below. Are there any NA's in the data? Does this seem likely?

```r
msleep %>% 
  summarize(number_nas= sum(is.na(life_history)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1          0
```
There are no NA's in the data which seems unlikely.

3. Are there any missing data (NA's) represented by different values? How much and where? In which variables do we have the most missing data? Can you think of a reason why so much data are missing in this variable?

```r
life_history_na <- 
  life_history %>% 
  na_if("-999")
life_history_na
```

```
## # A tibble: 1,440 x 13
##    order family genus species   mass gestation newborn weaning wean_mass
##    <chr> <chr>  <chr> <chr>    <dbl>     <dbl>   <dbl>   <dbl>     <dbl>
##  1 Arti… Antil… Anti… americ… 4.54e4      8.13   3246.    3         8900
##  2 Arti… Bovid… Addax nasoma… 1.82e5      9.39   5480     6.5         NA
##  3 Arti… Bovid… Aepy… melamp… 4.15e4      6.35   5093     5.63     15900
##  4 Arti… Bovid… Alce… busela… 1.50e5      7.9   10167.    6.5         NA
##  5 Arti… Bovid… Ammo… clarkei 2.85e4      6.8      NA    NA           NA
##  6 Arti… Bovid… Ammo… lervia  5.55e4      5.08   3810     4           NA
##  7 Arti… Bovid… Anti… marsup… 3.00e4      5.72   3910     4.04        NA
##  8 Arti… Bovid… Anti… cervic… 3.75e4      5.5    3846     2.13        NA
##  9 Arti… Bovid… Bison bison   4.98e5      8.93  20000    10.7     157500
## 10 Arti… Bovid… Bison bonasus 5.00e5      9.14  23000.    6.6         NA
## # … with 1,430 more rows, and 4 more variables: AFR <dbl>, max_life <dbl>,
## #   litter_size <dbl>, litters_yr <dbl>
```
It looks like wean_mass column has the most missing data. I think that this is because it's difficult to find the mass of the weaning mammal.

4. Compared to the `msleep` data, we have better representation among taxa. Produce a summary that shows the number of observations by taxonomic order.

```r
life_history_na %>% 
  group_by(order)
```

```
## # A tibble: 1,440 x 13
## # Groups:   order [17]
##    order family genus species   mass gestation newborn weaning wean_mass
##    <chr> <chr>  <chr> <chr>    <dbl>     <dbl>   <dbl>   <dbl>     <dbl>
##  1 Arti… Antil… Anti… americ… 4.54e4      8.13   3246.    3         8900
##  2 Arti… Bovid… Addax nasoma… 1.82e5      9.39   5480     6.5         NA
##  3 Arti… Bovid… Aepy… melamp… 4.15e4      6.35   5093     5.63     15900
##  4 Arti… Bovid… Alce… busela… 1.50e5      7.9   10167.    6.5         NA
##  5 Arti… Bovid… Ammo… clarkei 2.85e4      6.8      NA    NA           NA
##  6 Arti… Bovid… Ammo… lervia  5.55e4      5.08   3810     4           NA
##  7 Arti… Bovid… Anti… marsup… 3.00e4      5.72   3910     4.04        NA
##  8 Arti… Bovid… Anti… cervic… 3.75e4      5.5    3846     2.13        NA
##  9 Arti… Bovid… Bison bison   4.98e5      8.93  20000    10.7     157500
## 10 Arti… Bovid… Bison bonasus 5.00e5      9.14  23000.    6.6         NA
## # … with 1,430 more rows, and 4 more variables: AFR <dbl>, max_life <dbl>,
## #   litter_size <dbl>, litters_yr <dbl>
```

5. Mammals have a range of life histories, including lifespan. Produce a summary of lifespan in years by order. Be sure to include the minimum, maximum, mean, standard deviation, and total n.

```r
life_history_na %>%
  group_by(order) %>% 
  summarize(min_lifespan=min(max_life),
            max_lifespan=max(max_life),
            mean_lifespan=mean(max_life),
            sd_lifespan=sd(max_life),
            total=n())
```

```
## # A tibble: 17 x 6
##    order          min_lifespan max_lifespan mean_lifespan sd_lifespan total
##    <chr>                 <dbl>        <dbl>         <dbl>       <dbl> <int>
##  1 Artiodactyla             NA           NA            NA        NA     161
##  2 Carnivora                NA           NA            NA        NA     197
##  3 Cetacea                  NA           NA            NA        NA      55
##  4 Dermoptera               NA           NA            NA        NA       2
##  5 Hyracoidea               NA           NA            NA        NA       4
##  6 Insectivora              NA           NA            NA        NA      91
##  7 Lagomorpha               NA           NA            NA        NA      42
##  8 Macroscelidea            NA           NA            NA        NA      10
##  9 Perissodactyla           NA           NA            NA        NA      15
## 10 Pholidota                NA           NA            NA        NA       7
## 11 Primates                 NA           NA            NA        NA     156
## 12 Proboscidea             840          960           900        84.9     2
## 13 Rodentia                 NA           NA            NA        NA     665
## 14 Scandentia               NA           NA            NA        NA       7
## 15 Sirenia                  NA           NA            NA        NA       5
## 16 Tubulidentata           288          288           288        NA       1
## 17 Xenarthra                NA           NA            NA        NA      20
```

6. Let's look closely at gestation and newborns. Summarize the mean gestation, newborn mass, and weaning mass by order. Add a new column that shows mean gestation in years and sort in descending order. Which group has the longest mean gestation? What is the common name for these mammals?


```r
life_history_na %>% 
  group_by(order) %>% 
  summarize(mean_gestation_months=mean(gestation),
            mean_gestation_years=mean(gestation/12),
            mean_newborn_mass=mean(newborn),
            mean_weaning_mass=mean(weaning),
            total=n()) %>% 
  arrange(desc(mean_gestation_years))
```

```
## # A tibble: 17 x 6
##    order mean_gestation_… mean_gestation_… mean_newborn_ma…
##    <chr>            <dbl>            <dbl>            <dbl>
##  1 Prob…            21.3             1.77            99523.
##  2 Peri…            13.0             1.09               NA 
##  3 Hyra…             7.4             0.617              NA 
##  4 Tubu…             7.08            0.59             1734 
##  5 Derm…             2.75            0.229              NA 
##  6 Arti…            NA              NA                  NA 
##  7 Carn…            NA              NA                  NA 
##  8 Ceta…            NA              NA                  NA 
##  9 Inse…            NA              NA                  NA 
## 10 Lago…            NA              NA                  NA 
## 11 Macr…            NA              NA                  NA 
## 12 Phol…            NA              NA                  NA 
## 13 Prim…            NA              NA                  NA 
## 14 Rode…            NA              NA                  NA 
## 15 Scan…            NA              NA                  NA 
## 16 Sire…            NA              NA                  NA 
## 17 Xena…            NA              NA                  NA 
## # … with 2 more variables: mean_weaning_mass <dbl>, total <int>
```
The longest mean gestation is Proboscidea, which is elephants.
