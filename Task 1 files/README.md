# hw06
By: Gabrielle Meyers

## Introduction
Revisiting the SCOTUS data from HW03, my analysis will focus on trends between states concerning the Surpeme Court. I intend to survey states by comparing how often they appear as the source of a case. I also want to observe these trends in the contexts of declaration of constitutionality, decision direction, and issue area. Further explanation of the data and the codebook can be found [here](http://scdb.wustl.edu/documentation.php?var=decisionDirection).

## Executing the Rmd
My analysis was conducted using the SCOTUS data from HW03. I transferred the appropriate data folder to my R project and pushed it to Github, so it should now be in my repository should anyone fork my respository. Like before, I binded the two datasets together. For the sake of this particular analysis, I also created two new CSV files, which are used to link the names of the states and issue areas to the data. I combined the new CSVs with our data from HW03 using the join function. I don't use any extraordinary packages- I only load tidyverse and ggplot2, and if I've used anything else I make explicit reference to it in my code, so once you clone the repository you should have no trouble reproducing my script.

## Directory

**Data:** Contains SCOTUS data
* SCDB_2019_01_justiceCentered_Citation.csv
* SCDB_Legacy_05_justiceCentered_Citation.csv

**issues - Sheet1.csv:** contains the CSV linking the names of each issue area to their relevant coding numbers

**states - Sheet1.csv:** contains the CSV linking the names of each state to their relevant coding numbers

**supreme.R:** contains the script for this assignment. There are few comments so as to make it easier to read

**supreme.Rmd:** contains the code and report. There are many comments attached to the code to make it more comprehensive

**supreme.md:** contains the markdown report

**supreme_files:** contains the graphs