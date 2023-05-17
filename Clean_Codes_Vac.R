library(MASS)
require(foreign)
require(ggplot2)
require(maptools)
library(tidyverse)
library(betareg)
library(car)
library(gapminder)
library(dplyr)
library(ggplot2)
library(dplyr)
library(patchwork) # To display 2 charts together
library(hrbrthemes)
library(psych) # for descriptive analysis
library(forecast)
library(lmtest)
library(tseries)


##Descriptive
##WORLD SUMMARY

#2022 CFR
setwd('E:\\MP')
Mpox <- read.csv("Mpox.csv")

Mpox <- subset(Mpox, Mpox$date == "12/1/2022") 

#Remove World and International information
Mpox_eu <-Mpox[(Mpox$continent == "Europe"),]

plt1 <- ggplot(Mpox_eu) +
  geom_col(aes(total_cases_per_million, reorder(location, total_cases_per_million)),width = 0.6, fill="seagreen4") +
  xlab("Total number of Monkeypox cases per million") + ylab("Europe")

plt1



#Remove World and International information
Mpox_ao <-Mpox[(Mpox$continent == "Asia"| Mpox$continent == "Oceania"),]

plt2 <- ggplot(Mpox_ao) +
  geom_col(aes(total_cases_per_million, reorder(location, total_cases_per_million)),width = 0.6, fill="maroon1") +
  xlab("Total number of Monkeypox cases per million") + ylab("Asia and Oceania")

plt2




#Remove World and International information
Mpox_nsa <-Mpox[(Mpox$continent == "North America"| Mpox$continent == "South America"),]

plt3 <- ggplot(Mpox_nsa) +
  geom_col(aes(total_cases_per_million, reorder(location, total_cases_per_million)),width = 0.6, fill="coral4") +
  xlab("Total number of Monkeypox cases per million") + ylab("North and South America")

plt3


#Remove World and International information
Mpox_a <-Mpox[(Mpox$continent == "Africa"),]

plt4 <- ggplot(Mpox_a) +
  geom_col(aes(total_cases_per_million, reorder(location, total_cases_per_million)),width = 0.6, fill="steelblue") +
  xlab("Total number of Monkeypox cases per million") + ylab("Africa")

plt4




tiff("cont1.tiff", units="in", width=12, height=12, res=300)
gridExtra::grid.arrange(plt1)
dev.off()

tiff("cont2.tiff", units="in", width=12, height=12, res=300)
gridExtra::grid.arrange(plt2)
dev.off()

tiff("cont3.tiff", units="in", width=12, height=12, res=300)
gridExtra::grid.arrange(plt3)
dev.off()

tiff("cont4.tiff", units="in", width=12, height=12, res=300)
gridExtra::grid.arrange(plt4)
dev.off()

