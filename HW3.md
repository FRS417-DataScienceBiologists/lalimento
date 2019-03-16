---
title: "Homework 3"
author: "Lauren Alimento"
date: "3/16/2019"
output: 
  html_document: 
    keep_md: yes
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code, keep track of your versions using git, and push your final work to our [GitHub repository](https://github.com/FRS417-DataScienceBiologists). I will randomly select a few examples of student work at the start of each session to use as examples so be sure that your code is working to the best of your ability.

## Load the libraries

```r
library(tidyverse)
```

For this assignment we are going to work with a large dataset from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. The data are messy, so for this assignment I am going to provide some help. The code I use will likely be useful in the future so keep it handy. First, load the data. **Read** the error message.  


```r
fisheries <- readr::read_csv(file = "~/Desktop/FRS 417/datascibiol-master/data/FAO_1950to2012_111914.csv") 
```

```
## Warning: Duplicated column names deduplicated: 'Species (ISSCAAP group)'
## => 'Species (ISSCAAP group)_1' [4], 'Species (ASFIS species)' => 'Species
## (ASFIS species)_1' [5], 'Species (ASFIS species)' => 'Species (ASFIS
## species)_2' [6]
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   `Species (ISSCAAP group)` = col_double(),
##   `Fishing area (FAO major fishing area)` = col_double()
## )
```

```
## See spec(...) for full column specifications.
```

1. Do you see any potential problems with the column names? Does the error message now make more sense?  
*Column names are duplicated so R manipulated them to unique names*
There are multiple columns with the same name, such as "Species (ISSCAAP group)" and "Species (ASFIS species)", so the column names that were the same were given different names to set them apart.

2. The `make.names()` command is helpful when there are issues with column names. Notice that although the names are still cumbersome, much of the problemtatic syntax is removed.

```r
names(fisheries) = make.names(names(fisheries), unique=T) #changes the column names
names(fisheries)
```

```
##  [1] "Country..Country."                    
##  [2] "Species..ASFIS.species."              
##  [3] "Species..ISSCAAP.group."              
##  [4] "Species..ISSCAAP.group._1"            
##  [5] "Species..ASFIS.species._1"            
##  [6] "Species..ASFIS.species._2"            
##  [7] "Fishing.area..FAO.major.fishing.area."
##  [8] "Measure..Measure."                    
##  [9] "X1950"                                
## [10] "X1951"                                
## [11] "X1952"                                
## [12] "X1953"                                
## [13] "X1954"                                
## [14] "X1955"                                
## [15] "X1956"                                
## [16] "X1957"                                
## [17] "X1958"                                
## [18] "X1959"                                
## [19] "X1960"                                
## [20] "X1961"                                
## [21] "X1962"                                
## [22] "X1963"                                
## [23] "X1964"                                
## [24] "X1965"                                
## [25] "X1966"                                
## [26] "X1967"                                
## [27] "X1968"                                
## [28] "X1969"                                
## [29] "X1970"                                
## [30] "X1971"                                
## [31] "X1972"                                
## [32] "X1973"                                
## [33] "X1974"                                
## [34] "X1975"                                
## [35] "X1976"                                
## [36] "X1977"                                
## [37] "X1978"                                
## [38] "X1979"                                
## [39] "X1980"                                
## [40] "X1981"                                
## [41] "X1982"                                
## [42] "X1983"                                
## [43] "X1984"                                
## [44] "X1985"                                
## [45] "X1986"                                
## [46] "X1987"                                
## [47] "X1988"                                
## [48] "X1989"                                
## [49] "X1990"                                
## [50] "X1991"                                
## [51] "X1992"                                
## [52] "X1993"                                
## [53] "X1994"                                
## [54] "X1995"                                
## [55] "X1996"                                
## [56] "X1997"                                
## [57] "X1998"                                
## [58] "X1999"                                
## [59] "X2000"                                
## [60] "X2001"                                
## [61] "X2002"                                
## [62] "X2003"                                
## [63] "X2004"                                
## [64] "X2005"                                
## [65] "X2006"                                
## [66] "X2007"                                
## [67] "X2008"                                
## [68] "X2009"                                
## [69] "X2010"                                
## [70] "X2011"                                
## [71] "X2012"
```

3. Let's rename the columns. Use `rename()` to adjust the names as follows. Double check to make sure the rename worked correctly. Make sure to replace the old fisheries object with a new one so you can keep the column names.
+ country     = Country..Country.  
+ commname    = Species..ASFIS.species.  
+ sciname     = Species..ASFIS.species._2  
+ spcode      = Species..ASFIS.species._1  
+ spgroup     = Species..ISSCAAP.group.  
+ spgroupname = Species..ISSCAAP.group._1  
+ region      = Fishing.area..FAO.major.fishing.area.  
+ unit        = Measure..Measure.  

```r
fisheries <-
  fisheries %>% 
  dplyr::rename(
    country     = Country..Country.,
    commname    = Species..ASFIS.species.,
    sciname     = Species..ASFIS.species._2,
    spcode      = Species..ASFIS.species._1,
    spgroup     = Species..ISSCAAP.group.,
    spgroupname = Species..ISSCAAP.group._1,
    region      = Fishing.area..FAO.major.fishing.area.,
    unit        = Measure..Measure.  )
fisheries
```

```
## # A tibble: 17,692 x 71
##    country commname spgroup spgroupname spcode sciname region unit  X1950
##    <chr>   <chr>      <dbl> <chr>       <chr>  <chr>    <dbl> <chr> <chr>
##  1 Albania Angelsh…      38 Sharks, ra… 10903… Squati…     37 Quan… ...  
##  2 Albania Atlanti…      36 Tunas, bon… 17501… Sarda …     37 Quan… ...  
##  3 Albania Barracu…      37 Miscellane… 17710… Sphyra…     37 Quan… ...  
##  4 Albania Blue an…      45 Shrimps, p… 22802… Ariste…     37 Quan… ...  
##  5 Albania Blue wh…      32 Cods, hake… 14804… Microm…     37 Quan… ...  
##  6 Albania Bluefish      37 Miscellane… 17020… Pomato…     37 Quan… ...  
##  7 Albania Bogue         33 Miscellane… 17039… Boops …     37 Quan… ...  
##  8 Albania Caramot…      45 Shrimps, p… 22801… Penaeu…     37 Quan… ...  
##  9 Albania Catshar…      38 Sharks, ra… 10801… Scylio…     37 Quan… ...  
## 10 Albania Common …      57 Squids, cu… 32102… Sepia …     37 Quan… ...  
## # … with 17,682 more rows, and 62 more variables: X1951 <chr>,
## #   X1952 <chr>, X1953 <chr>, X1954 <chr>, X1955 <chr>, X1956 <chr>,
## #   X1957 <chr>, X1958 <chr>, X1959 <chr>, X1960 <chr>, X1961 <chr>,
## #   X1962 <chr>, X1963 <chr>, X1964 <chr>, X1965 <chr>, X1966 <chr>,
## #   X1967 <chr>, X1968 <chr>, X1969 <chr>, X1970 <chr>, X1971 <chr>,
## #   X1972 <chr>, X1973 <chr>, X1974 <chr>, X1975 <chr>, X1976 <chr>,
## #   X1977 <chr>, X1978 <chr>, X1979 <chr>, X1980 <chr>, X1981 <chr>,
## #   X1982 <chr>, X1983 <chr>, X1984 <chr>, X1985 <chr>, X1986 <chr>,
## #   X1987 <chr>, X1988 <chr>, X1989 <chr>, X1990 <chr>, X1991 <chr>,
## #   X1992 <chr>, X1993 <chr>, X1994 <chr>, X1995 <chr>, X1996 <chr>,
## #   X1997 <chr>, X1998 <chr>, X1999 <chr>, X2000 <chr>, X2001 <chr>,
## #   X2002 <chr>, X2003 <chr>, X2004 <chr>, X2005 <chr>, X2006 <chr>,
## #   X2007 <chr>, X2008 <chr>, X2009 <chr>, X2010 <chr>, X2011 <chr>,
## #   X2012 <chr>
```
4. Are these data tidy? Why or why not, and, how do you know?
The data isn't tidy; the column names are variables. For example, the years could be grouped together to be one column of years.
5. We need to tidy the data using `gather()`. The code below will not run because it is commented (#) out. I have added a bit of code that will prevent you from needing to type in each year from 1950-2012 but you need to complete the remainder `QQQ` and remove the `#`.

```r
fisheries_tidy <- 
  fisheries %>% 
  gather(num_range('X',1950:2012), key='year', value='catch')
fisheries_tidy
```

```
## # A tibble: 1,114,596 x 10
##    country commname spgroup spgroupname spcode sciname region unit  year 
##    <chr>   <chr>      <dbl> <chr>       <chr>  <chr>    <dbl> <chr> <chr>
##  1 Albania Angelsh…      38 Sharks, ra… 10903… Squati…     37 Quan… X1950
##  2 Albania Atlanti…      36 Tunas, bon… 17501… Sarda …     37 Quan… X1950
##  3 Albania Barracu…      37 Miscellane… 17710… Sphyra…     37 Quan… X1950
##  4 Albania Blue an…      45 Shrimps, p… 22802… Ariste…     37 Quan… X1950
##  5 Albania Blue wh…      32 Cods, hake… 14804… Microm…     37 Quan… X1950
##  6 Albania Bluefish      37 Miscellane… 17020… Pomato…     37 Quan… X1950
##  7 Albania Bogue         33 Miscellane… 17039… Boops …     37 Quan… X1950
##  8 Albania Caramot…      45 Shrimps, p… 22801… Penaeu…     37 Quan… X1950
##  9 Albania Catshar…      38 Sharks, ra… 10801… Scylio…     37 Quan… X1950
## 10 Albania Common …      57 Squids, cu… 32102… Sepia …     37 Quan… X1950
## # … with 1,114,586 more rows, and 1 more variable: catch <chr>
```
6. Use `glimpse()` to look at the categories of the variables. Pay particular attention to `year` and `catch`. What do you notice?  

```r
glimpse(fisheries_tidy)
```

```
## Observations: 1,114,596
## Variables: 10
## $ country     <chr> "Albania", "Albania", "Albania", "Albania", "Albania…
## $ commname    <chr> "Angelsharks, sand devils nei", "Atlantic bonito", "…
## $ spgroup     <dbl> 38, 36, 37, 45, 32, 37, 33, 45, 38, 57, 33, 57, 31, …
## $ spgroupname <chr> "Sharks, rays, chimaeras", "Tunas, bonitos, billfish…
## $ spcode      <chr> "10903XXXXX", "1750100101", "17710001XX", "228020310…
## $ sciname     <chr> "Squatinidae", "Sarda sarda", "Sphyraena spp", "Aris…
## $ region      <dbl> 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, 37, …
## $ unit        <chr> "Quantity (tonnes)", "Quantity (tonnes)", "Quantity …
## $ year        <chr> "X1950", "X1950", "X1950", "X1950", "X1950", "X1950"…
## $ catch       <chr> "...", "...", "...", "...", "...", "...", "...", "..…
```
I noticed that the only year listed is 1950 and that the "catch" that year is simply "..."
7. From question 6 you should see that there are a lot of entries that are missing. In R, these are referred to as NA's but they can be coded in different ways by the scientists in a given study. In order to make the data tidy, we need to deal with them. As a preview to our next lab, run the following code by removing the `#`. It removes the 'X' from the years and changes the `catch` column from a character into a numeric. This forces the blank entries to become NAs. The error "NAs introduced by coercion" indicates their replacement.

```r
fisheries_tidy <- 
  fisheries_tidy %>% 
  mutate(
   year= as.numeric(str_replace(year, 'X', '')), #remove the X from year
    catch= as.numeric(str_replace(catch, c(' F','...','-'), replacement = '')) #replace character strings with NA
    
    )
```

```
## Warning in rlang::eval_tidy(~as.numeric(str_replace(catch, c(" F", "...", :
## NAs introduced by coercion
```

```r
fisheries_tidy
```

```
## # A tibble: 1,114,596 x 10
##    country commname spgroup spgroupname spcode sciname region unit   year
##    <chr>   <chr>      <dbl> <chr>       <chr>  <chr>    <dbl> <chr> <dbl>
##  1 Albania Angelsh…      38 Sharks, ra… 10903… Squati…     37 Quan…  1950
##  2 Albania Atlanti…      36 Tunas, bon… 17501… Sarda …     37 Quan…  1950
##  3 Albania Barracu…      37 Miscellane… 17710… Sphyra…     37 Quan…  1950
##  4 Albania Blue an…      45 Shrimps, p… 22802… Ariste…     37 Quan…  1950
##  5 Albania Blue wh…      32 Cods, hake… 14804… Microm…     37 Quan…  1950
##  6 Albania Bluefish      37 Miscellane… 17020… Pomato…     37 Quan…  1950
##  7 Albania Bogue         33 Miscellane… 17039… Boops …     37 Quan…  1950
##  8 Albania Caramot…      45 Shrimps, p… 22801… Penaeu…     37 Quan…  1950
##  9 Albania Catshar…      38 Sharks, ra… 10801… Scylio…     37 Quan…  1950
## 10 Albania Common …      57 Squids, cu… 32102… Sepia …     37 Quan…  1950
## # … with 1,114,586 more rows, and 1 more variable: catch <dbl>
```
8. Are the data tidy? Why?  
Yes, the data are tidy. Each observation has its own row and the titles of the columns are no longer variables, they're titles.
9. You are a fisheries scientist studying cephalopod catch during 2008-2012. Identify the top five consumers (by country) of cephalopods (don't worry about species for now). Restrict the data frame only to our variables of interest.

```r
fisheries_tidy %>% 
  select(country, year, catch, spgroupname )%>% 
  filter(spgroupname=="Squids, cuttlefishes, octopuses") %>% 
  filter(year>=2008 & year<=2012)%>% 
  arrange(desc(catch))
```

```
## # A tibble: 3,725 x 4
##    country   year  catch spgroupname                    
##    <chr>    <dbl>  <dbl> <chr>                          
##  1 Peru      2008 533414 Squids, cuttlefishes, octopuses
##  2 China     2008 462981 Squids, cuttlefishes, octopuses
##  3 China     2012 434845 Squids, cuttlefishes, octopuses
##  4 Peru      2011 404730 Squids, cuttlefishes, octopuses
##  5 China     2009 392478 Squids, cuttlefishes, octopuses
##  6 China     2011 390393 Squids, cuttlefishes, octopuses
##  7 Peru      2010 369822 Squids, cuttlefishes, octopuses
##  8 China     2012 261000 Squids, cuttlefishes, octopuses
##  9 Viet Nam  2010 260000 Squids, cuttlefishes, octopuses
## 10 Japan     2011 242262 Squids, cuttlefishes, octopuses
## # … with 3,715 more rows
```
Your top five consumers of cephalopods are Peru, China, Vietnam, Japan, and Taiwan.
10. Let's be more specific. Who consumes the most `Common cuttlefish`? Store this as a new object `cuttle`.

```r
cuttle <-
  fisheries_tidy %>% 
  select(country, year, catch, commname )%>% 
  filter(commname=="Common cuttlefish") %>% 
  filter(year>=2008 & year<=2012)%>% 
  arrange(desc(catch))
cuttle
```

```
## # A tibble: 105 x 4
##    country   year catch commname         
##    <chr>    <dbl> <dbl> <chr>            
##  1 France    2012 13217 Common cuttlefish
##  2 France    2011 12966 Common cuttlefish
##  3 France    2009  8076 Common cuttlefish
##  4 Tunisia   2012  7717 Common cuttlefish
##  5 Tunisia   2011  6371 Common cuttlefish
##  6 Tunisia   2008  4913 Common cuttlefish
##  7 Tunisia   2009  3924 Common cuttlefish
##  8 Portugal  2010  2027 Common cuttlefish
##  9 Libya     2009  1800 Common cuttlefish
## 10 Libya     2010  1750 Common cuttlefish
## # … with 95 more rows
```
France consumes the most cuttlefish.
