#setting the directory

setwd("C:/Users/DELL/OneDrive/Esther/HACK BIO/Stage 3")
getwd()

package:ggplot
#install ggplot

#loading ggplot2

library("ggplot2")

#read the complete 1000 genomes sample list data
remove(Metadata)
Metadata <- read.table("C:/Users/DELL/OneDrive/ESTHER/HACK BIO/complete_1000_genomes_sample_list_.tsv", sep = "\t", header = TRUE)

#display Metadata
head(Metadata)

#pca1
#read the eigenvec file
pca1 <- read.table("C:/Users/DELL/OneDrive/ESTHER/HACK BIO/plink.eigenvec", sep =" ", header = F)

#merge data from pca1 and metadata
#Because we have no headers in this file, R arbitrarily gives these a V number, so the first two column
merge_data <- merge(x= pca1, y = Metadata, by.x = "V2", by.y = "Sample.name", all = F )

#plot with ggplot
ggplot(data = merge_data, aes(V3,V4,color = Superpopulation.code)) + geom_point(size = 2.5) + scale_color_brewer(palette = "Set2") + theme_bw () + labs (title = "PCA plot")+ xlab ("pca1") + ylab("pca2")+ theme(plot.title = element_text(hjust = 0.5, face = "bold", size =30), axis.title.x = element_text(face = "italic", color = "blue", size = 14), axis.title.y = element_text(face = "italic", color = "red", size = 14))                                                                                                            