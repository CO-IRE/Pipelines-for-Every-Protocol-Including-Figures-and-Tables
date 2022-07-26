
library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)

require(plyr)
#install.packages("dostats")
require(dostats)
require(dplyr)
library(dplyr)

require("kableExtra")
library(dplyr)
library(knitr)
library(kableExtra)
library(magrittr)
#webshot::install_phantomjs()

require("ggplot2")
library("magick")

require("kableExtra")

#install.packages("png")             # Install png package
library("png")
#install.packages("grid")
library("grid")
library("cowplot")

require(magrittr)
require(DiagrammeR)
require(DiagrammeRsvg)
require(xml2)

RS2143CNV <- read.csv("RS2143_.csv")


files <- list.files(pattern = ".csv")

for (i in seq_along(files)) {
  
name <- files[i]
Family <- sub("_.*", "", name)
assign(paste("RS2143CNV"), read.csv(files[i]))
  
#Not in file so doing manually
#RS2143CNV <- RS1459C_HA_MO

RS2143CNV_After_ID_Filter <- RS2143CNV #[RS2143CNV$sample_ID == "RS-2143_CHO-DA",]
RS2143CNV_After_Stat_Filter <- RS2143CNV_After_ID_Filter[RS2143CNV_After_ID_Filter$BF >20 ,]

#Just want blank CONRAD? Yes

RS2143CNV_After_CONRAD_Filter <- RS2143CNV_After_Stat_Filter[is.na(RS2143CNV_After_Stat_Filter$Conrad.hg19) ,]

RS2143CNV_After_Homozygous_Deletion <- RS2143CNV_After_CONRAD_Filter[RS2143CNV_After_CONRAD_Filter$reads.ratio < 0.3,]

RS2143CNV_After_Homozygous_Duplication <- RS2143CNV_After_CONRAD_Filter[RS2143CNV_After_CONRAD_Filter$reads.ratio > 1.7,]


##CNV tables STANDARD
#**********

#May have to change some column names here and ID from time to time

RS2143CNV_After_Homozygous_Deletion$Gene <- sub("_.*", "", RS2143CNV_After_Homozygous_Deletion$exons.hg19)  

RS2143CNV_After_Homozygous_Deletion$No.Exons_Removed <- lengths(regmatches(RS2143CNV_After_Homozygous_Deletion$exons.hg19, gregexpr("_", RS2143CNV_After_Homozygous_Deletion$exons.hg19)))


if('CNV_chromosome' %in% colnames(RS2143CNV))
  
{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Deletion, CNV_chromosome, CNV_start, CNV_end, reads.ratio, BF, Gene, No.Exons_Removed )
  
}

else{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Deletion, chromosome, start, end, reads.ratio, BF, Gene, No.Exons_Removed )
  
}

row.names(dt4) <- NULL

colnames(dt4)[colnames(dt4) == 'chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'CNV_chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'cNV_start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'CNV_end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'reads.ratio'] <- 'Reads Ratio'
colnames(dt4)[colnames(dt4) == 'BF'] <- 'Bayes Factor'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Removed'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Added'

#RS2143CNV_After_Homozygous_Deletion$OMIM_gene_name
#AAChange.refGene,
#colnames(dt4)[colnames(dt4) == 'ï..Chr'] <- 'Chr'

#dt4$CADD_phred <- round(as.numeric(dt4$CADD_phred) ,2)

#dt4$CADD_phred[is.na(dt4$CADD_phred)] <- "."

library(dplyr)

require("kableExtra")
if(nrow(dt4) >0)
  
{
  

dt4 %>%
  kbl(caption = paste(Family, " " ,"Homozygous Deletions (Standard)")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  column_spec(6, italic = T) %>%
  #  column_spec(9, italic = T) %>%
    save_kable(file = paste("table_4S" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

}

#2)



RS2143CNV_After_Homozygous_Duplication$Gene <- sub("_.*", "", RS2143CNV_After_Homozygous_Duplication$exons.hg19)  

RS2143CNV_After_Homozygous_Duplication$No.Exons_Added <- lengths(regmatches(RS2143CNV_After_Homozygous_Duplication$exons.hg19, gregexpr("_", RS2143CNV_After_Homozygous_Duplication$exons.hg19)))

if('CNV_chromosome' %in% colnames(RS2143CNV))
  
{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Duplication, CNV_chromosome, CNV_start, CNV_end, reads.ratio, BF, Gene, No.Exons_Added )
  
}

else{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Duplication, chromosome, start, end, reads.ratio, BF, Gene, No.Exons_Added )
  
}

row.names(dt4) <- NULL

colnames(dt4)[colnames(dt4) == 'chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'CNV_chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'cNV_start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'CNV_end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'reads.ratio'] <- 'Reads Ratio'
colnames(dt4)[colnames(dt4) == 'BF'] <- 'Bayes Factor'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Removed'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Added'

#RS2143CNV_After_Homozygous_Deletion$OMIM_gene_name
#AAChange.refGene,
#colnames(dt4)[colnames(dt4) == 'ï..Chr'] <- 'Chr'

#dt4$CADD_phred <- round(as.numeric(dt4$CADD_phred) ,2)

#dt4$CADD_phred[is.na(dt4$CADD_phred)] <- "."

library(dplyr)

require("kableExtra")

if(nrow(dt4) >0)
  
{
  
dt4 %>%
  kbl(caption = paste(Family, " " ,"Homozygous Duplications (Standard)")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  column_spec(6, italic = T) %>%
  #  column_spec(9, italic = T) %>%
  save_kable(file = paste("table_5S" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

#0 Outcome


}
#####

#CNV flowchart - better than triangle.

library(DiagrammeR)

graph <- grViz(gsub("RS-1459", Family, gsub("42 ", nrow(RS2143CNV_After_Stat_Filter), gsub("69 ", nrow(RS2143CNV_After_CONRAD_Filter), gsub("23 ", nrow(RS2143CNV_After_Homozygous_Deletion), gsub("24", nrow(RS2143CNV_After_Homozygous_Duplication), gsub("19,333", nrow(RS2143CNV_After_ID_Filter), "digraph flowchart {
      # node definitions with substituted label text
      node [fontname = Helvetica, shape = rectangle]        
      tab1 [label = '@@1']
      tab2 [label = '@@2']
      tab3 [label = '@@3']
      tab4 [label = '@@4']
      tab5 [label = '@@5']
   
      
     
      tab1 -> tab2;
      tab2 -> tab3;
      tab3 -> tab4;
      tab3 -> tab5;
     
      
      
 }

      [1]: 'Original Number of Structural Variants RS-1459, N = 19,333'
      [2]: 'After Filtering for BF >20, N = 42 '
      [3]: 'After Filtering for Blank CONRAD.hg19, N = 69 '
      [4]: 'After Filtering for read ratio < 0.3 (homozygous deletion), N= 23 '
      [5]: 'After Filtering for read ratio > 1.7 (homozygous duplication), N = 24'
    
      
      
      ")))))))


graph %>%
  export_svg() %>%
  read_xml() %>%
  write_xml(paste(Family, "FlowChartStandard", ".svg"))       


#Filter for mode of inheritance
#Make triangle, and add steps to filtering criteria list.
#Make table of variants
#Ask about filtering top genes one - frequency mentioned?

#RS2143CNV <- ALL_OMIM

#Less stringent Version

RS2143CNV_After_ID_Filter <- RS2143CNV #[RS2143CNV$sample_ID == "RS-2143_CHO-DA",]
RS2143CNV_After_Stat_Filter <- RS2143CNV_After_ID_Filter[RS2143CNV_After_ID_Filter$BF >10 ,]

#Just want blank CONRAD? Yes

RS2143CNV_After_CONRAD_Filter <- RS2143CNV_After_Stat_Filter[is.na(RS2143CNV_After_Stat_Filter$Conrad.hg19),]

RS2143CNV_After_Homozygous_Deletion <- RS2143CNV_After_CONRAD_Filter[RS2143CNV_After_CONRAD_Filter$reads.ratio < 0.3,]

RS2143CNV_After_Homozygous_Duplication <- RS2143CNV_After_CONRAD_Filter[RS2143CNV_After_CONRAD_Filter$reads.ratio > 1.7,]









##CNV tables LESS STRINGENT 
#**********

#May have to change some column names here and ID from time to time

RS2143CNV_After_Homozygous_Deletion$Gene <- sub("_.*", "", RS2143CNV_After_Homozygous_Deletion$exons.hg19)  

RS2143CNV_After_Homozygous_Deletion$No.Exons_Removed <- lengths(regmatches(RS2143CNV_After_Homozygous_Deletion$exons.hg19, gregexpr("_", RS2143CNV_After_Homozygous_Deletion$exons.hg19)))


if('CNV_chromosome' %in% colnames(RS2143CNV))
  
{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Deletion, CNV_chromosome, CNV_start, CNV_end, reads.ratio, BF, Gene, No.Exons_Removed)
  
}

else{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Deletion, chromosome, start, end, reads.ratio, BF, Gene, No.Exons_Removed )
  
}
row.names(dt4) <- NULL

colnames(dt4)[colnames(dt4) == 'chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'CNV_chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'cNV_start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'CNV_end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'reads.ratio'] <- 'Reads Ratio'
colnames(dt4)[colnames(dt4) == 'BF'] <- 'Bayes Factor'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Removed'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Added'

#RS2143CNV_After_Homozygous_Deletion$OMIM_gene_name
#AAChange.refGene,
#colnames(dt4)[colnames(dt4) == 'ï..Chr'] <- 'Chr'

#dt4$CADD_phred <- round(as.numeric(dt4$CADD_phred) ,2)

#dt4$CADD_phred[is.na(dt4$CADD_phred)] <- "."

library(dplyr)

require("kableExtra")
if(nrow(dt4) >0)
  
{
  
dt4 %>%
  kbl(caption = paste(Family, " " ,"Homozygous Deletions (Less Stringent)")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  column_spec(6, italic = T) %>%
  #  column_spec(9, italic = T) %>%
  save_kable(file = paste("table_4LS" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)


}
#2)



RS2143CNV_After_Homozygous_Duplication$Gene <- sub("_.*", "", RS2143CNV_After_Homozygous_Duplication$exons.hg19)  

RS2143CNV_After_Homozygous_Duplication$No.Exons_Added <- lengths(regmatches(RS2143CNV_After_Homozygous_Duplication$exons.hg19, gregexpr("_", RS2143CNV_After_Homozygous_Duplication$exons.hg19)))

if('CNV_chromosome' %in% colnames(RS2143CNV))
  
{
  
  dt4 <- select(RS2143CNV_After_Homozygous_Duplication, CNV_chromosome, CNV_start, CNV_end, reads.ratio, BF, Gene, No.Exons_Added )
  
}

else{
  
dt4 <- select(RS2143CNV_After_Homozygous_Duplication, chromosome, start, end, reads.ratio, BF, Gene, No.Exons_Added )



}
row.names(dt4) <- NULL

colnames(dt4)[colnames(dt4) == 'chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'CNV_chromosome'] <- 'Chr'
colnames(dt4)[colnames(dt4) == 'start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'cNV_start'] <- 'Start'
colnames(dt4)[colnames(dt4) == 'CNV_end'] <- 'End'
colnames(dt4)[colnames(dt4) == 'reads.ratio'] <- 'Reads Ratio'
colnames(dt4)[colnames(dt4) == 'BF'] <- 'Bayes Factor'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Removed'
colnames(dt4)[colnames(dt4) == 'No.Exons_Removed'] <- 'Exons Added'

#RS2143CNV_After_Homozygous_Deletion$OMIM_gene_name
#AAChange.refGene,
#colnames(dt4)[colnames(dt4) == 'ï..Chr'] <- 'Chr'

#dt4$CADD_phred <- round(as.numeric(dt4$CADD_phred) ,2)

#dt4$CADD_phred[is.na(dt4$CADD_phred)] <- "."

library(dplyr)

require("kableExtra")
if(nrow(dt4) >0)
  
{
  
dt4 %>%
  kbl(caption = paste(Family, " " ,"Homozygous Duplications (Less Stringent)")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  column_spec(6, italic = T) %>%
  #  column_spec(9, italic = T) %>%
  save_kable(file = paste("table_5LS" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)



}
#CNV flowchart - better than triangle.

library(DiagrammeR)

graph <- grViz(gsub("RS-1459", Family, gsub("42 ", nrow(RS2143CNV_After_Stat_Filter), gsub("69 ", nrow(RS2143CNV_After_CONRAD_Filter), gsub("23 ", nrow(RS2143CNV_After_Homozygous_Deletion), gsub("24", nrow(RS2143CNV_After_Homozygous_Duplication), gsub("19,333", nrow(RS2143CNV_After_ID_Filter), "digraph flowchart {
      # node definitions with substituted label text
      node [fontname = Helvetica, shape = rectangle]        
      tab1 [label = '@@1']
      tab2 [label = '@@2']
      tab3 [label = '@@3']
      tab4 [label = '@@4']
      tab5 [label = '@@5']
   
      
     
      tab1 -> tab2;
      tab2 -> tab3;
      tab3 -> tab4;
      tab3 -> tab5;
     
      
      
 }

      [1]: 'Original Number of Structural Variants RS-1459, N = 19,333'
      [2]: 'After Filtering for BF >10, N = 42 '
      [3]: 'After Filtering for Blank CONRAD.hg19, N = 69 '
      [4]: 'After Filtering for read ratio < 0.3 (homozygous deletion), N= 23 '
      [5]: 'After Filtering for read ratio > 1.7 (homozygous duplication), N = 24'
    
      
      
      ")))))))

#FlowChartName2 <- paste(Na)

 graph %>%
  export_svg() %>%
  read_xml() %>%
  write_xml(paste(Family, "FlowChartRelaxed", ".svg"))

 #ADD FIEL
}
