#get the first line of the whole dataset
headname<-readLines('household_power_consumption.txt',n=1)
#get a list of headname
headnamesep<-strsplit(headname,split=';')
#get only two-days dataset 
subdata<-read.table('household_power_consumption.txt',skip = 66637,stringsAsFactors = F,na.strings = "?",nrows = 2880,header=F,sep=";")
#add the headname to subdata
names(subdata)<-headnamesep[[1]]
# convert to time type
x<-paste(subdata$Date,subdata$Time)
subdata$Time<-strptime(x,"%d/%m/%Y %H:%M:%S")
subdata$Date<-as.Date(subdata$Date,'%d/%m/%Y')
# creat the plot1.png
png('plot1.png',width=480,height=480)
hist(subdata$Global_active_power,col='red',xlab='Global Active Power(kilowatts)',main='Global Active Power')
dev.off()