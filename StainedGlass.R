

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
ggplot(data=df, aes(x=long,y=lat)) +
  #Plot the voronoi lines
  geom_segment(
    aes(x = x1, y = y1, xend = x2, yend = y2),
    size = 2,
    data = voronoi$dirsgs,
    linetype = 1,
    color= "#FFB958") + 
  #Plot the points
  geom_point(
    fill=rgb(70,130,180,255,maxColorValue=255),
    pch=21,
    size = 4,
    color="#333333") +
  #(Optional) Specify a theme to use
  ltd_theme
#Now we can make a plot
ggplot(data=df, aes(x=long,y=lat)) +
  #Plot the voronoi lines
  geom_segment(
    aes(x = x1, y = y1, xend = x2, yend = y2),
    size = 2,
    data = voronoi$dirsgs,
    linetype = 1,
    color= "#FFB958") + 
  #Plot the points
  geom_point(
    fill=rgb(70,130,180,255,maxColorValue=255),
    pch=21,
    size = 4,
    color="#333333")
lat
long
?deldir
deldir(df$long, df$lat, plot.it=T)
deldir(df$long, df$lat, plotit=T)
long<-rnorm(40,-98,15)
lat<-rnorm(40,39,10)
deldir(df$long, df$lat, plotit=T)
df<-data.frame(lat,long)
deldir(df$long, df$lat, plotit=T)
deldir(df$long, df$lat)
deldir(df$long, df$lat)->vor
df->df40
long<-rnorm(20,-98,15)
lat<-rnorm(20,39,10)
df <- df20 <- data.frame(lat,long)
deldir(df$long, df$lat, plotit=T)
df



readLines("WPI_Data_20170224.txt")->dat.orig->dat
dat[-seq(1,length(dat),2)]->dat

gsub("^\\|\\s*","",dat)->dat
gsub("\\s*\\|$","",dat)->dat
gsub("\\s*\\|\\s*",",",dat)->dat

writeLines(dat,con="WPI_data_tmp.txt")
read.csv("WPI_data_tmp.txt",header=T)->dat

colnames(dat)[5:10]<-c("latdeg","latmin","latdir","londeg","lonmin","londir")

read.csv(file="WPI_data.txt",header=T)

dt<-data.table(dat)
dt[latdir!=""]->dt
summary(dt)

dt[,latlon:=paste(latdeg,latmin,latdir,londeg,lonmin,londir)]
setkey(dt,latlon)


dt[latdir=="N",lat:=(latdeg+latmin/60)]
dt[latdir=="S",lat:=-(latdeg+latmin/60)]

dt[londir=="E",lon:=(londeg+lonmin/60)]
dt[londir=="W",lon:=-(londeg+lonmin/60)]
setkey(dt,lon,lat)

library(deldir)
deldir(dt$lon, dt$lat, plotit=T)
deldir(dt$lon, dt$lat)->voronoi

ggplot(data=dt, aes(x=lon,y=lat)) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), size = 2, data = voronoi$dirsgs, linetype = 1, color= "#FFB958") + 
	geom_point(fill=rgb(70,130,180,255,maxColorValue=255), pch=21, size = 4, color="#333333")

ggplot(data=dt, aes(x=lon,y=lat)) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$delsgs, linetype = 1) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$dirsgs, linetype = 1) + theme_bw() + geom_point(color="red", pch=21)
ggplot(data=dt, aes(x=lon,y=lat)) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$delsgs, linetype = 1) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$dirsgs, linetype = 2) + theme_bw() + geom_point(color="red", pch=21)
ggplot(data=dt, aes(x=lon,y=lat)) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$delsgs, linetype = 1) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$dirsgs, linetype = 2) + theme_bw() + geom_point()
ggplot(data=dt, aes(x=lon,y=lat)) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$delsgs, linetype = 1) + geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2), data = voronoi$dirsgs, linetype = 2) + theme_bw() ->p
p

install.packages("mgcv")
install.packages("ggforce")
install.packages("animation")
install.packages("tweenr")

getOption("repos")
options("repos")
str(options$repos)
c(options$repos,"https://mran.microsoft.com")
install.packages("tweenr",repos="https://mran.microsoft.com/package")
install.packages("https://mran.microsoft.com/package/tweenr",repos=NULL)

if (!require(devtools)) {
    install.packages('devtools')
}
devtools::install_github('thomasp85/ggforce')
devtools::install_github('thomasp85/tweenr')
install.packages("Rcpp")
install.packages("Rtools")
install.packages("http://cran.r-project.org/bin/windows/Rtools/")
install.packages("http://cran.r-project.org/bin/windows/Rtools")

write.csv(dt,row.names=F,file="WPI_data.txt",quote=F)
read.csv(file="WPI_data.txt",header=T)

history(max.show=Inf)

