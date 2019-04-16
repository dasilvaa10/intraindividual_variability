btwn_win<-function(data, within = NULL, center_w=TRUE, scale_w = FALSE, combine = TRUE){
  
  data_centered<-within_scale(data,center_w = center_w, scale_w = scale_w, within = within)
  
  ind_var<-colnames(data)[!colnames(data) %in% within]
  
  btwn_label<-paste("btwn",ind_var,sep="_")
  
  data_centered$temp<-mean(data[[ind_var]],na.rm=TRUE)
  
  colnames(data_centered)[grep("temp", colnames(data_centered))]<-btwn_label
  
  data_centered<-data_centered[,!colnames(data_centered) %in% colnames(data)]
  
  if (combine == TRUE) {
    
    data_centered<-cbind(data,data_centered)
    
  } else {
  
    data_centered <- data_centered
    
  } 
  
  return(data_centered)
  
}