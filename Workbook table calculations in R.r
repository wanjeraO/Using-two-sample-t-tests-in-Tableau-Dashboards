#////The following will calculate effect size. Ensure that you have installed the R package ‘effsize’ of [Cohen's D]
SCRIPT_REAL("
library(effsize)

if (length(table(.arg2)) != 2){
   -9
} else {
   d <- cohen.d(.arg1 ~ .arg2)$estimate
   d
}
", SUM([Dep_Var_Selected]), MAX([Group name2]))



#//This will calculate a Simple Two sample t-test and return the p-value


SCRIPT_REAL(
'
if ( length(table(.arg2)) != 2){
  -9
} else {
  ttest     <- t.test(.arg1 ~ .arg2, paired = FALSE, alternative="two.sided")
  ttest[["p.value"]]
}

'
, SUM([Dep_Var_Selected]) //arg.1
, MAX([Group name2])  //arg.2
)