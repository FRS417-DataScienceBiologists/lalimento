---
title: "Homework 2"
author: "Lauren Alimento"
date: "1/30/2019"
output: html_document
---
## Load the tidyverse
```{r}
library("tidyverse")
```
## Mammals Sleep
For this assignment, we are going to use built-in data on mammal sleep patterns.  
```{r}
msleep
```

1. From which publication are these data taken from? Don't do an internet search; show the code that you would use to find out in R.
```{r}
str(msleep)
```
## I'm confused... how do you find out what publication this data is taken from? I can find summaries of the actual data itself, but I can't find which publication it was taken from.

2. Provide some summary information about the data to get you started; feel free to use the functions that you find most helpful.

```{r}
summary(msleep)
```
```{r}
colnames(msleep)
```
```{r}
glimpse(msleep)
```
```{r}
head(msleep)
```
```{r}
tail(msleep)
```
```{r}
nrow(msleep)
```
```{r}
filter(msleep, bodywt<1000000000)
```

3. Make a new data frame focused on body weight, but be sure to indicate the common name and genus of each mammal. Sort the data in descending order by body weight.
```{r}
library(tidyverse)
```
```{r}
orgname<-c(name)
orgname
```
```{r}
orggenus<-c(genus)
orggenus
```
```{r}
orgbodywt<-desc(bodywt)
orgbodywt
```

```{r}
MammalDataFrame <- data.frame(orgname=orgname,orggenus=orggenus, orgbodywt=orgbodywt)
MammalDataFrame
```
## I looked it up online and it said that "desc" puts the data in descending order but it didn't work for me :(

4. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. For our study, we are interested in body weight and sleep total Make two new dataframes (large and small) based on these parameters. Sort the data in descending order by body weight.
```{r}
small <- c(filter(msleep, bodywt<=1))
small
```
```{r}
large <- c(filter(msleep, bodywt>=200))
large
```
```{r}
smallbody <-c(bodywt[bodywt<=1])
smallbody
```
## Okay I tried to re-run the code below to see what would happen and it kept coming up with NA instead of listing the organisms that have body weights less than 1. Why is this happening?? It started off listing all the organisms and now they all disappeared and I'm sad.
```{r}
orgname <-c(orgname[bodywt<=1])
orgname
```
```{r}
sleep_total <-c(sleep_total[bodywt<=1])
sleep_total
```

```{r}
SmallMammalDataFrame <- data.frame(orgname=orgname, smallbody=smallbody, sleep_total=sleep_total)
SmallMammalDataFrame
```

```{r}
largebody <-c(bodywt[bodywt>=200])
largebody
```
```{r}
orgname_large <-c(orgname[bodywt>=200])
orgname_large
```
```{r}
sleep_total <-c(sleep_total[bodywt>=200])
sleep_total
```
## I think that I somehow combined the large mammal data with the small mammal data because the thirteen-lined ground squirrel definitely isn't a large organism.

5. Let's try to figure out if large mammals sleep, on average, longer than small mammals. What is the average sleep duration for large mammals as we have defined them?
```{r}
large$sleep_total
```

```{r}
mean(large$sleep_total)
```
```{r}
small$sleep_total
```

6. What is the average sleep duration for small mammals as we have defined them?
```{r}
mean(small$sleep_total)
```


7. Which animals sleep at least 18 hours per day? Be sure to show the name, genus, order, and sleep total. Sort by order and sleep total.

```{r}
filter(msleep, sleep_total>=18)
```


