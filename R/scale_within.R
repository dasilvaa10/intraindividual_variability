scale_within<-function(data,vars=NULL, scale_w=TRUE, center_w=TRUE, within = NULL,combine=TRUE, means = FALSE){
  
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
  
  means_out<-list()
  
  for (i in 1:length(split_data)){
    
    means_out_sub<-list()
    
    col_means<-colMeans(split_data[[i]][,-within_ind], na.rm=TRUE)
    
    for (j in 1:length(col_means)){
      
      means_out_sub[[j]]<-as.numeric(rep(col_means[j],nrow(split_data[[i]])))
      
    }
    
    temp_means<-do.call("cbind",means_out_sub)
    
    colnames(temp_means)<-names(col_means)
    
    colnames(temp_means) <- paste("btwn",colnames(temp_means),sep="_")
    
    means_out[[i]]<-temp_means
    
    split_data[[i]][,-within_ind] <-scale(split_data[[i]][,-within_ind], center = center_w, scale = scale_w)
    
    scaled_out[[i]]<- split_data[[i]]
    
  }
  
  means_return<-do.call("rbind", means_out )
  
  scale_return<-do.call("rbind", scaled_out)
  
  scale_return<-scale_return[ , !colnames(scale_return) %in% within]
  
  colnames(scale_return) <- paste("scaled_within",colnames(scale_return),sep="_")
  
  if (combine == TRUE){
    
    scale_return<-cbind(data,scale_return)
    
  } else {
    
    scale_return <- scale_return
    
  }
  
  if (means == TRUE){
    
    scale_return<-list(scale_return, means_return)
    
    names(scale_return) <-c("data","btwnSub_effects")
    
  }
  
  return(scale_return)
  
}

