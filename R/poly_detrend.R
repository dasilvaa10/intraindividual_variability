poly_detrend<-function(dat, vars = NULL, poly = NULL, time  = NULL){
  
  vars_check <- vars %in% colnames(dat)
  
  time_check <- time %in% colnames(dat)
  
  if (FALSE %in% vars_check == TRUE | FALSE %in% time_check == TRUE ){
    
    stop("Make sure you've specifed the name of your 'time' variable and variables to detrend correctly!")
    
  }
  
  
  if (is.null(vars) == TRUE){
    
    stop("Please specify variable(s) to detrend!")
    
  }
  
  if (is.null(time) == TRUE){
    
    stop("Please specify a temporal variable!")
    
  }
  
  if (is.null(poly) == FALSE){
    
    if (poly == 1){
    
      stop("Specify a polynomial > 1, linear trend removal occurs by default")
      
    }  
    
  }
  
  resids_out<-list()
  
  linear_coefs<-list()
  
  if (is.null(poly) == TRUE ){
    
    for (i in 1:length(vars)){
      
      m<-lm(dat[,vars[i]] ~ dat[,time] , data = dat)
      
      linear_coefs[[i]]<- summary(m)$coefficients[,4][-1]
      
      resids_out[[i]] <- residuals(m)
      
    }
    
  } else if (poly == 2){
    
    dat$quad<-dat[,time]^2
 
    for (i in 1:length(vars)){
      
      m<-lm(dat[,vars[i]] ~ dat[,time]+dat$quad , data = dat)
      
      linear_coefs[[i]]<- summary(m)$coefficients[,4][-1]
      
      resids_out[[i]] <- residuals(m)
      
    }   

  } else {
    
    poly_list<-list()
    
    for (i in 1:(poly-1)){
      
      poly_term<-i+1
      
      poly_list[[i]]<-dat[,time]^poly_term
      
    }
    
    poly_dat<-do.call("cbind", poly_list)
    
    poly_names<-paste("polynomial",2:poly_term,sep="")
    
    colnames(poly_dat)<-poly_names
    
    dat_combined<-cbind(dat,poly_dat)
    
    temp<-paste(poly_names,collapse = "+")
    
    temp<-paste(time,temp, sep = "+")
    
    for (i in 1:length(vars)){
      
      m<-lm(as.formula(paste(vars[i],"~",temp,sep = "")), data = dat_combined  )

      linear_coefs[[i]]<- summary(m)$coefficients[,4][-1]
      
      resids_out[[i]] <- residuals(m)
      
    }   
    
  }

  resids_df<-do.call("cbind", resids_out)
  
  coefs_df<-do.call("rbind", linear_coefs)
  
  colnames(resids_df)<-paste(vars, "_resids", sep = "")
  
  if (anyNA(dat) == TRUE){
    
    message("your dataset contained missing values so the residuals returned may not match the dimensions of your original data")
    
  }
  
  dat_out<-list(resids_df,coefs_df)
  
  return(dat_out)
    
}