var_check<-function(data, within = NULL){
  
  if (is.null(within) == TRUE){
    
    stop("make sure you've specified a within subjects factor")
    
  }
  
  split_data<-split.data.frame(data,data[,within])
  
  v_list<-list()
  
  for (i in 1:length(split_data)){
    
    unq_vals<-sapply(sapply(split_data[[i]],unique),length) 
    
    novar_cols<-which(as.numeric(unq_vals) == 1)
    
    novar_vars<-names(unq_vals[novar_cols]) 
    
    novar_vars<-novar_vars[! novar_vars %in% within]
    
    v_list[[i]]<-novar_vars
    
    names(v_list)[i]<-unique(split_data[[i]][,within])
    
  }
  
  return(v_list)
  
}