install.packages('installr')		#Updates R; run library(installr) then updateR()
install.packages("psych")		#Perform descriptive statistics
install.packages("tidyverse")		#For advanced figures, plots, charts
install.packages("Hmisc")		#Provides correlation matrix with significance values
install.packages("RODBC")		#Provides an ODBC interface for R

library(foreign)
library(ggplot2)

setwd("C:\\Users\\SohagMaitra\\OneDrive - Amitech Solutions, Inc\\Desktop\\using-data-ice-sohagma\\data")

workingdirectory = "C:\Users\SohagMaitra\OneDrive - Amitech Solutions, Inc\Desktop\using-data-ice-sohagma\data"
acct_dir = "C:\\Users\\SohagMaitra\\AccountingData"
mark_dir = "C:\\MarketingData"
setwd(workingdirectory)

file.exists("C:\\Users\\SohagMaitra\\OneDrive - Amitech Solutions, Inc\\Desktop\\using-data-ice-sohagma\\data\\car.test.frame.txt")

data = read.table("C:\\Users\\SohagMaitra\\OneDrive - Amitech Solutions, Inc\\Desktop\\using-data-ice-sohagma\\data\\car.test.frame.txt", header=T, sep="\t")

data

names(data)

ncol(data)	#Number of columns

nrow(data)	#Number of rows

str(data)

unique(data$Type)

unique(data$Country)

data[57,3]

data[24,]

data[29,1:3]
data[29,c(1,2,3)]
data[29,c("Price","Country","Reliability")]

data[45,c(3,7)]
data[45,c("Reliability","Disp.")]

hp.data = data[,c(1)]
names(hp.data)
edit(hp.data)

hp.data1 = data[,1]
hp.data2 = data$hp

data[data$Type=="Compact" & data$Reliability >=4,]

data[data$Type=="Compact" & data$Country=="Japan" & data$Reliability >=3,]

data[data$Country=="Japan" | data$Country=="USA",]

data[data$Country=="USA" | data$Country=="Japan",]

data[data$Country=="USA" | (data$Country=="Japan" & data$Reliability>=4),]

split.num = round(nrow(data)*.70,0)
nrow(data)
x = 1:60
data.split = data[sample(x,split.num,replace=F),]
nrow(data.split)

samp.size = nrow(data) / 8
samp.size

indices.one = sort(sample(seq_len(nrow(data)), size=samp.size))
indices.not_1 = setdiff(seq_len(nrow(data)), indices.one)
indices.two = sort(sample(indices.not_1, size=samp.size))
indices.not_12 = setdiff(indices.not_1, indices.two)
indices.three = sort(sample(indices.not_12, size=samp.size))
indices.not_123 = setdiff(indices.not_12, indices.three)
indices.four = sort(sample(indices.not_123, size=samp.size))
indices.not_1234 = setdiff(indices.not_123, indices.four)
indices.five = sort(sample(indices.not_1234, size=samp.size))
indices.not_12345 = setdiff(indices.not_1234, indices.five) 
indices.six = sort(sample(indices.not_12345, size=samp.size))
indices.not_123456 = setdiff(indices.not_12345, indices.six)
indices.seven = sort(sample(indices.not_123456, size=samp.size))
indices.eight = setdiff(indices.not_123456, indices.seven)

indices.one
indices.two
indices.three
indices.four
indices.five
indices.six
indices.seven
indices.eight

data.1 = data[indices.one,]
data.2 = data[indices.two,]
data.3 = data[indices.three,]
data.4 = data[indices.four,]
data.5 = data[indices.five,]
data.6 = data[indices.six,]
data.7 = data[indices.seven,]
data.8 = data[indices.eight,]

data.1
data.2
data.3
data.4
data.5
data.6
data.7
data.8

data[,sapply(data,is.numeric)] #Price, Reliability, Mileage, Weight, Disp. HP

num.data = data[,c(1,3,4,6,7,8)]
names(num.data)
edit(num.data)

num.data = subset(num.data,select=-c(HP, Price))
num.data

country.weight.data = data[,c("Country", "Weight")]
country.weight.data

names(country.weight.data)[1] = "Country_1"
names(country.weight.data)[2] = "Weight_2"
country.weight.data




