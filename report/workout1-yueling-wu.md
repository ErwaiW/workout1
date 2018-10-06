workout01-yueling-wu
================
yueling wu
9/26/2018

``` r
knitr::opts_chunk$set(echo=TRUE,fig.path="Desktop/workout1/report/workout01-yueling-wu_files/")
```

``` r
library(ggplot2)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
nbanew = read.csv("~/Desktop/workout1/data/nba2018-teams.csv")
meansum=mean(nbanew$salary)
ggplot(nbanew,aes(x=reorder(team,salary),y=salary))+geom_bar(stat='identity')+coord_flip()+xlab("Team")+ylab("Salary (in millions)")+labs(title="NBA Teams ranked by Total Salary")+geom_hline(aes(yintercept=meansum),col="red")
```

![](Desktop/workout1/report/workout01-yueling-wu_files/teams%20ranked%20by%20total%20salary-1.png)

``` r
meanpoints=mean(nbanew$points)
ggplot(nbanew,aes(x=reorder(team,points),y=points))+geom_bar(stat='identity')+coord_flip()+xlab("Team")+ylab("Points")+labs(title="NBA Teams ranked by Total Points")+geom_hline(aes(yintercept=meanpoints),col="red")
```

![](Desktop/workout1/report/workout01-yueling-wu_files/teams%20ranked%20by%20total%20points-1.png)

``` r
meaneff=mean(nbanew$efficiency)
ggplot(nbanew,aes(x=reorder(team,efficiency),y=efficiency))+geom_bar(stat='identity')+coord_flip()+xlab("Team")+ylab("Efficiency")+labs(title="NBA Teams ranked by Total Efficiency")+geom_hline(aes(yintercept=meaneff),col="red")
```

![](Desktop/workout1/report/workout01-yueling-wu_files/teams%20ranked%20by%20total%20efficiency-1.png)

``` r
salarypergame = (nbanew$salary/nbanew$points)*1000000
meanspp=mean(salarypergame)
ggplot(nbanew,aes(x=reorder(team,salarypergame),y=salarypergame))+geom_bar(stat='identity')+coord_flip()+xlab("Team")+ylab("Salary per point ($)")+labs(title="NBA Teams ranked by Salary Per Point")+geom_hline(aes(yintercept=meanspp),col="red")
```

![](Desktop/workout1/report/workout01-yueling-wu_files/teams%20ranked%20by%20salary%20per%20point-1.png)
