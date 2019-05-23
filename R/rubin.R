rubin <-function(vars,ests,m = NULL){
  
  if (is.null(m) == TRUE) {
    
    stop("don't forget to set m (number of imputed datasets)")
    
  }
  
  if (m <= 10){
    
    message("While 5-10 imputed datasets are a traditional standard, recent work suggest that number may be low - particularly if your amount of missingess is high! See Graham et al. (2007); Royston et al. (2011)")
    
  }
  
  within_var <- mean(vars)
  
  btwn_var<- var(ests)
  
  rub_var<- within_var + (1 + 1/m)*btwn_var
  
  return(rub_var)
  
}