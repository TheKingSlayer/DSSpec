complete <-function(directory,id=1:332)
{
	currwd<-getwd();
	setwd("../");
	setwd(directory);
	
	id_vector<-numeric();
	nob_vector<-numeric();
	
	for(i in id)
	{
		if(i>0 && i< 10)
		{
			filename<-paste(c("00",i,".csv"),collapse="");
		}
		else if(i>=10 && i<100)
		{
			filename<-paste(c("0",i,".csv"),collapse="");
		}
		else
		{
			filename<-paste(c(i,".csv"),collapse="");
		}
		
		
		inputdata <-read.csv(file=filename,header=TRUE,sep=",");
		
		
		nitrates <- inputdata[["nitrate"]];
		sulfates <- inputdata[["sulfate"]];
		
		
		multiplication<-nitrates*sulfates;
		
		
		total<-length(multiplication[!is.na(multiplication)]);
		
		id_vector<-c(id_vector,i);
		nob_vector<-c(nob_vector,total);	
	}
	setwd(currwd);
	df<-data.frame(id_vector,nob_vector);
}