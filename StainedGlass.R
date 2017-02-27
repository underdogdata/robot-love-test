##### Example from the web
#Let's generate some fake data
set.seed(105)
long<-rnorm(20,-98,15)
lat<-rnorm(20,39,10)
df <- data.frame(lat,long)
 
library(deldir)
library(ggplot2)
 
#This creates the voronoi line segments
voronoi <- deldir(df$long, df$lat)
 
#Now we can make a plot
ggplot(data=df, aes(x=long,y=lat)) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), size = 2, data = voronoi$dirsgs, linetype = 1, color= "#FFB958") + 
	geom_point(fill=rgb(70,130,180,255,maxColorValue=255), pch=21,  size = 4, color="#333333")
### OR, quick and dirty
deldir(df$long, df$lat, plotit=T)


### Using my data

library(deldir)
library(ggplot2)
library(data.table)

# ### Data cleaning onoriginal data, not here
# readLines("WPI_Data_orig.txt")->dat.orig->dat
# dat[-seq(1,length(dat),2)]->dat
# gsub("^\\|\\s*","",dat)->dat
# gsub("\\s*\\|$","",dat)->dat
# gsub("\\s*\\|\\s*",",",dat)->dat
# writeLines(dat,con="wpi_data_clean.txt")

read.csv("wpi_data_clean",header=T)->dat
dt[latdir!=""]->dt	# remove empty row
colnames(dat)[5:10]<-c("latdeg","latmin","latdir","londeg","lonmin","londir")

dt<-data.table(dat)
summary(dt)

dt[,latlon:=paste(latdeg,latmin,latdir,londeg,lonmin,londir)]

dt[latdir=="N",lat:=(latdeg+latmin/60)]
dt[latdir=="S",lat:=-(latdeg+latmin/60)]

dt[londir=="E",lon:=(londeg+lonmin/60)]
dt[londir=="W",lon:=-(londeg+lonmin/60)]

setkey(dt,lon,lat)
write.csv(dt,row.names=F,file="wpi_data_clean.txt",quote=F)
# read.csv("wpi_data_clean",header=T)->dat

deldir(dt$lon, dt$lat, plotit=T)
deldir(dt$lon, dt$lat)->voronoi

ggplot(data=dt, aes(x=lon,y=lat)) + theme_bw() ->p
### Delauny graph
p + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$delsgs, linetype = 1) 
### Voronoi cells
p + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$dirsgs, linetype = 2)

#### Making "stained glass"
# install.packages("mgcv")
# install.packages("ggforce")
# install.packages("animation")
# install.packages("tweenr")

