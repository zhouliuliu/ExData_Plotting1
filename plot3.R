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
# creat the plot3.png
png('plot3.png',width=480,height=480)
plot(x=subdata$Time,y=subdata$Sub_metering_1,xlab='',ylab='Engery sub metering',type='n')
points(x=subdata$Time,y=subdata$Sub_metering_1,type='l')
points(x=subdata$Time,y=subdata$Sub_metering_1,type='l')
points(x=subdata$Time,y=subdata$Sub_metering_2,type='l',col='red')
points(x=subdata$Time,y=subdata$Sub_metering_3,type='l',col='blue')
legend('topright',pch='____',col=c('black','red',"blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
