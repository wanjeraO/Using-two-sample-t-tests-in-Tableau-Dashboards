# Using-two-sample-t-tests-in-Tableau-Dashboards
Workbook for Harnessing T-tests in Dashboards 
# Harnessing T-tests in Dashboards

This repository contains the workbook for the presentation "Harnessing T-tests in Dashboards". It demonstrates how to integrate t-tests and effect size calculations into dashboards using Tableau and R.

## Introduction

In today's data-driven world, making informed decisions based on statistical analysis is crucial. This project showcases the integration of t-tests, a fundamental statistical test, into interactive dashboards. By leveraging Tableau and R, this workbook allows users to perform rigorous data analysis and visualize the results in a user-friendly manner. Whether you're a data analyst, researcher, or decision-maker, this tool will help you draw meaningful insights from your data.

## Project Description

This project aims to showcase the application of statistical tests, specifically t-tests, in interactive dashboards created with Tableau. By incorporating these statistical methods, users can perform rigorous data analysis and draw meaningful insights directly within their visualizations.

### Features
- **Interactive Dashboards**: Navigate through various sheets and dashboards to see t-tests and effect size calculations in action.
- **Statistical Integration**: Seamlessly integrate R scripts within Tableau to perform t-tests and calculate effect sizes.
- **User-Friendly Interface**: Intuitive design for easy navigation and interpretation of results.

## How to Use the Workbook

1. **Download the Workbook**: [Link to the workbook file]
2. **Open in Tableau**: Open the downloaded workbook in Tableau.
3. **Explore the Dashboard**: Use the interactive features to explore the different sheets and understand the statistical analyses.

## Calculating T-tests

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

