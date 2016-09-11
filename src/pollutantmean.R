pollutantmean <- function(directory, pollutant, id=1:332){
	
	#setwd(directory);
	total=0;
	totalnums=0;
	
	for(i in id)
	{
		if(i>0 && i< 10)
		{
			filename=paste(c("00",i,".csv"),collapse="");
		}
		else if(i>=10 && i<100)
		{
			filename=paste(c("0",i,".csv"),collapse="");
		}
		else
		{
			filename=paste(c(i,".csv"),collapse="");
		}
		print(filename);
		
		inputdata = read.csv(file=filename,header=TRUE,sep=",");
		
		currpollutant<-inputdata[[pollutant]];
		
		
		na_vals<-is.na(currpollutant);
		
		validvals<-currpollutant[!na_vals];
		
		finalval<-mean(validvals);
		total = total+finalval;
		totalnums = totalnums+1;
	}
	total/totalnums;

}