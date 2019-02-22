---
title: "Midterm Exam"
date: "Winter 2019"
output:
  html_document:
    keep_md: yes
    theme: spacelab
    toc_float: no
  pdf_document:
    toc: yes
---

## Instructions
This exam is designed to show me what you have learned and where there are problems. You may use your notes and anything from the `class_files` folder, but please no internet searches. You have 35 minutes to complete as many of these exercises as possible on your own, and 10 minutes to work with a partner.  

At the end of the exam, upload the complete .Rmd file to your GitHub repository.  

1. Load the tidyverse.

```r
library(tidyverse)
```

2. For these questions, we will use data about California colleges. Load the `ca_college_data.csv` as a new object called `colleges`.

```r
colleges <-
  readr::read_csv(file = "~/Desktop/FRS 417/datascibiol-master-week3/ca_college_data.csv")
```

```
## Parsed with column specification:
## cols(
##   INSTNM = col_character(),
##   CITY = col_character(),
##   STABBR = col_character(),
##   ZIP = col_character(),
##   ADM_RATE = col_double(),
##   SAT_AVG = col_double(),
##   PCIP26 = col_double(),
##   COSTT4_A = col_double(),
##   C150_4_POOLED = col_double(),
##   PFTFTUG1_EF = col_double()
## )
```

3. Use your preferred function to have a look at the data and get an idea of its structure.

```r
glimpse(colleges)
```

```
## Observations: 341
## Variables: 10
## $ INSTNM        <chr> "Grossmont College", "College of the Sequoias", ...
## $ CITY          <chr> "El Cajon", "Visalia", "San Mateo", "Ventura", "...
## $ STABBR        <chr> "CA", "CA", "CA", "CA", "CA", "CA", "CA", "CA", ...
## $ ZIP           <chr> "92020-1799", "93277-2214", "94402-3784", "93003...
## $ ADM_RATE      <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
## $ SAT_AVG       <dbl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, ...
## $ PCIP26        <dbl> 0.0016, 0.0066, 0.0038, 0.0035, 0.0085, 0.0151, ...
## $ COSTT4_A      <dbl> 7956, 8109, 8278, 8407, 8516, 8577, 8580, 9181, ...
## $ C150_4_POOLED <dbl> NA, NA, NA, NA, NA, NA, 0.2334, NA, NA, NA, NA, ...
## $ PFTFTUG1_EF   <dbl> 0.3546, 0.5413, 0.3567, 0.3824, 0.2753, 0.4286, ...
```

4. What are the column names?

```r
names(colleges)
```

```
##  [1] "INSTNM"        "CITY"          "STABBR"        "ZIP"          
##  [5] "ADM_RATE"      "SAT_AVG"       "PCIP26"        "COSTT4_A"     
##  [9] "C150_4_POOLED" "PFTFTUG1_EF"
```

5. Are there any NA's in the data? If so, how many are present and in which variables?

```r
colleges %>% 
summarize(number_nas=sum(is.na(colleges)))
```

```
## Warning: package 'bindrcpp' was built under R version 3.4.4
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1        949
```


```r
colleges %>% 
summarize(number_nas=sum(is.na(INSTNM)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1          0
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(CITY)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1          0
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(STABBR)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1          0
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(ZIP)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1          0
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(ADM_RATE)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1        240
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(SAT_AVG)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1        276
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(PCIP26)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1         35
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(COSTT4_A)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1        124
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(C150_4_POOLED)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1        221
```

```r
colleges %>% 
summarize(number_nas=sum(is.na(PFTFTUG1_EF)))
```

```
## # A tibble: 1 x 1
##   number_nas
##        <int>
## 1         53
```


6. Which cities in California have the highest number of colleges?

```r
colleges %>% 
  ggplot(aes(x=CITY))+
  geom_bar()+
  labs(title = "Number of Colleges per City",
       x= "City",
       y= "Number of Colleges")+
    theme(plot.title = element_text(size = rel(2), hjust = 0.5))
```

![](midterm_exam_files/figure-html/unnamed-chunk-16-1.png)<!-- -->


7. The column `COSTT4_A` is the annual cost of each institution. Which city has the highest cost?

```r
colleges %>% 
  group_by(CITY) %>% 
  select(COSTT4_A) %>% 
  arrange(desc(COSTT4_A))
```

```
## Adding missing grouping variables: `CITY`
```

```
## # A tibble: 341 x 2
## # Groups:   CITY [161]
##    CITY          COSTT4_A
##    <chr>            <dbl>
##  1 Claremont        69355
##  2 Los Angeles      67225
##  3 Los Angeles      67064
##  4 Los Angeles      67046
##  5 Claremont        66325
##  6 Malibu           66152
##  7 Claremont        66060
##  8 Claremont        65880
##  9 San Francisco    65453
## 10 Claremont        64870
## # ... with 331 more rows
```


8. The column `ADM_RATE` is the admissions rate by college and `C150_4_POOLED` is the four-year completion rate. Use a scatterplot to show the relationship between these two variables. What does this mean?

```r
  ggplot(data = colleges, mapping = aes(x=ADM_RATE, y=C150_4_POOLED))+
  geom_point()
```

```
## Warning: Removed 251 rows containing missing values (geom_point).
```

![](midterm_exam_files/figure-html/unnamed-chunk-18-1.png)<!-- -->


9. The column titled `INSTNM` is the institution name. We are only interested in the University of California colleges. Run the code below and look at the output. Are all of the columns tidy? Why or why not?

```r
univ_calif <-
  colleges %>% 
  filter_all(any_vars(str_detect(.,pattern="University of California")))
univ_calif
```

```
## # A tibble: 10 x 10
##    INSTNM CITY  STABBR ZIP   ADM_RATE SAT_AVG PCIP26 COSTT4_A C150_4_POOLED
##    <chr>  <chr> <chr>  <chr>    <dbl>   <dbl>  <dbl>    <dbl>         <dbl>
##  1 Unive… La J… CA     92093    0.357    1324  0.216    31043         0.872
##  2 Unive… Irvi… CA     92697    0.406    1206  0.107    31198         0.876
##  3 Unive… Rive… CA     92521    0.663    1078  0.149    31494         0.73 
##  4 Unive… Los … CA     9009…    0.180    1334  0.155    33078         0.911
##  5 Unive… Davis CA     9561…    0.423    1218  0.198    33904         0.850
##  6 Unive… Sant… CA     9506…    0.578    1201  0.193    34608         0.776
##  7 Unive… Berk… CA     94720    0.169    1422  0.105    34924         0.916
##  8 Unive… Sant… CA     93106    0.358    1281  0.108    34998         0.816
##  9 Unive… San … CA     9410…   NA          NA NA           NA        NA    
## 10 Unive… San … CA     9414…   NA          NA NA           NA        NA    
## # ... with 1 more variable: PFTFTUG1_EF <dbl>
```


10. Use `separate()` to separate institution name into two new columns "UNIV" and "CAMPUS".

```r
colleges %>% 
  separate(INSTNM,into=c("UNIV", "CAMPUS"),sep="_" )
```

```
## Warning: Expected 2 pieces. Missing pieces filled with `NA` in 341 rows [1,
## 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...].
```

```
## # A tibble: 341 x 11
##    UNIV  CAMPUS CITY  STABBR ZIP   ADM_RATE SAT_AVG PCIP26 COSTT4_A
##    <chr> <chr>  <chr> <chr>  <chr>    <dbl>   <dbl>  <dbl>    <dbl>
##  1 Gros… <NA>   El C… CA     9202…       NA      NA 0.0016     7956
##  2 Coll… <NA>   Visa… CA     9327…       NA      NA 0.0066     8109
##  3 Coll… <NA>   San … CA     9440…       NA      NA 0.0038     8278
##  4 Vent… <NA>   Vent… CA     9300…       NA      NA 0.0035     8407
##  5 Oxna… <NA>   Oxna… CA     9303…       NA      NA 0.0085     8516
##  6 Moor… <NA>   Moor… CA     9302…       NA      NA 0.0151     8577
##  7 Skyl… <NA>   San … CA     9406…       NA      NA 0          8580
##  8 Glen… <NA>   Glen… CA     9120…       NA      NA 0.002      9181
##  9 Citr… <NA>   Glen… CA     9174…       NA      NA 0.0021     9281
## 10 Fres… <NA>   Fres… CA     93741       NA      NA 0.0324     9370
## # ... with 331 more rows, and 2 more variables: C150_4_POOLED <dbl>,
## #   PFTFTUG1_EF <dbl>
```


11. As a final step, remove `Hastings College of Law` and `UC San Francisco` and store the final data frame as a new object `univ_calif_final`.


12. The column `ADM_RATE` is the admissions rate by campus. Which UC has the lowest and highest admissions rates? Please use a barplot.

```r
colleges %>% 
  ggplot(aes(x=ADM_RATE,))+
  geom_bar()+
  labs(title = "Admissions rate by campus",
       x = "Admission Rate",
       y = "Campus")+ 
  theme(plot.title = element_text(size = rel(1.25)))
```

```
## Warning: Removed 240 rows containing non-finite values (stat_count).
```

![](midterm_exam_files/figure-html/unnamed-chunk-21-1.png)<!-- -->


## Knit Your Output and Post to [GitHub](https://github.com/FRS417-DataScienceBiologists)
