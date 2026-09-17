# DATA-set-mtCars-with-R
mtcars Data Analysis (R)
A small R project demonstrating data manipulation and visualization on the classic mtcars dataset, using the tidyverse ecosystem (ggplot2, dplyr, tidyr).

Overview
The mtcars dataset (extracted from the 1974 Motor Trend US magazine) contains fuel consumption and 10 design/performance characteristics for 32 automobiles (1973–74 models). This project covers two main parts:

Visualization — exploring relationships and distributions with ggplot2
Data wrangling — selecting, filtering, sorting, mutating, categorizing, and cleaning data with dplyr / tidyr
Project structure
mtcars-analysis/
├── analysis.R      # main script (visualization + data wrangling)
├── README.md
└── .gitignore
Requirements
R (>= 4.0 recommended)
Packages:
r
install.packages(c("tidyverse", "dplyr", "ggplot2", "tidyr"))
How to run
Open analysis.R in RStudio (or VS Code with the R extension) and run it section by section, or source the whole file:

r
source("analysis.R")
What's inside analysis.R
Part 1 — Visualizations
Plot	Description
Scatter plot	mpg vs wt, colored by cyl, sized by hp — shows how weight, cylinder count, and horsepower relate to fuel efficiency
Histogram + density	Distribution of mpg across all cars
Boxplot	mpg distribution grouped by number of cylinders (cyl)
Part 2 — Data wrangling (dplyr / tidyr)
Select columns (consecutive and non-consecutive)
Filter rows with single/multiple conditions (AND / OR)
Arrange (sort) rows by one or more columns
Mutate — unit conversion (weight from 1000 lbs to kg), new ratio column (hp/wt)
case_when() — categorize horsepower into Faible / Moyenne / Élevée
if_else() — flag cars as Puissante / Non-puissante
factor() — convert cyl into a categorical variable
Missing data — introduce NAs and remove them with drop_na()
Dataset reference
mtcars ships with base R. Key variables used here:

Variable	Meaning
mpg	Miles per US gallon (fuel efficiency)
cyl	Number of cylinders
hp	Gross horsepower
wt	Weight (1000 lbs)
Full variable documentation: run ?mtcars in R.

Notes
The weight-to-kg conversion in analysis.R uses 1 lb = 0.453592 kg.
All operations use non-destructive pipelines (%>%) — the original mtcars object is only modified where explicitly reassigned (e.g. the factor(cyl) and missing-data steps).
License
Feel free to reuse and adapt this script for learning purposes.
