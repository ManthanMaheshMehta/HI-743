install.packages("tidyverse")
library(tidyverse)
install.packages("NHANES")
library(NHANES)
health.data=NHANES
View(health.data)


##dplyr usage
##Select
health.data = health.data %>% select(Age,Gender,BMI,BPSysAve,TotChol)

##Filter
health.data = health.data %>% filter(Age >50,BMI > 18.5)

##Mutate
health.data=health.data %>% mutate(BMI_Category=ifelse(BMI>25,"Overweight","Normal)


gender_summary=health.data %>%  group_by(Gender) %>% summarise(avg_BMI=mean(BMI,na.rm=T))

#missing values
sum(is.na(health.data))
colSums(is.na(health.data))

health.data_no.missing=health.data %>% drop_na()


##cardinality
sapply(health.data,function(x) length(unique(x)))

##ggplot2
ggplot(health.data,aes(x=BMI))+
geom_histogram(binwidth=2,fill="blue",color="black")+
labs(title="BMI Distribution",x="BMI",y="Count")

