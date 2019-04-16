missing_within<-function(data,within = NULL){
  
  within_ind<-grep(within, colnames(data))
  
  split_data<-split.data.frame(data,data[,within])
  
  missing<-list()
  
  for (i in 1:length(split_data)){
    
    tot_miss<-apply(split_data[[i]][,-within_ind], 2 , function(x) sum(is.na(x)))
    
    missing[[i]]<-c(unique(split_data[[i]][,within]),tot_miss/nrow(split_data[[i]]))
    
  }
  
  missing_within<-do.call("rbind", missing)
  
  missing_within<-as.data.frame(missing_within)
  
  missing_within[,-1]<-apply(missing_within[,-1], 2, function(x) as.numeric(as.character(x)))
  
  return(missing_within)
  
}