setwd("~/Downloads")
library(tidyverse)
library(DT)
library(directlabels)


df<- read.csv("athlete.csv")
df %>% ggplot(aes(Sport,Earnings))+
  geom_boxplot()+
  coord_flip()+
  theme_classic()+
  labs(y="Earnings in Million",
       x="Sport")+
  facet_wrap(~Year)

View(df)
df %>% filter(Name %in% c("Michael Jordan","Magic Johnson","Tiger Woods")) %>% 
  ggplot(aes(as.character(Year),Earnings, group=Name,color=Name))+
  geom_point(shape=8)+
  geom_line()


df %>% filter(Sport %in% c("Soccer")) %>% 
  ggplot(aes(as.character(Year),Earnings, group=Name,color=Name))+
  geom_point(shape=8)+
  geom_line()+
  theme(legend.position="none")

df %>% filter(Sport == "Soccer") %>% 
  arrange(desc(Earnings)) %>% 
  arrange(desc(Year)) %>% 
  ggplot(aes(Name,Earnings),color=Sport)+
  geom_bar(stat = "identity")+
  coord_flip()

str(df)
df %>% filter(Name %in% c("Cristiano Ronaldo","Lionel Messi","Neymar")) %>% 
  ggplot(aes(as.character(Year),Earnings, group=Name,color=Name))+
  geom_line(lwd=1)+
  theme_classic()+
  theme(axis.text.x = element_text(angle = 90))+
  geom_dl(aes(label=Name,color=Name),method=list("last.qp",cex=.75, hjust = 1, vjust = 1))+
  theme(legend.position = "none")
  


df %>% filter(Sport %in% c("Soccer","Tennis","Golf","Auto Racing")) %>% 
  ggplot(aes(Name,Earnings))+
  geom_boxplot()+
  coord_flip()+
  theme_classic()+
  facet_wrap(~Sport, scales = "free_y")
 