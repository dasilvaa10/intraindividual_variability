# Contents

Work in progress:

A variety of functions to aid in the analysis of intensively collected longitudinal data.

# Functions

autoReg: calculates autocorrelation for an item at a given lag

btwn_win: for a given covariate, prepares it to be evaluated for both between-subject and within-subject effects (e.g., Hedeker & Gibbons, 2006) in a model with time-varying covariates

scale_within: by subject centering/standardization

var_check: For each subject, creates a list of variables that have no variability (sensor stuck and outputting same value, or subject responds the exact same every day)