# Contents

Work in progress:

A variety of functions to aid in the analysis of intensively collected longitudinal data.

# Functions

autoReg: calculates autocorrelation for an item at a given lag

btwn_win: for a given covariate, prepares it to be evaluated for both between-subject and within-subject effects (e.g., Hedeker & Gibbons, 2006) in a model with time-varying covariates

continuous_missing: helper to aid with part 2 of the function "missing_within"

missing_within: Returns a list containing: (1) a nsub x nfeat dataframe with each cell representing the proportion of a given variable missing for a specific subject and (2) a nsub by nfeat dataframe with each cell corresponding to the longest continuous string of NAs on a given variabe for a subject.  

mmsd: calculates mean sqaure of successive differences

scale_within: by subject centering/standardization

var_check: For each subject, creates a list of variables that have no variability (sensor stuck and outputting same value, or subject responds the exact same every day)

