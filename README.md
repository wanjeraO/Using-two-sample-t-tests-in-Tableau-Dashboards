# Using-two-sample-t-tests-in-Tableau-Dashboards
## Overview
This repository contains a Tableau workbook demonstrating the application of t-tests for group comparisons. The workbook uses simulated data to demonstrates how to integrate t-tests and effect size calculations into dashboards using Tableau and R, with a focus on student success-related metrics.

## Purpose
The primary purpose of this workbook is to:
1. Demonstrate the practical application of t-tests in data analysis and visualization.
2. Provide an interactive platform for users to explore group differences using statistical methods.
3. Illustrate how to interpret t-test results in conjunction with effect sizes.


## Introduction

In today's data-driven world, making informed decisions based on statistical analysis is crucial. This project showcases the integration of t-tests, a fundamental statistical test, into interactive dashboards. By leveraging Tableau and R, this workbook allows users to perform data analysis to explore the differences between two groups.

## Project Description

This project showcases the application of statistical tests, specifically t-tests, in interactive dashboards created with Tableau. By incorporating these statistical methods, users can perform data analysis and draw meaningful insights directly within their visualizations.

### Features
- **Interactive Dashboards**: Dynamic navigation through the dashboard to see t-tests and effect size calculations in action based on user-selected groups.
- **Statistical Integration**: Seamlessly integrate R scripts within Tableau to perform t-tests and calculate effect sizes.
- **User-Friendly Interface**: Intuitive design for easy navigation and interpretation of results.

## How to Use the Workbook

1. **Download the Workbook**: [Link to the workbook file]
2. **Open in Tableau**: Open the downloaded workbook in Tableau.
3. **Explore the Dashboard**: Use the interactive features to explore the different sheets and understand the statistical analyses.
4. **Select only two groups**: In the dashboard, select two groups you wish to compare from the available options.
5. **Use the "Apply" button**: Ensure you have selectd the "Apply" button to initiate the t-test calculations.
6. **Observe the results**: The provided p-values and effect sizes, for each measure.

## Interpreting Results
When interpreting the results, please consider the following:

1. **P-values**: A small p-value (typically < 0.05) suggests that the observed differences between groups are statistically significant and unlikely to occur by random chance alone.

2. **Effect Sizes**: Effect size measures (e.g., Cohen's d) quantify the magnitude of the difference between group means. Interpret effect sizes as follows:
   - Small effect: |d| < 0.2
   - Medium effect: 0.2 ≤ |d| < 0.8
   - Large effect: |d| ≥ 0.8

3. **Context**: Consider both statistical significance (p-value) and practical significance (effect size) when interpreting results. A statistically significant result may not always be practically meaningful, especially with large sample sizes.

4. **Assumptions**: T-tests assume normality, equal variances, and independent sampling. Violations of these assumptions may affect the validity of the results.

5. **Sample Size**: Larger sample sizes tend to produce smaller p-values. Consider the sample size when interpreting significance.

## Important Notes
- The workbook uses simulated data and does not represent real-life scenarios. It is intended for demonstration and educational purposes only.
- Only two groups can be selected at a time for comparison. Selecting more than two groups will result in an error.
- The dashboard may take some time to perform calculations, especially for large datasets.
  
## Contact
For any questions, contact wanjera@msn.com

## Calculating T-tests and effect sizes

T-tests are calculated using the following R script integrated into Tableau:

```r
SCRIPT_REAL("
if (length(table(.arg2)) != 2){
   -9
} else {
   ttest <- t.test(.arg1 ~ .arg2, paired = FALSE, alternative='two.sided')
   ttest[['p.value']]
}
", SUM([Dep_Var_Selected]), MAX([Group name]))
```

Effect size is calculated using the following R script integrated into Tableau (ensure 'effsize' is installed):

```r
SCRIPT_REAL("
library(effsize)

if (length(table(.arg2)) != 2){
   -9
} else {
   d <- cohen.d(.arg1 ~ .arg2)$estimate
   d
}
", SUM([Dep_Var_Selected]), MAX([Group name]))
```

### Explanation

- **T-tests**: This script performs a two-sample t-test to compare the means of two groups.
  - **Parameters**:
    - `.arg1`: Dependent variable (e.g., test scores).
    - `.arg2`: Grouping variable (e.g., group labels).

- **Effect Sizes**: This script calculates the effect size using Cohen's d from the `effsize` package.
  - **Parameters**:
    - `.arg1`: Dependent variable (e.g., test scores).
    - `.arg2`: Grouping variable (e.g., group labels).

### Requirements

- **Tableau**: Ensure you have Tableau installed to open and interact with the workbook.
- **R and Rserve**: Required for running the embedded R scripts. Install R and start Rserve with the command `Rserve()` in your R console.

## Setup Instructions

1. **Install R and Rserve**: Follow the instructions to install R from [CRAN](https://cran.r-project.org/) and install Rserve by running `install.packages("Rserve")` in R.
2. **Start Rserve**: Start Rserve by running `Rserve()` in your R console.
3. **Connect Tableau to Rserve**:
   - In Tableau, go to `Help` > Settings and Performance > Manage External Service Connection.
In the dialog that appears:
Connection Type: Select Rserve.
Host: Enter the hostname (e.g., localhost if running locally).
Port: Enter the port number (default is 6311 for Rserve).
Close the dialog.
