within_scale<-function(data,vars=NULL, scale_w=TRUE, center_w=TRUE, within = NULL,combine=TRUE){
  
  if (is.null(within) == TRUE | within %in% colnames(data) == FALSE){
    
    stop("make sure you've specified your within subjects factor correctly")
    
  }
  
  if (is.null(vars) == TRUE){
    
    split_data<-data
    
  } else {
    
    split_data<-data[,c(within,vars)]
    
  }
  
  within_ind<-grep(within,colnames(data))
  
  non_int<-as.logical(sapply(split_data,is.numeric))
  
  if (length(which(non_int == FALSE)) > 1){
    
    stop("make sure the only non-numeric data is the within subjects variable")
    
  }
  
  split_data<-split.data.frame(split_data,split_data[,within])
  
  scaled_out<-list()
  
  for (i in 1:length(split_data)){
    
    split_data[[i]][,-within_ind] <-scale(split_data[[i]][,-within_ind], center = center_w, scale = scale_w)
    
    scaled_out[[i]]<- split_data[[i]]
    
  }
  
  scale_return<-do.call("rbind", scaled_out)
  
  scale_return<-scale_return[ , !colnames(scale_return) %in% within]
  
  colnames(scale_return) <- paste("scaled_within",colnames(scale_return),sep="_")
  
  if (combine == TRUE){
    
    scale_return<-cbind(data,scale_return)
    
  } else {
    
    scale_return <- scale_return
    
  }
  
  return(scale_return)
  
}

