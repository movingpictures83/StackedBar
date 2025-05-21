# BOXPLOTS
############################################################################################
# Objective:
#   Create stacked bar ploit to visualize relative abundance

# Author: Vitalii Stebliankion (vsteb002@fiu.edu)
#   Bioinformatics Research Group (BioRG)
############################################################################################


#projectPath = "/Users/stebliankin/Desktop/GWI_2022/experiment_runs/03-26-2022-abundance/"
#setwd(projectPath)
library(ggpubr)
library(gplots)
library(viridis)
library(hrbrthemes)
library(ggsci)
dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")



input <- function(inputfile) {
##### Stacked Bar Plot Phylum Combined ########
  pfix = prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
  print(parameters)
   # Need to get the three files
   assay <<- read.table(paste(pfix, parameters["abundance", 2], sep="/"), header = TRUE, sep=',')
   levels_updated <<- readLines(paste(pfix, parameters["levels", 2], sep="/"))
   print(levels_updated)
   species <<- parameters["species", 2]
   if (species == 'true') {
	   library(RColorBrewer)
      colourCount = 20
      getPalette = colorRampPalette(brewer.pal(12, "Paired"))
   }

   cbp1 <<- readLines(paste(pfix, parameters["colors", 2], sep="/"))
}

run <- function() {}

output <- function(outputfile) {
	write.csv(assay$abundance, paste(outputfile, "csv", sep="."))
	if (species == 'true') {
gplot<-ggplot(assay, aes(fill=factor(species, levels=levels_updated), y=abundance, x=Group)) + scale_fill_manual(values=cbp1) + geom_bar(position="stack", stat="identity") 
	}
	else {
gplot<-ggplot(assay, aes(fill=factor(phylum, levels=levels_updated), y=abundance, x=Group)) + scale_fill_manual(values=cbp1) + geom_bar(position="stack", stat="identity") 
	}
gplot
ggsave(outputfile, plot=gplot, device = "png", dpi = 700)
}

