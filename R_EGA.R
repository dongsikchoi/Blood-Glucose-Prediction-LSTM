library(ggplot2)
#install.packages('ega')
#library(ega)
library(ega)

df <-read.csv(file='C:/Users/user/R_EGA_DF/test_60.csv')
df$X0
options(max.print=1000000)
max = plotClarkeGrid(df$X1, df$X0)
png("test_60.png",width=4000,height=3000,res=500)
plot(max)
dev.off()
zones <- getClarkeZones(df$X1, df$X0)
zones <- getClarkeZones(df$X1/18, df$X0/18, unit="mol")
zones <- factor(zones)
table(zones)/length(zones)*100
zones


