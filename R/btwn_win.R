btwn_win<-function(data, within = NULL, center_w=TRUE, scale_w = FALSE, combine = TRUE){
  
  data_centered<-scale_within(data,center_w = center_w, scale_w = scale_w, within = within, means =TRUE)
  
  within_inds<-grep("within", colnames(data_centered[[1]]))
  
  within_dat<-data_centered[[1]][,within_inds]
  
  btwn_dat<-data_centered[[2]]
  
  combined_dat<-cbind(within_dat,btwn_dat)
  
  if (combine == TRUE) {
    
    combined_dat<-cbind(data,combined_dat)
    
  } else {
  
    combined_dat <- combined_dat
    
  } 
  
  return(combined_dat)
  
}