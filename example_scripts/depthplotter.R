#script to plot coverage across a chromosome, first argument expects the chromosome name and the second argument expects the chromosome length

#load libraries (must be installed)
library(ggplot2)
library(gridExtra)
library(viridis)

#set up to accept command line arguments
args = commandArgs(trailingOnly=TRUE)

#read in samtools depth output of the chromosome across different simulated coverage levels 
depth3 <- read.delim(paste("0.2X_raw.markdup.depth.chr/", args[1], sep = ""), header=F, stringsAsFactors = F)
depth6 <- read.delim(paste("0.4X_raw.markdup.depth.chr/", args[1], sep = ""), header=F, stringsAsFactors = F)
depth12 <- read.delim(paste("0.8X_raw.markdup.depth.chr/", args[1], sep = ""), header=F, stringsAsFactors = F)
depth24 <- read.delim(paste("1.6X_raw.markdup.depth.chr/", args[1], sep = ""), header=F, stringsAsFactors = F)

#make .png file
png(paste(args[1], ".png", sep = ""))

#plot smoothed line of depth across the length of the chromosome
ggplot(depth3, aes(x=V2, y=V3)) + geom_smooth(col=viridis(4)[1], size=2) +
  geom_smooth(data=depth6, aes(x=V2, y=V3), col=viridis(4)[2], size=2) +
  geom_smooth(data=depth12, aes(x=V2, y=V3), col=viridis(4)[3], size=2) +
  geom_smooth(data=depth24, aes(x=V2, y=V3), col=viridis(4)[4], size=2) +
  coord_cartesian(xlim=c(1,as.numeric(args[2])), ylim=c(0,2), expand = T) + theme_void() + theme(panel.grid.major.y = element_line())

dev.off()