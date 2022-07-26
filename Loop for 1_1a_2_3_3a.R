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
#Add table with rs, clinsig and full code NM thing too for all 3.

#Family = "RS2108"

#name = "Blah"
  
#Remove and bring back for graphs
#Export don't print in loop

#`+` <- function(x, y) UseMethod("+")
#`+.character` <- function(x, y) paste0(x, y)
#`+.default` <- .Primitive("+")
#rename with _ other files to fit loop
#Output text file with numbers from nrow
#Make one for 5'UTR as well


#filelist <- list.files(pattern = ".txt")
#someVar <- lapply(filelist, function(x) { 
#  textfile <- read.table(x,  sep = '\t', fill = TRUE)
#  write.csv(textfile, 
#            file = sub(pattern = "\\.txt$", replacement = ".csv", x = x))
#})


#RS2108 <- read.csv("RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt")

#assign(paste("RS2108"), read.table("RS1719C_FA_HO.annovar.hg38_multianno.txt",fill = TRUE, sep = '\t', quote = ""))


#rm(RS2108)
files <- list.files(pattern = ".txt")

for (i in seq_along(files)) {
  
#  Family <- i
    
 # name <- list.files(pattern = ".csv")

  
 # name <- read.csv(files[i])
 # Family <-  sub("_.*", "",  name)
 
  #Rename the columns as x.
  
  name <- files[i]
  Family <- sub("_.*", "", name)
  
  #assign(paste("RS2108"), read.table(files[i],fill = TRUE, sep = '\t'))
  
  if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  {
    
    assign(paste("RS2108"), read.csv(files[i]))
    
  }
  

  else{
    
  assign(paste("RS2108"), read.table(files[i],fill = TRUE, sep = '\t', quote = ""))
  #RS2108[1, 158] = "InterproDomain.1"
  names(RS2108) <- RS2108[1,]
  RS2108 = RS2108[-1,]
  
  INDEX <- which( colnames(RS2108)=="Otherinfo"  )
  
  colnames(RS2108)[(INDEX+1)] <- "X"
  colnames(RS2108)[(INDEX+2)] <- "X.1"
  colnames(RS2108)[(INDEX+3)] <- "X.2"
  colnames(RS2108)[(INDEX+4)] <- "X.3"
  colnames(RS2108)[(INDEX+5)] <- "X.4"
  colnames(RS2108)[(INDEX+6)] <- "X.5"
  colnames(RS2108)[(INDEX+7)] <- "X.6"
  colnames(RS2108)[(INDEX+8)] <- "X.7"
  colnames(RS2108)[(INDEX+9)] <- "X.8"
  colnames(RS2108)[(INDEX+10)] <- "X.9"
  colnames(RS2108)[(INDEX+11)] <- "X.10"
  colnames(RS2108)[(INDEX+12)] <- "X.11"

 
  #RS2108 <- Y372D.annovar.hg19_multianno_No_E
 RS2108 <- RS2108[, !duplicated(colnames(RS2108))]
  #colnames(RS2108[,1:167]) <- RS2108[1,]
 
 # RS2108 = RS2108[,-169]
 # colnames(X)[2] <- "superduper"
  
  
}
    
#    RS2108[1, 168] = "X"
 #   RS2108[1, 169] = "X.1"
  #  RS2108[1, 170] = "X.2"
   # RS2108[1, 171] = "X.3"
  #  RS2108[1, 172] = "X.4"
  #  RS2108[1, 173] = "X.5"
   # RS2108[1, 174] = "X.6"
  #  RS2108[1, 175] = "X.7"
   # RS2108[1, 176] = "X.8"
  #  RS2108[1, 177] = "X.9"
   # RS2108[1, 178] = "X.10"
    #RS2108[1, 179] = "X.11"
    
  #  names(RS2108) <- RS2108[1,]
   # RS2108 = RS2108[-1,-1]
    
  
#  assign(paste("RS2108"), read.csv(files[i]))
  
  
#  RS2108 <- name
  
#  assign(paste(paste("Df", i, sep = ""), "summary", sep = "."), 
    #     ldply(get(paste("Df", i, sep = "."))))
  
 # Family <- i
  
#  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
  #                                     (RS2108$gnomAD3_exome_AFR == "." | RS2108$gnomAD3_exome_AFR < 0.01 ) &
  #                                     (RS2108$gnomAD3_exome_AMI == "." | RS2108$gnomAD3_exome_AMI < 0.01 ) &
   #                                    (RS2108$gnomAD3_exome_AMR == "." | RS2108$gnomAD3_exome_AMR < 0.01 ) &
    #                                   (RS2108$gnomAD3_exome_ASJ == "." | RS2108$gnomAD3_exome_ASJ < 0.01 ) &
     #                                  (RS2108$gnomAD3_exome_EAS == "." | RS2108$gnomAD3_exome_EAS < 0.01 ) &
      #                                 (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) &
       #                                (RS2108$gnomAD3_exome_FIN == "." | RS2108$gnomAD3_exome_FIN < 0.01 ) &
        #                               (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) &
         #                              (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) &
          #                             (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) & 
           #                            (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) &
            #                           (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) &
             #                          (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) &
              #                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) &
               #                        (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) &
                #                       (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 )  &
                 #                      (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) &
                  #                     (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) &
                   #                    (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) &
                    #                   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) &
                     #                  (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) &
                          #             (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) &
                      #                 (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 )  &
                       #                (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) &
                        #               
                         #              (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                           #            ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") &
                            #           (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) &
                             #          (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) &
                              #         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) &
                               #        (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) &
                                #       (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) &
                                 #      (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 ) &
                                  #     (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) &
                                   #    (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ),]
  
  
  #Filter for function
  #Last end is missing the other CAPN3 - hdiv lost it

 
 if('gnomAD3_exome_ALL' %in% colnames(RS2108))
   
 {
   RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
                                        ( if('gnomAD3_exome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_AFR == "." | RS2108$gnomAD3_exome_AFR < 0.01 ) } )&
                                        (  if('gnomAD3_exome_AMI' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_AMI == "." | RS2108$gnomAD3_exome_AMI < 0.01 ) } ) &
                                        (   if('gnomAD3_exome_AMR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_AMR == "." | RS2108$gnomAD3_exome_AMR < 0.01 ) } )&
                                        (  if('gnomAD3_exome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_ASJ == "." | RS2108$gnomAD3_exome_ASJ < 0.01 ) } ) &
                                        (  if('gnomAD3_exome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_EAS == "." | RS2108$gnomAD3_exome_EAS < 0.01 ) } ) &
                                        (  if('gnomAD3_exome_FEMALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                        (  if('gnomAD3_exome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_FIN == "." | RS2108$gnomAD3_exome_FIN < 0.01 ) } )&
                                        ( if('gnomAD3_exome_MALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) } ) &
                                        (   if('gnomAD3_exome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) } ) &
                                        (  if('gnomAD3_exome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) } ) & 
                                        (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       # (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                        (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                        (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                        (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                        (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                        (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                        (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                        (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                        (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                        (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                        (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                        {  
                                          #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                          ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                        (   if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                        (  if('GME_AP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                        (  if('GME_NWA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                        (  if('GME_NEA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                        (  if('GME_Israel' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                        (  if('GME_SD' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                        ( if('GME_TP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                        (  if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
   
   
   #Filte
 }
 
 if('gnomAD_exome_AMI' %in% colnames(RS2108))
   
   
   
 {
   RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                        ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                        (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                        (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                        {
                                          (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                        (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                        (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                        (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                        (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                        ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                        (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                        (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                        (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                        (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                        (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                        (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                        (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                        (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                        (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                        (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                        (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                        (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                        (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                        (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                        {  
                                          (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                            ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                        (   if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                        (  if('GME_AP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                        (  if('GME_NWA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                        (  if('GME_NEA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                        (  if('GME_Israel' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                        (  if('GME_SD' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                        ( if('GME_TP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                        (  if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
   
   
   #Filte
 }
 

 
# if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt")
 if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
   
 {
   
   library(stringr)
   library(plyr)
   
   
   #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
   
   del <- colwise(function(x) str_replace_all(x, '\"', ""))
   RS2108 <- del(RS2108)
   RS2108[RS2108=="NA"]<-"."
   
   #nchar(RS2108)=="."
   
   
   RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                        ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                        #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                        #  {  
                                        #     (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                        (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                        {
                                          (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                        (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                        (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                        #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                        #  {  
                                        #    (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                        (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                        #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                        # {  
                                        #   (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                        (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                        (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                        (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                        #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                        #  {  
                                        #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                        (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                        #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                        #   {  
                                        #    (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                        (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                        #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                        #  {  
                                        #     (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                        #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                        # {  
                                        #   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                        #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                        #  {  
                                        #    (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                        #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                        #  {  
                                      #    (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                      (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                      {  
                                        (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                        (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                            (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                           {  
                                        #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                        (   if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                        (  if('GME_AP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                        (  if('GME_NWA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                        (  if('GME_NEA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                        (  if('GME_Israel' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                        (  if('GME_SD' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                        ( if('GME_TP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                        (  if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
   
   
   #Filte
   
 }
 
 
 
 # if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt")
 if( ((! "SGUL_Exomes_Alt_Allele_Count"    %in% colnames(RS2108) )== TRUE) & ((! "info.SGUL_Exomes_Alt_Allele_Count"    %in% colnames(RS2108) )== TRUE)) 
   
 {
   
   library(stringr)
   library(plyr)
   
   
   #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
   
   del <- colwise(function(x) str_replace_all(x, '\"', ""))
   RS2108 <- del(RS2108)
   RS2108[RS2108=="NA"]<-"."
   
   #nchar(RS2108)=="."
   
   
   RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                        ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                        #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                        #  {  
                                        #     (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                        (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                        {
                                          (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                        (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                        (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                        #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                        #  {  
                                        #    (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                        (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                        #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                        # {  
                                        #   (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                        (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                        (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                        (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                        #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                        #  {  
                                        #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                        (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                        (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                        #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                        #   {  
                                        #    (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                        (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                        #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                        #  {  
                                        #     (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                        #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                        # {  
                                        #   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                        #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                        #  {  
                                        #    (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                        #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                        #  {  
                                      #    (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                      (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                      {  
                                        (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                        (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       # (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       # {  
                                          #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                       #   ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                        (   if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                        (  if('GME_AP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                        (  if('GME_NWA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                        (  if('GME_NEA' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                        (  if('GME_Israel' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                        (  if('GME_SD' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                        ( if('GME_TP' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                        (  if('GME_AF' %in% colnames(RS2108))
                                        { 
                                          (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
   
   
   #Filte
   
 }
 
 #r for function
 #Last end is missing the other CAPN3 - hdiv lost it
 
 if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
   
   
 {
   
   #  library(stringr)
   #  library(plyr)
   
   
   #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
   
   #  del <- colwise(function(x) str_replace_all(x, '\"', ""))
   #  RS2108 <- del(RS2108)
   RS2108[RS2108=="None"] <-"."
   
   #nchar(RS2108)=="."
   
   
   
   RS2108_After_F_Filters <- RS2108[  (RS2108$info.gnomAD3_exome_ALL == "." | RS2108$info.gnomAD3_exome_ALL < 0.01 ) &
                                        ( if('info.gnomAD3_exome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_AFR == "." | RS2108$info.gnomAD3_exome_AFR < 0.01 ) } ) &
                                        (  if('info.gnomAD3_exome_AMI' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_AMI == "." | RS2108$info.gnomAD3_exome_AMI < 0.01 ) } ) &
                                        (   if('info.gnomAD3_exome_AMR' %in% colnames(RS2108))
                                        {
                                          (RS2108$info.gnomAD3_exome_AMR == "." | RS2108$info.gnomAD3_exome_AMR < 0.01 ) } )&
                                        (  if('info.gnomAD3_exome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_ASJ == "." | RS2108$info.gnomAD3_exome_ASJ < 0.01 ) } ) &
                                        (  if('info.gnomAD3_exome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_EAS == "." | RS2108$info.gnomAD3_exome_EAS < 0.01 ) } ) &
                                        (  if('info.gnomAD3_exome_FEMALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_FEMALE == "." | RS2108$info.gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                        (  if('info.gnomAD3_exome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_FIN == "." | RS2108$info.gnomAD3_exome_FIN < 0.01 ) } )&
                                        ( if('info.gnomAD3_exome_MALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_MALE == "." | RS2108$info.gnomAD3_exome_MALE < 0.01 ) } ) &
                                        (   if('info.gnomAD3_exome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_OTH == "." | RS2108$info.gnomAD3_exome_OTH < 0.01 ) } ) &
                                        (  if('info.gnomAD3_exome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD3_exome_NFE == "." | RS2108$info.gnomAD3_exome_NFE < 0.01 ) } ) & 
                                        (  if('info.gnomAD_genome_ALL' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_ALL == "." | RS2108$info.gnomAD_genome_ALL < 0.01 ) } ) &
                                        (  if('info.gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_POPMAX == "." | RS2108$info.gnomAD_genome_POPMAX < 0.01 ) } ) &
                                        (   if('info.gnomAD_genome_AFR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_AFR == "." | RS2108$info.gnomAD_genome_AFR < 0.01 ) } ) &
                                        (   if('info.gnomAD_genome_AMR' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_AMR == "." | RS2108$info.gnomAD_genome_AMR < 0.01 ) } ) &
                                        (   if('info.gnomAD_genome_ASJ' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_ASJ == "." | RS2108$info.gnomAD_genome_ASJ < 0.01 ) } ) &
                                        (   if('info.gnomAD_genome_EAS' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_EAS == "." | RS2108$info.gnomAD_genome_EAS < 0.01 ) } ) &
                                        (   if('info.gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_FEMALE == "." | RS2108$info.gnomAD_genome_FEMALE < 0.01 ) } ) &
                                        (    if('info.gnomAD_genome_FIN' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_FIN == "." | RS2108$info.gnomAD_genome_FIN < 0.01 ) } ) &
                                        (     if('info.gnomAD_genome_MALE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_MALE == "." | RS2108$info.gnomAD_genome_MALE < 0.01 ) } ) &
                                        (    if('info.gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_NFE_EST == "." | RS2108$info.gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                        (    if('info.gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_NFE_NWE == "." | RS2108$info.gnomAD_genome_NFE_NWE < 0.01) } ) &
                                        (   if('info.gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_NFE_SEU == "." | RS2108$info.gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                        (    if('info.gnomAD_genome_OTH' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_OTH == "." | RS2108$info.gnomAD_genome_OTH < 0.01 ) } ) &
                                        (   if('info.gnomAD_genome_NFE' %in% colnames(RS2108))
                                        {  
                                          (RS2108$info.gnomAD_genome_NFE == "." | RS2108$info.gnomAD_genome_NFE < 0.01 ) } ) &
                                        (   if('info.SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                        {  
                                          #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                          ( as.numeric(RS2108$info.SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$info.SGUL_Exomes_Alt_Allele_Count == ".") }  ) ,]
   #  (   if('GME_AF' %in% colnames(RS2108))
   #  { 
   #   (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
   #  (  if('GME_AP' %in% colnames(RS2108))
   #  { 
   #    (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
   #  (  if('GME_NWA' %in% colnames(RS2108))
   #  { 
   #    (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
   #  (  if('GME_NEA' %in% colnames(RS2108))
   #   { 
   #     (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
   #   (  if('GME_Israel' %in% colnames(RS2108))
   #   { 
   #     (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
   #   (  if('GME_SD' %in% colnames(RS2108))
   #   { 
   #     (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
   #   ( if('GME_TP' %in% colnames(RS2108))
   #   { 
   #     (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
   #   (  if('GME_AF' %in% colnames(RS2108))
   #   { 
   #      (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) })
   
   
   
   #Filte
 }
 
 
  RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Func.refGene == "exonic" | RS2108_After_F_Filters$Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$Func.refGene == "splicing" | RS2108_After_F_Filters$Func.refGene == ".") & (RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$ExonicFunc.refGene == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]
  
  
  #Filter for mode of inheritance - in this case recessive
  
  RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$Otherinfo == 1 ,]
  #**** hetero
  #RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
  #Other miscellaneous ones
  # `%!in%` = Negate(`%in%`)
  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$X.8  == "PASS",]
  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[ !  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$Gene.refGene %in% FLAGGeneList, ]
  #  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$X.8  == "PASS" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-B" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-A" &  RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-DRB1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-DRB5" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "FCGBP" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "COL18A1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MUC4" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "SLAIN1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MAML3" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HRNR" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "LOC283710" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "SSTR1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "ZNF717" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MAGEC1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "FAM20C" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "CRIPAK",]
  
  #Write something for FLAG genes to remove - common ones - in above keep adding as more found
  
  ######
  
  #2)
   
  if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
    
    
  {
    
    RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$info.Func.refGene == "exonic" | RS2108_After_F_Filters$info.Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$info.Func.refGene == "splicing" | RS2108_After_F_Filters$info.Func.refGene == ".") & (RS2108_After_F_Filters$info.ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$info.ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$info.ExonicFunc.refGene == ".")  &  (RS2108_After_F_Filters$info.Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$info.Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$info.Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$info.SIFT_pred == "D" | RS2108_After_F_Filters$info.SIFT_pred == "."),]
    
    
    #Filter for mode of inheritance - in this case recessive
    
    RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$info.AF == 1 ,]
    #**** hetero
    #RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
    #Other miscellaneous ones
    # `%!in%` = Negate(`%in%`)
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$FT  == "",]
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[ !  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Gene.refGene %in% FLAGGeneList, ]
    #  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$X.8  == "PASS" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-B" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-A" &  RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-DRB1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-DRB5" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "FCGBP" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "COL18A1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MUC4" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "SLAIN1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MAML3" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HRNR" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "LOC283710" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "SSTR1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "ZNF717" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MAGEC1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "FAM20C" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "CRIPAK",]
    
  }
  
  

        

  
  #Second way of filtering by pathogenic or likely pathigenic in ClinSig
  if("CLNSIG" %in% colnames(RS2108))
  {
    

  RS2108_After_CLINSIG_Filters <- RS2108[RS2108$CLNSIG == "Pathogenic" | RS2108$CLNSIG == "Likely_pathogenic" ,]
  }
  #Filter just for top 3 genes - I did more mutated in Myopathy 
  if("CLINSIG" %in% colnames(RS2108))
  {
    
    
    RS2108_After_CLINSIG_Filters <- RS2108[RS2108$CLINSIG == "Pathogenic" | RS2108$CLINSIG == "Likely_pathogenic" ,]
  }
  #Second way of filtering by pathogenic or likely pathigenic in ClinSig
  if("info.CLNSIG" %in% colnames(RS2108))
  {
    
    
    RS2108_After_CLINSIG_Filters <- RS2108[RS2108$info.CLNSIG == "Pathogenic" | RS2108$info.CLNSIG == "Likely_pathogenic" ,]
  }
  #Filter just for top 3 genes - I did more mutated in Myopathy 
  if("info.CLINSIG" %in% colnames(RS2108))
  {
    
    
    RS2108_After_CLINSIG_Filters <- RS2108[RS2108$info.CLINSIG == "Pathogenic" | RS2108$info.CLINSIG == "Likely_pathogenic" ,]
  }
  #edit(RS2108_After_CLINSIG_Filters)
  
  if('Gene.refGene' %in% colnames(RS2108))
  {
  RS2108_After_Filters_For_Top_Genes <- RS2108[RS2108$Gene.refGene == "ACTA" | RS2108$Gene.refGene == "TPM3" | RS2108$Gene.refGene == "MTM1" | RS2108$Gene.refGene == "RYR1" | RS2108$Gene.refGene == "SEPN1" | RS2108$Gene.refGene == "NEB",]
  }
  if('info.Gene.refGene' %in% colnames(RS2108))
  {
    RS2108_After_Filters_For_Top_Genes <- RS2108[RS2108$info.Gene.refGene == "ACTA" | RS2108$info.Gene.refGene == "TPM3" | RS2108$info.Gene.refGene == "MTM1" | RS2108$info.Gene.refGene == "RYR1" | RS2108$info.Gene.refGene == "SEPN1" | RS2108$info.Gene.refGene == "NEB",]
  }
  #RS2108_Spastin <- RS2108[RS2108$Gene.refGene == "SPAST",]
#  RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes
  #No cadd included? Yes
  
  
  if('gnomAD3_exome_ALL' %in% colnames(RS2108))
    
  {
    RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes[  (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_ALL == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_ALL < 0.01 ) &
                                         ( if('gnomAD3_exome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_AFR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_AFR < 0.01 ) } )&
                                         (  if('gnomAD3_exome_AMI' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_AMI == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_AMI < 0.01 ) } ) &
                                         (   if('gnomAD3_exome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_AMR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_AMR < 0.01 ) } )&
                                         (  if('gnomAD3_exome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_ASJ < 0.01 ) } ) &
                                         (  if('gnomAD3_exome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_EAS == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_EAS < 0.01 ) } ) &
                                         (  if('gnomAD3_exome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                         (  if('gnomAD3_exome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_FIN == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_FIN < 0.01 ) } )&
                                         ( if('gnomAD3_exome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_MALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_MALE < 0.01 ) } ) &
                                         (   if('gnomAD3_exome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_OTH == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_OTH < 0.01 ) } ) &
                                         (  if('gnomAD3_exome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_NFE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD3_exome_NFE < 0.01 ) } ) & 
                                         (  if('gnomAD_genome_ALL' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ALL == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ALL < 0.01 ) } ) &
                                         (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_POPMAX == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                         (   if('gnomAD_genome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AFR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AFR < 0.01 ) } ) &
                                         (   if('gnomAD_genome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AMR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AMR < 0.01 ) } ) &
                                         (   if('gnomAD_genome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ASJ < 0.01 ) } ) &
                                         (   if('gnomAD_genome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_EAS == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_EAS < 0.01 ) } ) &
                                         (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                         (    if('gnomAD_genome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FIN == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FIN < 0.01 ) } ) &
                                         (     if('gnomAD_genome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_MALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_MALE < 0.01 ) } ) &
                                         (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_EST == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                         (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_NWE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                         (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_SEU == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                         (    if('gnomAD_genome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_OTH == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_OTH < 0.01 ) } ) &
                                         (   if('gnomAD_genome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE < 0.01 ) } ) &
                                         (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           #   (RS2108_After_Filters_For_Top_Genes$CADD_phred == "." | RS2108_After_Filters_For_Top_Genes$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108_After_Filters_For_Top_Genes$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108_After_Filters_For_Top_Genes$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                         (   if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_AF == "." | RS2108_After_Filters_For_Top_Genes$GME_AF < 0.01 ) } ) &
                                         (  if('GME_AP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_AP == "." | RS2108_After_Filters_For_Top_Genes$GME_AP < 0.01 ) } ) &
                                         (  if('GME_NWA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_NWA == "." | RS2108_After_Filters_For_Top_Genes$GME_NWA < 0.01 ) }) &
                                         (  if('GME_NEA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_NEA == "." | RS2108_After_Filters_For_Top_Genes$GME_NEA < 0.01 ) } ) &
                                         (  if('GME_Israel' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_Israel == "." | RS2108_After_Filters_For_Top_Genes$GME_Israel < 0.01 ) }  ) &
                                         (  if('GME_SD' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_SD == "." | RS2108_After_Filters_For_Top_Genes$GME_SD < 0.01 )} ) &
                                         ( if('GME_TP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_TP == "." | RS2108_After_Filters_For_Top_Genes$GME_TP < 0.01 ) } ) &
                                         (  if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_CA == "." | RS2108_After_Filters_For_Top_Genes$GME_CA < 0.01 ) }),] 
    
    
    #Filte
  }
  
  if('gnomAD_exome_ALL' %in% colnames(RS2108))
    
    
    
  {
    RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes[  (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ALL == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ALL < 0.01 ) &
                                         ( if('gnomAD_exome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR < 0.01 ) } ) &
                                         (  if('gnomAD_exome_AMI' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMI == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMI < 0.01 ) } ) &
                                         (   if('gnomAD_exome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMR < 0.01 ) } )&
                                         (  if('gnomAD_exome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ASJ < 0.01 ) } ) &
                                         (  if('gnomAD_exome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_EAS == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_EAS < 0.01 ) } ) &
                                         (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                         (  if('gnomAD_exome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FIN == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FIN < 0.01 ) } )&
                                         ( if('gnomAD_exome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_MALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_MALE < 0.01 ) } ) &
                                         (   if('gnomAD_exome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_OTH == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_OTH < 0.01 ) } ) &
                                         (  if('gnomAD_exome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_NFE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_NFE < 0.01 ) } ) & 
                                         (  if('gnomAD_genome_ALL' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ALL == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ALL < 0.01 ) } ) &
                                         (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_POPMAX == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                         (   if('gnomAD_genome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AFR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AFR < 0.01 ) } ) &
                                         (   if('gnomAD_genome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AMR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AMR < 0.01 ) } ) &
                                         (   if('gnomAD_genome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ASJ < 0.01 ) } ) &
                                         (   if('gnomAD_genome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_EAS == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_EAS < 0.01 ) } ) &
                                         (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                         (    if('gnomAD_genome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FIN == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FIN < 0.01 ) } ) &
                                         (     if('gnomAD_genome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_MALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_MALE < 0.01 ) } ) &
                                         (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_EST == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                         (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_NWE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                         (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_SEU == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                         (    if('gnomAD_genome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_OTH == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_OTH < 0.01 ) } ) &
                                         (   if('gnomAD_genome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE < 0.01 ) } ) &
                                         (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$CADD_phred == "." | RS2108_After_Filters_For_Top_Genes$CADD_phred > 18 ) &
                                             ( as.numeric(RS2108_After_Filters_For_Top_Genes$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108_After_Filters_For_Top_Genes$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                         (   if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_AF == "." | RS2108_After_Filters_For_Top_Genes$GME_AF < 0.01 ) } ) &
                                         (  if('GME_AP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_AP == "." | RS2108_After_Filters_For_Top_Genes$GME_AP < 0.01 ) } ) &
                                         (  if('GME_NWA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_NWA == "." | RS2108_After_Filters_For_Top_Genes$GME_NWA < 0.01 ) }) &
                                         (  if('GME_NEA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_NEA == "." | RS2108_After_Filters_For_Top_Genes$GME_NEA < 0.01 ) } ) &
                                         (  if('GME_Israel' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_Israel == "." | RS2108_After_Filters_For_Top_Genes$GME_Israel < 0.01 ) }  ) &
                                         (  if('GME_SD' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_SD == "." | RS2108_After_Filters_For_Top_Genes$GME_SD < 0.01 )} ) &
                                         ( if('GME_TP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_TP == "." | RS2108_After_Filters_For_Top_Genes$GME_TP < 0.01 ) } ) &
                                         (  if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_CA == "." | RS2108_After_Filters_For_Top_Genes$GME_CA < 0.01 ) }),] 
    
    
    #Filte
  }
  
  
  
 # if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt" )
  if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
  {
    
    library(stringr)
    library(plyr)
    
    
    #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
    
#    del <- colwise(function(x) str_replace_all(x, '\"', ""))
 #   RS2108 <- del(RS2108_After_Filters_For_Top_Genes)
  #  RS2108[RS2108=="NA"]<-"."
    
    #nchar(RS2108_After_Filters_For_Top_Genes)=="."
    
    
    RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes[  (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ALL == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ALL < 0.01 ) &
                                         ( if('gnomAD_exome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR < 0.01 ) } ) &
                                         #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #  {  
                                         #     (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMI == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMI < 0.01 ) } ) &
                                         (   if('gnomAD_exome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AMR < 0.01 ) } )&
                                         (  if('gnomAD_exome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_ASJ < 0.01 ) } ) &
                                         (  if('gnomAD_exome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_EAS == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_EAS < 0.01 ) } ) &
                                         #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #  {  
                                         #    (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                         (  if('gnomAD_exome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FIN == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_FIN < 0.01 ) } )&
                                         #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         # {  
                                         #   (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_MALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_MALE < 0.01 ) } ) &
                                         (   if('gnomAD_exome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_OTH == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_OTH < 0.01 ) } ) &
                                         (  if('gnomAD_exome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_exome_NFE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_exome_NFE < 0.01 ) } ) & 
                                         (  if('gnomAD_genome_ALL' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ALL == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ALL < 0.01 ) } ) &
                                         #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #  {  
                                         #   (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_POPMAX == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                         (   if('gnomAD_genome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AFR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AFR < 0.01 ) } ) &
                                         (   if('gnomAD_genome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AMR == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_AMR < 0.01 ) } ) &
                                         (   if('gnomAD_genome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_ASJ < 0.01 ) } ) &
                                         (   if('gnomAD_genome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_EAS == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_EAS < 0.01 ) } ) &
                                         #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #   {  
                                         #    (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                         (    if('gnomAD_genome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FIN == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_FIN < 0.01 ) } ) &
                                         #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #  {  
                                         #     (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_MALE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_MALE < 0.01 ) } ) &
                                         #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         # {  
                                         #   (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_EST == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                         #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #  {  
                                         #    (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_NWE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                         #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #  {  
                                       #    (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_SEU == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('gnomAD_genome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                       {  
                                         (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_OTH == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_OTH < 0.01 ) } ) &
                                         (   if('gnomAD_genome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE == "." | RS2108_After_Filters_For_Top_Genes$gnomAD_genome_NFE < 0.01 ) } ) &
                                         #    (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         #   {  
                                         #   (RS2108_After_Filters_For_Top_Genes$CADD_phred == "." | RS2108_After_Filters_For_Top_Genes$CADD_phred > 18 ) &
                                         #    ( as.numeric(RS2108_After_Filters_For_Top_Genes$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108_After_Filters_For_Top_Genes$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                         (   if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_AF == "." | RS2108_After_Filters_For_Top_Genes$GME_AF < 0.01 ) } ) &
                                         (  if('GME_AP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_AP == "." | RS2108_After_Filters_For_Top_Genes$GME_AP < 0.01 ) } ) &
                                         (  if('GME_NWA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_NWA == "." | RS2108_After_Filters_For_Top_Genes$GME_NWA < 0.01 ) }) &
                                         (  if('GME_NEA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_NEA == "." | RS2108_After_Filters_For_Top_Genes$GME_NEA < 0.01 ) } ) &
                                         (  if('GME_Israel' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_Israel == "." | RS2108_After_Filters_For_Top_Genes$GME_Israel < 0.01 ) }  ) &
                                         (  if('GME_SD' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_SD == "." | RS2108_After_Filters_For_Top_Genes$GME_SD < 0.01 )} ) &
                                         ( if('GME_TP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_TP == "." | RS2108_After_Filters_For_Top_Genes$GME_TP < 0.01 ) } ) &
                                         (  if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         { 
                                           (RS2108_After_Filters_For_Top_Genes$GME_CA == "." | RS2108_After_Filters_For_Top_Genes$GME_CA < 0.01 ) }),] 
    
    
    #Filte
    
  }
  
  
  
  
  #r for function
  #Last end is missing the other CAPN3 - hdiv lost it
  
  if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
    
    
  {
    
    #  library(stringr)
    #  library(plyr)
    
    
    #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
    
    #  del <- colwise(function(x) str_replace_all(x, '\"', ""))
    #  RS2108_After_Filters_For_Top_Genes <- del(RS2108_After_Filters_For_Top_Genes)
    RS2108_After_Filters_For_Top_Genes[RS2108_After_Filters_For_Top_Genes=="None"] <-"."
    
    #nchar(RS2108_After_Filters_For_Top_Genes)=="."
    
    
    
    RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes[  (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_ALL == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_ALL < 0.01 ) &
                                         ( if('info.gnomAD3_exome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_AFR == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_AFR < 0.01 ) } ) &
                                         (  if('info.gnomAD3_exome_AMI' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_AMI == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_AMI < 0.01 ) } ) &
                                         (   if('info.gnomAD3_exome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_AMR == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_AMR < 0.01 ) } )&
                                         (  if('info.gnomAD3_exome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_ASJ < 0.01 ) } ) &
                                         (  if('info.gnomAD3_exome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_EAS == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_EAS < 0.01 ) } ) &
                                         (  if('info.gnomAD3_exome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                         (  if('info.gnomAD3_exome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_FIN == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_FIN < 0.01 ) } )&
                                         ( if('info.gnomAD3_exome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_MALE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_MALE < 0.01 ) } ) &
                                         (   if('info.gnomAD3_exome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_OTH == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_OTH < 0.01 ) } ) &
                                         (  if('info.gnomAD3_exome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_NFE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD3_exome_NFE < 0.01 ) } ) & 
                                         (  if('info.gnomAD_genome_ALL' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_ALL == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_ALL < 0.01 ) } ) &
                                         (  if('info.gnomAD_genome_POPMAX' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_POPMAX == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_POPMAX < 0.01 ) } ) &
                                         (   if('info.gnomAD_genome_AFR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_AFR == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_AFR < 0.01 ) } ) &
                                         (   if('info.gnomAD_genome_AMR' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_AMR == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_AMR < 0.01 ) } ) &
                                         (   if('info.gnomAD_genome_ASJ' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_ASJ == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_ASJ < 0.01 ) } ) &
                                         (   if('info.gnomAD_genome_EAS' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_EAS == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_EAS < 0.01 ) } ) &
                                         (   if('info.gnomAD_genome_FEMALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_FEMALE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_FEMALE < 0.01 ) } ) &
                                         (    if('info.gnomAD_genome_FIN' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_FIN == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_FIN < 0.01 ) } ) &
                                         (     if('info.gnomAD_genome_MALE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_MALE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_MALE < 0.01 ) } ) &
                                         (    if('info.gnomAD_genome_NFE_EST' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE_EST == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                         (    if('info.gnomAD_genome_NFE_NWE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE_NWE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE_NWE < 0.01) } ) &
                                         (   if('info.gnomAD_genome_NFE_SEU' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE_SEU == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                         (    if('info.gnomAD_genome_OTH' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_OTH == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_OTH < 0.01 ) } ) &
                                         (   if('info.gnomAD_genome_NFE' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           (RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE == "." | RS2108_After_Filters_For_Top_Genes$info.gnomAD_genome_NFE < 0.01 ) } ) &
                                         (   if('info.SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108_After_Filters_For_Top_Genes))
                                         {  
                                           #   (RS2108_After_Filters_For_Top_Genes$CADD_phred == "." | RS2108_After_Filters_For_Top_Genes$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108_After_Filters_For_Top_Genes$info.SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108_After_Filters_For_Top_Genes$info.SGUL_Exomes_Alt_Allele_Count == ".") }  ) ,]
    #  (   if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #  { 
    #   (RS2108_After_Filters_For_Top_Genes$GME_AF == "." | RS2108_After_Filters_For_Top_Genes$GME_AF < 0.01 ) } ) &
    #  (  if('GME_AP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #  { 
    #    (RS2108_After_Filters_For_Top_Genes$GME_AP == "." | RS2108_After_Filters_For_Top_Genes$GME_AP < 0.01 ) } ) &
    #  (  if('GME_NWA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #  { 
    #    (RS2108_After_Filters_For_Top_Genes$GME_NWA == "." | RS2108_After_Filters_For_Top_Genes$GME_NWA < 0.01 ) }) &
    #  (  if('GME_NEA' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #   { 
    #     (RS2108_After_Filters_For_Top_Genes$GME_NEA == "." | RS2108_After_Filters_For_Top_Genes$GME_NEA < 0.01 ) } ) &
    #   (  if('GME_Israel' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #   { 
    #     (RS2108_After_Filters_For_Top_Genes$GME_Israel == "." | RS2108_After_Filters_For_Top_Genes$GME_Israel < 0.01 ) }  ) &
    #   (  if('GME_SD' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #   { 
    #     (RS2108_After_Filters_For_Top_Genes$GME_SD == "." | RS2108_After_Filters_For_Top_Genes$GME_SD < 0.01 )} ) &
    #   ( if('GME_TP' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #   { 
    #     (RS2108_After_Filters_For_Top_Genes$GME_TP == "." | RS2108_After_Filters_For_Top_Genes$GME_TP < 0.01 ) } ) &
    #   (  if('GME_AF' %in% colnames(RS2108_After_Filters_For_Top_Genes))
    #   { 
    #      (RS2108_After_Filters_For_Top_Genes$GME_CA == "." | RS2108_After_Filters_For_Top_Genes$GME_CA < 0.01 ) })
    
    
    
    #Filte
  }
  
  #FIX!!! IF all Fs as 0 
  #RS2108_After_CLINSIG_Filters <- RS2108_After_CLINSIG_Filters %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
  
  
  #Change names of tables to match RS code
  #Maybe rename particular column titles, and make the polyphen smaller as it is too wide of a name????
  
  #Filter 1 table
  #Just change the name, and maybe adjust the odd column name and should work fine.
  
  #Extract from main and make NT and AA columns and find top freq across all gnomad and gme columns -no SGUL as not an F
  
  #Colour could be whiter??? + HD print out
  
  
  
  if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
    
    
  {
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
    
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous))) , MARGIN=1, FUN=max)
    
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange <- (sub(".*p.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.AAChange.refGene))
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.AAChange.refGene))
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange)
    
#x <- "TEST:c.Lemons:p.Another_Lemons:c.Lemons2:p.biscuits"    
#X2 <- (sub(".*:c. *(.*?) *:p.*", "\\1", x))

#x <- "TEST:p.Lemons,:p.Another_Lemons"
#X2 <- gsub(".*:p.", "", x)

    
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange, ignore.case=FALSE)] <- "."
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
    
  #  if(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")
  #  {
      
   # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
  #  X <- (sub(".*:c.", "", X))
  #  X <- sub("\\\\.*", "",  X)
    
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
      #
      #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
      RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% 
        mutate(NTChange=ifelse(info.Func.refGene != "exonic",(sub(".*:c.", "",   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene)),NTChange))
     # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
      RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange)
      RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
      
   #    }
  }
  if(name != "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" & name != "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
    
  {
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
    
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous))) , MARGIN=1, FUN=max)
    
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange <- (sub(".*p.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange.refGene))
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange.refGene))
    ###
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange)
    
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$AAChange, ignore.case=FALSE)] <- "."
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
    
    #  if(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")
    #  {
    
    # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
    #  X <- (sub(".*:c.", "", X))
    #  X <- sub("\\\\.*", "",  X)
    
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    #
    #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% 
      mutate(NTChange=ifelse(Func.refGene != "exonic",(sub(".*:c.", "",   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$GeneDetail.refGene)),NTChange))
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange)
    RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
    
    
     }
  #max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))
  
  #RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))
  
  #X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))
  
  if(colnames(RS2108) == 'Chr')
  {
  
  dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous,  Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
  }
  
  if(colnames(RS2108) == 'ï..Chr')
  {
    
    dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous,  ï..Chr , Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
  }
  
  if('CHROM' %in% colnames(RS2108))
    
  {
    
    dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous, CHROM, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.AF)
    
  }
  #max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
  
  if('CADD_phred' %in% colnames(dt))
  {
    dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
    dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
  }
  if('info.CADD_phred' %in% colnames(dt))
  {
    dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
    dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
  }
  
  dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
  #dt$Chr <- round(as.numeric(dt$Chr) ,0)
  
  #dt[is.na(dt)] <- "."
  dt$MaxF[dt$MaxF == "NA"] <- "."
  row.names(dt) <- NULL
  
  colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
  colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
  colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
  colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
  colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
  colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
  colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
  colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
  colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
  colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
  colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
  colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
  colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
  colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
  colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'
  
  
  
  
  #dt <- dt %>% replace(is.na(dt), '.')
  
  #dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
  
#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
  if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
    
  {
    
    dt$Chr <- dt$Chr
    
  }
  
  
#  if('Chr' %in% colnames(dt))
    
  else{
    
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
  }
  
  if('CHROM' %in% colnames(dt))
    
  {
    
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
  }
  
  #dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
 # dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
  
  #dt$MaxF[dt$MaxF == 0] <- 0.00
  
  library(dplyr)
  library(knitr)
  library(kableExtra)
  library(magrittr)
  #webshot::install_phantomjs()
  
  
  library("magick")
  
  require("kableExtra")
  
#  Family = "RS1616"
   
  
  if(nrow(dt) >0)
    
  {
  
  dt %>%
    kbl(caption = paste(Family, " " ,"Remaining Homo/Hemizygous Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("table_1" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)
  
  }
  #### info table
  if(colnames(RS2108) == 'Chr')
    
  {
  
  dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous, Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8)
  
  }
  if(colnames(RS2108) == 'ï..Chr')
    
  {
    
    dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous, ï..Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8)
    
  }
  
  
  if('CHROM' %in% colnames(RS2108))
    
  {
    
    dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous, CHROM, POS, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.GeneDetail.refGene, info.AAChange.refGene, info.Func.refGene, ID, info.AF, FT )
    
  }
  #max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
  
  if('CADD_phred' %in% colnames(dt))
  {
    dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
    dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
  }
  if('info.CADD_phred' %in% colnames(dt))
  {
    dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
    dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
  }
  
  dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
  #dt$Chr <- round(as.numeric(dt$Chr) ,0)
  
  #dt[is.na(dt)] <- "."
  dt$MaxF[dt$MaxF == "NA"] <- "."
  row.names(dt) <- NULL
  
  colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
  colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
  colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
  colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
  colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
  colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
  colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
  colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
  colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
  colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
  colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
  colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
  colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
  colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
  colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'
  
  
  
  
  #dt <- dt %>% replace(is.na(dt), '.')
  
  #dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
  
  #  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
  
  if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
    
  {
    
    dt$Chr <- dt$Chr
    
  }
#  if('Chr' %in% colnames(dt))
    
  else{
    
    
    dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
  }
  if('CHROM' %in% colnames(dt))
  {
    dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
    
  }
  #dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
  # dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
  
  #dt$MaxF[dt$MaxF == 0] <- 0.00
  
  library(dplyr)
  library(knitr)
  library(kableExtra)
  library(magrittr)
  #webshot::install_phantomjs()
  
  
  library("magick")
  
  require("kableExtra")
  
  
  
  if(nrow(dt) >0)
    
  {
  
  dt %>%
    kbl(caption = paste(Family, " " ,"Remaining Homo/Hemizygous Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("table_1" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)
  
  }
  
  #For filter 1
  
  
  #Family = 'RS2108'
  
  p1 <- qplot(Sepal.Length, Sepal.Width, data = iris) + theme_void() + geom_point(colour = "white")
  # ggdraw() sets up a new coordinate system running from 0 to 1. This
  # allows you to place an image on top of the plot.
  p1 <- p1 + 
    draw_image("~/Test/Filter1.jpg.png",
               x = 5, y = 2.5, width = 2, height = 1.5) +
    
    annotate(geom="text", x=6.67, y=3.9328, label= Family,
             color="black")+
    
    annotate(geom="text", size = 4.5, x=6.02, y=3.67, label= paste("Original number of variants N = ", + nrow(RS2108)),
             color="white") +
    
    annotate(geom="text", x=6.02, y=3.42, label= paste("Filtering for F of <0.01 N = ", + nrow(RS2108_After_F_Filters)),
             color="white") +
    
    
    annotate(geom="text", size = 3.2, x=6.02, y=3.17, label= paste("Functionality filtering N = ", + nrow(RS2108_After_F_Filters_And_Function)),
             color="white") +
    annotate(geom="text", size = 1.75, x=6.02, y=2.92, label= paste("Homozygosity filtering N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive)),
             color="white")+
    annotate(geom="text", size = 1.3, x=6.02, y=2.7, label= paste("Others N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)),
             color="white")
  
  
  
  ggsave(p1, height = 5.94, width = 8.12, filename=paste("Filter1",Family,".png",sep=""))


#1 + 1 ##2
#"a" + "b" ##"ab"
#"a" + 2 ##"a2"


#"table_1" + Family+".png"

#"table_1" + "_" + name + ".png"

#Family + "Lemons"


#Table 2


if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
  RS2108_After_CLINSIG_Filters <- RS2108_After_CLINSIG_Filters %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
  
  RS2108_After_CLINSIG_Filters$MaxF <-apply(X= RS2108_After_CLINSIG_Filters %>% dplyr:: select(grep("gnomAD", names(RS2108_After_CLINSIG_Filters)), grep("GME", names(RS2108_After_CLINSIG_Filters))) , MARGIN=1, FUN=max)
  
  RS2108_After_CLINSIG_Filters$AAChange <- (sub(".*p.", "", RS2108_After_CLINSIG_Filters$info.AAChange.refGene))
  RS2108_After_CLINSIG_Filters$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_CLINSIG_Filters$info.AAChange.refGene))
  RS2108_After_CLINSIG_Filters$NTChange <- sub("\\\\.*", "",  RS2108_After_CLINSIG_Filters$NTChange)
  
  RS2108_After_CLINSIG_Filters$AAChange[grepl("NM", RS2108_After_CLINSIG_Filters$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_CLINSIG_Filters$NTChange[grepl("NM", RS2108_After_CLINSIG_Filters$NTChange, ignore.case=FALSE)] <- "."
 # if(RS2108_After_CLINSIG_Filters$info.Func.refGene != "exonic")
  #{
    
    # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
    #  X <- (sub(".*:c.", "", X))
    #  X <- sub("\\\\.*", "",  X)
    
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    #
    #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_CLINSIG_Filters <-  RS2108_After_CLINSIG_Filters %>% 
      mutate(NTChange=ifelse(info.Func.refGene != "exonic",(sub(".*:c.", "",   RS2108_After_CLINSIG_Filters$info.GeneDetail.refGene)),NTChange))
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_CLINSIG_Filters$NTChange <- sub("\\\\.*", "",  RS2108_After_CLINSIG_Filters$NTChange)
    RS2108_After_CLINSIG_Filters$NTChange[grepl("NM", RS2108_After_CLINSIG_Filters$NTChange, ignore.case=FALSE)] <- "."
 # }
}
  
#NT <- 'PP:PB:c.T456C\\gh'

#NT <- sub("\\\\.*", "", NT)
#NT <- sub(".*:c.", "", NT)

#NT[grepl("NM", NT, ignore.case=FALSE)] <- "."

 
    
if(name != "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" & name != "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
      
{
  RS2108_After_CLINSIG_Filters <- RS2108_After_CLINSIG_Filters %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
  
  RS2108_After_CLINSIG_Filters$MaxF <-apply(X= RS2108_After_CLINSIG_Filters %>% dplyr:: select(grep("gnomAD", names(RS2108_After_CLINSIG_Filters)), grep("GME", names(RS2108_After_CLINSIG_Filters))) , MARGIN=1, FUN=max)
  
  RS2108_After_CLINSIG_Filters$AAChange <- (sub(".*p.", "", RS2108_After_CLINSIG_Filters$AAChange.refGene))
  RS2108_After_CLINSIG_Filters$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_CLINSIG_Filters$AAChange.refGene))
  
  ####
  
  RS2108_After_CLINSIG_Filters$NTChange <- sub("\\\\.*", "",  RS2108_After_CLINSIG_Filters$NTChange)
  
  RS2108_After_CLINSIG_Filters$AAChange[grepl("NM", RS2108_After_CLINSIG_Filters$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_CLINSIG_Filters$NTChange[grepl("NM", RS2108_After_CLINSIG_Filters$NTChange, ignore.case=FALSE)] <- "."
  # if(RS2108_After_CLINSIG_Filters$info.Func.refGene != "exonic")
  #{
  
  # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
  #  X <- (sub(".*:c.", "", X))
  #  X <- sub("\\\\.*", "",  X)
  
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  #
  #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  RS2108_After_CLINSIG_Filters <-  RS2108_After_CLINSIG_Filters %>% 
    mutate(NTChange=ifelse(Func.refGene != "exonic",(sub(".*:c.", "",   RS2108_After_CLINSIG_Filters$GeneDetail.refGene)),NTChange))
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  RS2108_After_CLINSIG_Filters$NTChange <- sub("\\\\.*", "",  RS2108_After_CLINSIG_Filters$NTChange)
  RS2108_After_CLINSIG_Filters$NTChange[grepl("NM", RS2108_After_CLINSIG_Filters$NTChange, ignore.case=FALSE)] <- "."
  
  
}
#max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))

#RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

#X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))
if(colnames(RS2108) == 'Chr')
  
{

dt <- select(RS2108_After_CLINSIG_Filters, Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)

}

if(colnames(RS2108) == 'ï..Chr')
  
{
  dt <- select(RS2108_After_CLINSIG_Filters, ï..Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
  
  
}

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_CLINSIG_Filters, CHROM,  info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.AF)
  
}
#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'



#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if('Chr' %in% colnames(dt))
  
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if('CHROM' %in% colnames(dt))
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00

library(dplyr)

require("kableExtra")

if(nrow(dt) >0)
  
{

dt %>%
  kbl(caption = paste(Family, " " ,"Remaining ClinVar Selected Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("table_2" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

}
if(colnames(RS2108) == 'Chr')
  
{
if("CLNSIG" %in% colnames(RS2108))
{
  
  
  

dt <- select(RS2108_After_CLINSIG_Filters, Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, CLNSIG, Otherinfo, X.8)
}



  if("CLINSIG" %in% colnames(RS2108))
  {
    
    
    
    
    dt <- select(RS2108_After_CLINSIG_Filters, Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, CLINSIG, Otherinfo, X.8)
  }

}

if(colnames(RS2108) == 'ï..Chr')
  
{

if("CLNSIG" %in% colnames(RS2108))
{
  
  
  dt <- select(RS2108_After_CLINSIG_Filters, ï..Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, CLNSIG, Otherinfo, X.8)
  
}
  if("CLINSIG" %in% colnames(RS2108))
  {
    
    
    dt <- select(RS2108_After_CLINSIG_Filters, ï..Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, CLINSIG, Otherinfo, X.8)
    
  }
}


if(('CHROM' %in% colnames(RS2108)) & ("info.CLNSIG" %in% colnames(RS2108)))
  
{
 
    
    dt <- select(RS2108_After_CLINSIG_Filters, CHROM, POS, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.GeneDetail.refGene, info.AAChange.refGene, info.Func.refGene, ID, info.AF, FT, info.CLNSIG)
    
  }

if(('CHROM' %in% colnames(RS2108)) & ("info.CLINSIG" %in% colnames(RS2108)))
  {
    
    
    dt <- select(RS2108_After_CLINSIG_Filters, CHROM, POS, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.GeneDetail.refGene, info.AAChange.refGene, info.Func.refGene, ID, info.AF, FT, info.CLINSIG)
    
  }

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'



#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if('Chr' %in% colnames(dt))
  
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}

if('CHROM' %in% colnames(dt))
  
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00

library(dplyr)

require("kableExtra")

if(nrow(dt) >0)
  
{
dt %>%
  kbl(caption = paste(Family, " " ,"Remaining ClinVar Selected Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("table_2" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)


}
#For filter 2



p1 <- qplot(Sepal.Length, Sepal.Width, data = iris) + theme_void() + geom_point(colour = "white")
# ggdraw() sets up a new coordinate system running from 0 to 1. This
# allows you to place an image on top of the plot.
p1 <- p1 + 
  draw_image("~/Test/Filter2.jpg.png",
             x = 5, y = 2.5, width = 2, height = 1.5) +
  
  annotate(geom="text", x=6.645, y=3.9328, label= Family,
           color="black")+
  
  annotate(geom="text", x=6.02, y=3.5, label= paste("Original number of variants N = ",  nrow(RS2108)),
           color="white") +
  
  annotate(geom="text", size = 1.722, x=6.02, y=2.9, label= paste("After Filtering for ClinVar Pathogenic \n or Likely Pathogenic Variants \n N = ", nrow( RS2108_After_CLINSIG_Filters )),
           color="white") 



ggsave(p1,height = 5.94, width = 8.12,filename=paste("Filter2",Family,".png",sep=""))



#Table 3
#*******



if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
  RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes_And_Frequency %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
  
  RS2108_After_Filters_For_Top_Genes_And_Frequency$MaxF <-apply(X= RS2108_After_Filters_For_Top_Genes_And_Frequency %>% dplyr:: select(grep("gnomAD", names(RS2108_After_Filters_For_Top_Genes_And_Frequency)), grep("GME", names(RS2108_After_Filters_For_Top_Genes_And_Frequency))) , MARGIN=1, FUN=max)
  
  RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange <- (sub(".*p.", "", RS2108_After_Filters_For_Top_Genes_And_Frequency$info.AAChange.refGene))
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_Filters_For_Top_Genes_And_Frequency$info.AAChange.refGene))
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- sub("\\\\.*", "",   RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange)
  
  RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange[grepl("NM", RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange[grepl("NM", RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange, ignore.case=FALSE)] <- "."
 # if(RS2108_After_Filters_For_Top_Genes_And_Frequency$info.Func.refGene != "exonic")
 # {
#    RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- (sub(".*:c.", "",  RS2108_After_Filters_For_Top_Genes_And_Frequency$info.GeneDetail.refGene))
 #   RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- sub("\\\\.*", "",   RS2108_After_Filters_For_Top_Genes_And_Frequency$info.GeneDetail.refGene)
    RS2108_After_Filters_For_Top_Genes_And_Frequency <-   RS2108_After_Filters_For_Top_Genes_And_Frequency %>% 
      mutate(NTChange=ifelse(info.Func.refGene != "exonic",(sub(".*:c.", "",  RS2108_After_Filters_For_Top_Genes_And_Frequency$info.GeneDetail.refGene)),NTChange))
    RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange[grepl("NM", RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange, ignore.case=FALSE)] <- "."
 # }


#if( RS2108_After_Filters_For_Top_Genes_And_Frequency$info.Func.refGene != "exonic")
#{
  
  # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
  #  X <- (sub(".*:c.", "", X))
  #  X <- sub("\\\\.*", "",  X)
  
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  #
  #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
 # RS2108_After_Filters_For_Top_Genes_And_Frequency <-   RS2108_After_Filters_For_Top_Genes_And_Frequency %>% 
  #  mutate(NTChange=ifelse(info.Func.refGene == "splicing",(sub(".*:c.", "",    RS2108_After_Filters_For_Top_Genes_And_Frequency$info.GeneDetail.refGene)),NTChange))
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
 # RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- sub("\\\\.*", "",   RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange)
}
#}
#max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))

#RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

#X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

if(name != "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" & name != "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
  RS2108_After_Filters_For_Top_Genes_And_Frequency <- RS2108_After_Filters_For_Top_Genes_And_Frequency %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
  
  RS2108_After_Filters_For_Top_Genes_And_Frequency$MaxF <-apply(X= RS2108_After_Filters_For_Top_Genes_And_Frequency %>% dplyr:: select(grep("gnomAD", names(RS2108_After_Filters_For_Top_Genes_And_Frequency)), grep("GME", names(RS2108_After_Filters_For_Top_Genes_And_Frequency))) , MARGIN=1, FUN=max)
  
  RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange <- (sub(".*p.", "", RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange.refGene))
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange.refGene))
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- sub("\\\\.*", "",   RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange)
  
  RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange[grepl("NM", RS2108_After_Filters_For_Top_Genes_And_Frequency$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange[grepl("NM", RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange, ignore.case=FALSE)] <- "."
  # if(RS2108_After_Filters_For_Top_Genes_And_Frequency$info.Func.refGene != "exonic")
  # {
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- (sub(".*:c.", "",  RS2108_After_Filters_For_Top_Genes_And_Frequency$GeneDetail.refGene))
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- sub("\\\\.*", "",   RS2108_After_Filters_For_Top_Genes_And_Frequency$GeneDetail.refGene)
  RS2108_After_Filters_For_Top_Genes_And_Frequency <-   RS2108_After_Filters_For_Top_Genes_And_Frequency %>% 
    mutate(NTChange=ifelse(Func.refGene != "exonic",(sub(".*:c.", "",  RS2108_After_Filters_For_Top_Genes_And_Frequency$GeneDetail.refGene)),NTChange))
  RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange[grepl("NM", RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange, ignore.case=FALSE)] <- "."
  # }
  
  
  #if( RS2108_After_Filters_For_Top_Genes_And_Frequency$info.Func.refGene != "exonic")
  #{
  
  # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
  #  X <- (sub(".*:c.", "", X))
  #  X <- sub("\\\\.*", "",  X)
  
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  #
  #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  # RS2108_After_Filters_For_Top_Genes_And_Frequency <-   RS2108_After_Filters_For_Top_Genes_And_Frequency %>% 
  #  mutate(NTChange=ifelse(info.Func.refGene == "splicing",(sub(".*:c.", "",    RS2108_After_Filters_For_Top_Genes_And_Frequency$info.GeneDetail.refGene)),NTChange))
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  # RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange <- sub("\\\\.*", "",   RS2108_After_Filters_For_Top_Genes_And_Frequency$NTChange)
}

if(colnames(RS2108) == 'Chr')
  
{

dt <- select(RS2108_After_Filters_For_Top_Genes_And_Frequency, Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)

}

if(colnames(RS2108) == 'ï..Chr')
  
{
  
  dt <- select(RS2108_After_Filters_For_Top_Genes_And_Frequency, ï..Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
  
}

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_Filters_For_Top_Genes_And_Frequency, CHROM, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.AF )
  
}
#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'




#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if("Chr"  %in% colnames(dt) )
 else {
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if("CHROM"  %in% colnames(dt) )
{
  
dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)


}
#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00


library(dplyr)

require("kableExtra")
if(nrow(dt) >0)
  
{
dt %>%
  kbl(caption = paste(Family, " " ,"Remaining Top 6 Gene Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("table_3" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

}


if(colnames(RS2108) == 'ï..Chr')
  
{
  
 
    

dt <- select(RS2108_After_Filters_For_Top_Genes_And_Frequency,ï..Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8)

}

if(colnames(RS2108) == 'Chr')
  
{
  
  dt <- select(RS2108_After_Filters_For_Top_Genes_And_Frequency, Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8)
  
  
}
    

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_Filters_For_Top_Genes_And_Frequency, CHROM, POS, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.GeneDetail.refGene, info.AAChange.refGene, info.Func.refGene, ID, info.AF, FT )
  
}
#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if("Chr"  %in% colnames(dt) )
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if("CHROM"  %in% colnames(dt) )
  
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00


library(dplyr)

require("kableExtra")
if(nrow(dt) >0)
  
{
dt %>%
  kbl(caption = paste(Family, " " ,"Remaining Top 6 Gene Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("table_3" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)
}

p1 <- qplot(Sepal.Length, Sepal.Width, data = iris) + theme_void() + geom_point(colour = "white")
# ggdraw() sets up a new coordinate system running from 0 to 1. This
# allows you to place an image on top of the plot.
p1 <- p1 + 
  draw_image("~/Test/Filter3.png",
             x = 5, y = 2.5, width = 2, height = 1.5) +
  
  annotate(geom="text", x=6.53, y=3.8965, label= Family,
           color="black")+
  
  annotate(geom="text", x=5.9, y=3.8, label = "irrelevant",
           color="white")+
  
  annotate(geom="text", size = 1.3, x=5.9, y=2.8, label= paste("Filtering for F of <0.01 N = ", + nrow(RS2108_After_Filters_For_Top_Genes_And_Frequency)),
           color="white") +
  annotate(geom="text", x=5.9, size =4, y=3.55, label= paste("Original number of variants N = ", + nrow(RS2108)),
           color="white") +
  annotate(geom="text", size = 2.21, x=5.9, y=3.15, label = paste("Filtering for top 6 Myopathy Genes N = ", + nrow(RS2108_After_Filters_For_Top_Genes)) ,
           color="white") 



ggsave(p1,height = 5.94, width = 8.12,filename=paste("Filter3",Family,".png",sep=""))



#Change table nams per I
#Just change the right of <- RS2108 was the first try so will always have that name.


if('gnomAD3_exome_ALL' %in% colnames(RS2108))
  
{
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
                                       ( if('gnomAD3_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_AFR == "." | RS2108$gnomAD3_exome_AFR < 0.01 ) } )&
                                       (  if('gnomAD3_exome_AMI' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_AMI == "." | RS2108$gnomAD3_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD3_exome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_AMR == "." | RS2108$gnomAD3_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD3_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_ASJ == "." | RS2108$gnomAD3_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_EAS == "." | RS2108$gnomAD3_exome_EAS < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_FIN == "." | RS2108$gnomAD3_exome_FIN < 0.01 ) } )&
                                       ( if('gnomAD3_exome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD3_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       {  
                                         #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                         ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
}

if('gnomAD_exome_ALL' %in% colnames(RS2108))
  
  
  
{
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                       ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                       (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                       ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       {  
                                         (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
}



#if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt" | RS1048C_AM-AB.annovar.hg38_multianno)
if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 

#colnames(RS2108) == "gnomAD_exome_AMI"  

  
{
  
  library(stringr)
  library(plyr)
  
  
  #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
  
#  del <- colwise(function(x) str_replace_all(x, '\"', ""))
#  RS2108 <- del(RS2108)
#  RS2108[RS2108=="NA"]<-"."
  
  #nchar(RS2108)=="."
  
  
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                       ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                       #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                       #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                       #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       #  {  
                                       #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       #   {  
                                       #    (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       #  {  
                                     #    (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                     (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                     {  
                                       (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                           (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                          {  
                                       #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
  
}

# if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt")
if( (! "SGUL_Exomes_Alt_Allele_Count"    %in% colnames(RS2108) )== TRUE ) 
  
{
  
  library(stringr)
  library(plyr)
  
  
  #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
  
  del <- colwise(function(x) str_replace_all(x, '\"', ""))
  RS2108 <- del(RS2108)
  RS2108[RS2108=="NA"]<-"."
  
  #nchar(RS2108)=="."
  
  
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                       ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                       #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                       #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                       #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       #  {  
                                       #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       #   {  
                                       #    (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       #  {  
                                     #    (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                     (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                     {  
                                       (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       # (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                       #   ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
  
}

#r for function
#Last end is missing the other CAPN3 - hdiv lost it

if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
  
  #  library(stringr)
  #  library(plyr)
  
  
  #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
  
  #  del <- colwise(function(x) str_replace_all(x, '\"', ""))
  #  RS2108 <- del(RS2108)
  RS2108[RS2108=="None"] <-"."
  
  #nchar(RS2108)=="."
  
  
  
  RS2108_After_F_Filters <- RS2108[  (RS2108$info.gnomAD3_exome_ALL == "." | RS2108$info.gnomAD3_exome_ALL < 0.01 ) &
                                       ( if('info.gnomAD3_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_AFR == "." | RS2108$info.gnomAD3_exome_AFR < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_AMI' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_AMI == "." | RS2108$info.gnomAD3_exome_AMI < 0.01 ) } ) &
                                       (   if('info.gnomAD3_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$info.gnomAD3_exome_AMR == "." | RS2108$info.gnomAD3_exome_AMR < 0.01 ) } )&
                                       (  if('info.gnomAD3_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_ASJ == "." | RS2108$info.gnomAD3_exome_ASJ < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_EAS == "." | RS2108$info.gnomAD3_exome_EAS < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_FEMALE == "." | RS2108$info.gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_FIN == "." | RS2108$info.gnomAD3_exome_FIN < 0.01 ) } )&
                                       ( if('info.gnomAD3_exome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_MALE == "." | RS2108$info.gnomAD3_exome_MALE < 0.01 ) } ) &
                                       (   if('info.gnomAD3_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_OTH == "." | RS2108$info.gnomAD3_exome_OTH < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_NFE == "." | RS2108$info.gnomAD3_exome_NFE < 0.01 ) } ) & 
                                       (  if('info.gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_ALL == "." | RS2108$info.gnomAD_genome_ALL < 0.01 ) } ) &
                                       (  if('info.gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_POPMAX == "." | RS2108$info.gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_AFR == "." | RS2108$info.gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_AMR == "." | RS2108$info.gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_ASJ == "." | RS2108$info.gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_EAS == "." | RS2108$info.gnomAD_genome_EAS < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_FEMALE == "." | RS2108$info.gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_FIN == "." | RS2108$info.gnomAD_genome_FIN < 0.01 ) } ) &
                                       (     if('info.gnomAD_genome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_MALE == "." | RS2108$info.gnomAD_genome_MALE < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE_EST == "." | RS2108$info.gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE_NWE == "." | RS2108$info.gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       (   if('info.gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE_SEU == "." | RS2108$info.gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_OTH == "." | RS2108$info.gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE == "." | RS2108$info.gnomAD_genome_NFE < 0.01 ) } ) &
                                       (   if('info.SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       {  
                                         #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                         ( as.numeric(RS2108$info.SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$info.SGUL_Exomes_Alt_Allele_Count == ".") }  ) ,]
  #  (   if('GME_AF' %in% colnames(RS2108))
  #  { 
  #   (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
  #  (  if('GME_AP' %in% colnames(RS2108))
  #  { 
  #    (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
  #  (  if('GME_NWA' %in% colnames(RS2108))
  #  { 
  #    (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
  #  (  if('GME_NEA' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
  #   (  if('GME_Israel' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
  #   (  if('GME_SD' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
  #   ( if('GME_TP' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
  #   (  if('GME_AF' %in% colnames(RS2108))
  #   { 
  #      (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) })
  
  
  
  #Filte
}




if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
 
  #Filter for function
  #Last end is missing the other CAPN3 - hdiv lost it
  
  
  RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$info.Func.refGene == "exonic" | RS2108_After_F_Filters$info.Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$info.Func.refGene == "splicing" | RS2108_After_F_Filters$info.Func.refGene == ".") & (RS2108_After_F_Filters$info.ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$info.ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$info.ExonicFunc.refGene == ".")  &  (RS2108_After_F_Filters$info.Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$info.Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$info.Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$info.SIFT_pred == "D" | RS2108_After_F_Filters$info.SIFT_pred == "."),]
  
  
  #Filter for mode of inheritance - in this case recessive
  
  #RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$Otherinfo == 1 ,]
  #**** hetero
  RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
  #Other miscellaneous ones
  
  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$FT  == "",]
  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[ !  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Gene.refGene %in% FLAGGeneList, ]
  
  #Fix names
  #Heterozygote Version of table for protocol 1)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Gene.refGene %in% GeneList,]
  
  #edit(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous))) , MARGIN=1, FUN=max)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange <- (sub(".*:p. *(.*?) *,*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$info.AAChange.refGene))
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$info.AAChange.refGene))
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",   RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange)
  
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
    
    # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
    #  X <- (sub(".*:c.", "", X))
    #  X <- sub("\\\\.*", "",  X)
    
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    #
    #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous <-   RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous %>% 
      mutate(NTChange=ifelse(info.Func.refGene != "exonic",(sub(".*:c.", "",    RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$info.GeneDetail.refGene)),NTChange))
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",   RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange)
    
    RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
    
} 
  if(name != "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" & name != "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
    
{
  
  
  #Filter for function
  #Last end is missing the other CAPN3 - hdiv lost it
  
  
  RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Func.refGene == "exonic" | RS2108_After_F_Filters$Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$Func.refGene == "splicing" | RS2108_After_F_Filters$Func.refGene == ".") & (RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$ExonicFunc.refGene == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]
  
  
  #Filter for mode of inheritance - in this case recessive
  
  #RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$Otherinfo == 1 ,]
  #**** hetero
  RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
  #Other miscellaneous ones
  
  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$X.8  == "PASS",]
  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[ !  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$Gene.refGene %in% FLAGGeneList, ]
  
  #Fix names
  #Heterozygote Version of table for protocol 1)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$Gene.refGene %in% GeneList,]
  
  #edit(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous))) , MARGIN=1, FUN=max)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange <- (sub(".*:p. *(.*?) *,*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene))
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene))
  
  ###
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",   RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange)
  
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
  
  # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
  #  X <- (sub(".*:c.", "", X))
  #  X <- sub("\\\\.*", "",  X)
  
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  #
  #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous <-   RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous %>% 
    mutate(NTChange=ifelse(Func.refGene != "exonic",(sub(".*:c.", "",    RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$GeneDetail.refGene)),NTChange))
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange <- sub("\\\\.*", "",   RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange)
  
  RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange[grepl("NM", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$NTChange, ignore.case=FALSE)] <- "."
  
}

if(colnames(RS2108) == 'Chr')
  
{
  
dt <- select(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous, Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
}


if(colnames(RS2108) == 'ï..Chr')
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous, ï..Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
}

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous, CHROM,  info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.AF )
  
}
#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if("Chr"  %in% colnames(dt) )
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if("CHROM"  %in% colnames(dt) )
  
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00

library(dplyr)
library(knitr)
library(kableExtra)
library(magrittr)
#webshot::install_phantomjs()


library("magick")

require("kableExtra")

if(nrow(dt) >0)
  
{

dt %>%
  kbl(caption = paste(Family, " " ,"Remaining Heterozygous Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("table_1a" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

}

if(colnames(RS2108) == 'Chr')
  
{

dt <- select(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous, Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8)

}

if(colnames(RS2108) == 'ï..Chr')
  
{

  dt <- select(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous, ï..Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8 )
  
}

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous, CHROM, POS, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.GeneDetail.refGene, info.AAChange.refGene, info.Func.refGene, ID, info.AF, FT )
  
}
#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'



#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if("Chr"  %in% colnames(dt) )
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if("CHROM"  %in% colnames(dt) )
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00

library(dplyr)
library(knitr)
library(kableExtra)
library(magrittr)
#webshot::install_phantomjs()


library("magick")

require("kableExtra")

if(nrow(dt) >0)
  
{
dt %>%
  kbl(caption = paste(Family, " " ,"Remaining Heterozygous Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("table_1a" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)

}


nrow(RS2108_After_F_Filters)
nrow(RS2108_After_F_Filters_And_Function)
nrow(RS2108_After_F_Filters_And_Function_And_Recessive)
nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)
nrow(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)
#Extracting the correct

#sub(".*p.", "", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene)  
#Same for NT and gene name, before or after, or use standalone gene name


#gsub(".*. (.+)  :*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene )

#sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene)

#edit(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)

#Filter 1a

p1 <- qplot(Sepal.Length, Sepal.Width, data = iris) + theme_void() + geom_point(colour = "white")
# ggdraw() sets up a new coordinate system running from 0 to 1. This
# allows you to place an image on top of the plot.
p1 <- p1 + 
  draw_image("~/Test/Filter1a.png",
             x = 5, y = 2.5, width = 2, height = 1.5) +
  
  annotate(geom="text", x=5.855, y=3.74, size =2.7, label= Family,
           color="black")+
  
  annotate(geom="text", size = 3.57, x=5.855, y=3.61, label= paste("Original number of variants N = ", + nrow(RS2108)),
           color="white") +
  
  annotate(geom="text", x=5.855, y=3.40, size = 3.2, label= paste("Filtering for F of <0.01 N = ", + nrow(RS2108_After_F_Filters)),
           color="white") +
  
  
  annotate(geom="text", x=5.855, y=3.2, size = 2.45, label= paste("Functionality filtering N = ", + nrow(RS2108_After_F_Filters_And_Function)),
           color="white") +
  annotate(geom="text", x=5.855, y=3, size = 2.3 ,label= paste("Others N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)),
           color="white")+
  annotate(geom="text", x=5.855, y=2.83, size = 1, label= paste("Gene Match N = ", + nrow(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)),
           color="white")



ggsave(p1,height = 5.94, width = 8.12,filename=paste("Filter1a",Family,".png",sep=""))




if('gnomAD3_exome_ALL' %in% colnames(RS2108))
  
{
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
                                       ( if('gnomAD3_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_AFR == "." | RS2108$gnomAD3_exome_AFR < 0.01 ) } )&
                                       (  if('gnomAD3_exome_AMI' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_AMI == "." | RS2108$gnomAD3_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD3_exome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_AMR == "." | RS2108$gnomAD3_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD3_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_ASJ == "." | RS2108$gnomAD3_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_EAS == "." | RS2108$gnomAD3_exome_EAS < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_FIN == "." | RS2108$gnomAD3_exome_FIN < 0.01 ) } )&
                                       ( if('gnomAD3_exome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD3_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD3_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       {  
                                         #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                         ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
}

if('gnomAD_exome_ALL' %in% colnames(RS2108))
  
  
  
{
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                       ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                       (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                       ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       {  
                                         (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
}

#if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt")
if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{ 
  
  library(stringr)
  library(plyr)
  
  
  #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
  
#  del <- colwise(function(x) str_replace_all(x, '\"', ""))
#  RS2108 <- del(RS2108)
 # RS2108[RS2108=="NA"]<-"."
#  
  #nchar(RS2108)=="."
  
  
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                       ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                       #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                       #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                       #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       #  {  
                                       #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       #   {  
                                       #    (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       #  {  
                                     #    (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                     (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                     {  
                                       (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                           (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                          {  
                                       #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                           ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
}

# if(name == "Y290C_.annovar.hg19_multianno.txt" | name == "RS12C_Index22_OtB1239.annovar.hg19_multianno.txt" | name == "RS1719C_FA_HO.annovar.hg38_multianno.txt" | name == "RS1616c_.annovar.hg38_multianno.txt")
if( (! "SGUL_Exomes_Alt_Allele_Count"    %in% colnames(RS2108) )== TRUE ) 
  
{
  
  library(stringr)
  library(plyr)
  
  
  #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
  
  del <- colwise(function(x) str_replace_all(x, '\"', ""))
  RS2108 <- del(RS2108)
  RS2108[RS2108=="NA"]<-"."
  
  #nchar(RS2108)=="."
  
  
  RS2108_After_F_Filters <- RS2108[  (RS2108$gnomAD_exome_ALL == "." | RS2108$gnomAD_exome_ALL < 0.01 ) &
                                       ( if('gnomAD_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_AFR == "." | RS2108$gnomAD_exome_AFR < 0.01 ) } ) &
                                       #  (  if('gnomAD_exome_AMI' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_exome_AMI == "." | RS2108$gnomAD_exome_AMI < 0.01 ) } ) &
                                       (   if('gnomAD_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$gnomAD_exome_AMR == "." | RS2108$gnomAD_exome_AMR < 0.01 ) } )&
                                       (  if('gnomAD_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_ASJ == "." | RS2108$gnomAD_exome_ASJ < 0.01 ) } ) &
                                       (  if('gnomAD_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_EAS == "." | RS2108$gnomAD_exome_EAS < 0.01 ) } ) &
                                       #   (  if('gnomAD_exome_FEMALE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_exome_FEMALE == "." | RS2108$gnomAD_exome_FEMALE < 0.01 ) } ) &
                                       (  if('gnomAD_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_FIN == "." | RS2108$gnomAD_exome_FIN < 0.01 ) } )&
                                       #  ( if('gnomAD_exome_MALE' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_exome_MALE == "." | RS2108$gnomAD_exome_MALE < 0.01 ) } ) &
                                       (   if('gnomAD_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_OTH == "." | RS2108$gnomAD_exome_OTH < 0.01 ) } ) &
                                       (  if('gnomAD_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_exome_NFE == "." | RS2108$gnomAD_exome_NFE < 0.01 ) } ) & 
                                       (  if('gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) } ) &
                                       #   (  if('gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       #  {  
                                       #   (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AFR == "." | RS2108$gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_AMR == "." | RS2108$gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_ASJ == "." | RS2108$gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_EAS == "." | RS2108$gnomAD_genome_EAS < 0.01 ) } ) &
                                       #   (   if('gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       #   {  
                                       #    (RS2108$gnomAD_genome_FEMALE == "." | RS2108$gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_FIN == "." | RS2108$gnomAD_genome_FIN < 0.01 ) } ) &
                                       #  (     if('gnomAD_genome_MALE' %in% colnames(RS2108))
                                       #  {  
                                       #     (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) } ) &
                                       #   (    if('gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$gnomAD_genome_NFE_EST == "." | RS2108$gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       #  (    if('gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       #  {  
                                       #    (RS2108$gnomAD_genome_NFE_NWE == "." | RS2108$gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       #  (   if('gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       #  {  
                                     #    (RS2108$gnomAD_genome_NFE_SEU == "." | RS2108$gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                     (    if('gnomAD_genome_OTH' %in% colnames(RS2108))
                                     {  
                                       (RS2108$gnomAD_genome_OTH == "." | RS2108$gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$gnomAD_genome_NFE == "." | RS2108$gnomAD_genome_NFE < 0.01 ) } ) &
                                       # (   if('SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       # {  
                                       #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                       #   ( as.numeric(RS2108$SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$SGUL_Exomes_Alt_Allele_Count == ".") } ) &
                                       (   if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
                                       (  if('GME_AP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
                                       (  if('GME_NWA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
                                       (  if('GME_NEA' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
                                       (  if('GME_Israel' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
                                       (  if('GME_SD' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
                                       ( if('GME_TP' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
                                       (  if('GME_AF' %in% colnames(RS2108))
                                       { 
                                         (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) }),] 
  
  
  #Filte
  
}

#r for function
#Last end is missing the other CAPN3 - hdiv lost it

if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
  
  #  library(stringr)
  #  library(plyr)
  
  
  #  dt$Polyphen2_HDIV_pred[dt$Polyphen2_HDIV_pred] <- "."
  
  #  del <- colwise(function(x) str_replace_all(x, '\"', ""))
  #  RS2108 <- del(RS2108)
  RS2108[RS2108=="None"] <-"."
  
  #nchar(RS2108)=="."
  
  
  
  RS2108_After_F_Filters <- RS2108[  (RS2108$info.gnomAD3_exome_ALL == "." | RS2108$info.gnomAD3_exome_ALL < 0.01 ) &
                                       ( if('info.gnomAD3_exome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_AFR == "." | RS2108$info.gnomAD3_exome_AFR < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_AMI' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_AMI == "." | RS2108$info.gnomAD3_exome_AMI < 0.01 ) } ) &
                                       (   if('info.gnomAD3_exome_AMR' %in% colnames(RS2108))
                                       {
                                         (RS2108$info.gnomAD3_exome_AMR == "." | RS2108$info.gnomAD3_exome_AMR < 0.01 ) } )&
                                       (  if('info.gnomAD3_exome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_ASJ == "." | RS2108$info.gnomAD3_exome_ASJ < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_EAS == "." | RS2108$info.gnomAD3_exome_EAS < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_FEMALE == "." | RS2108$info.gnomAD3_exome_FEMALE < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_FIN == "." | RS2108$info.gnomAD3_exome_FIN < 0.01 ) } )&
                                       ( if('info.gnomAD3_exome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_MALE == "." | RS2108$info.gnomAD3_exome_MALE < 0.01 ) } ) &
                                       (   if('info.gnomAD3_exome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_OTH == "." | RS2108$info.gnomAD3_exome_OTH < 0.01 ) } ) &
                                       (  if('info.gnomAD3_exome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD3_exome_NFE == "." | RS2108$info.gnomAD3_exome_NFE < 0.01 ) } ) & 
                                       (  if('info.gnomAD_genome_ALL' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_ALL == "." | RS2108$info.gnomAD_genome_ALL < 0.01 ) } ) &
                                       (  if('info.gnomAD_genome_POPMAX' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_POPMAX == "." | RS2108$info.gnomAD_genome_POPMAX < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_AFR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_AFR == "." | RS2108$info.gnomAD_genome_AFR < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_AMR' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_AMR == "." | RS2108$info.gnomAD_genome_AMR < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_ASJ' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_ASJ == "." | RS2108$info.gnomAD_genome_ASJ < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_EAS' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_EAS == "." | RS2108$info.gnomAD_genome_EAS < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_FEMALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_FEMALE == "." | RS2108$info.gnomAD_genome_FEMALE < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_FIN' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_FIN == "." | RS2108$info.gnomAD_genome_FIN < 0.01 ) } ) &
                                       (     if('info.gnomAD_genome_MALE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_MALE == "." | RS2108$info.gnomAD_genome_MALE < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_NFE_EST' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE_EST == "." | RS2108$info.gnomAD_genome_NFE_EST < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_NFE_NWE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE_NWE == "." | RS2108$info.gnomAD_genome_NFE_NWE < 0.01) } ) &
                                       (   if('info.gnomAD_genome_NFE_SEU' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE_SEU == "." | RS2108$info.gnomAD_genome_NFE_SEU < 0.01 ) } ) &
                                       (    if('info.gnomAD_genome_OTH' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_OTH == "." | RS2108$info.gnomAD_genome_OTH < 0.01 ) } ) &
                                       (   if('info.gnomAD_genome_NFE' %in% colnames(RS2108))
                                       {  
                                         (RS2108$info.gnomAD_genome_NFE == "." | RS2108$info.gnomAD_genome_NFE < 0.01 ) } ) &
                                       (   if('info.SGUL_Exomes_Alt_Allele_Count' %in% colnames(RS2108))
                                       {  
                                         #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                         ( as.numeric(RS2108$info.SGUL_Exomes_Alt_Allele_Count) < 20 | RS2108$info.SGUL_Exomes_Alt_Allele_Count == ".") }  ) ,]
  #  (   if('GME_AF' %in% colnames(RS2108))
  #  { 
  #   (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) } ) &
  #  (  if('GME_AP' %in% colnames(RS2108))
  #  { 
  #    (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) } ) &
  #  (  if('GME_NWA' %in% colnames(RS2108))
  #  { 
  #    (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) }) &
  #  (  if('GME_NEA' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) } ) &
  #   (  if('GME_Israel' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) }  ) &
  #   (  if('GME_SD' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 )} ) &
  #   ( if('GME_TP' %in% colnames(RS2108))
  #   { 
  #     (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) } ) &
  #   (  if('GME_AF' %in% colnames(RS2108))
  #   { 
  #      (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 ) })
  
  
  
  #Filte
}

#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Func.refGene == "exonic" | RS2108_After_F_Filters$Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$Func.refGene == "splicing" | RS2108_After_F_Filters$Func.refGene == ".") & (RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$ExonicFunc.refGene == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]


#Filter for mode of inheritance - in this case recessive

#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$Otherinfo == 1 ,]
#**** hetero
#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
#Other miscellaneous ones

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive[RS2108_After_F_Filters_And_Function_And_Recessive$X.8 == "PASS" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-B" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-A" &  RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-DRB1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HLA-DRB5" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "FCGBP" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "COL18A1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MUC4" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "SLAIN1" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "MAML3" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "HRNR" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "LOC283710" & RS2108_After_F_Filters_And_Function_And_Recessive$Gene.refGene != "SSTR1" ,]

#Fix names
#Heterozygote Version of table for protocol 1)



if(name == "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" | name == "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
  
  
{
  
  RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$info.Func.refGene == "exonic" | RS2108_After_F_Filters$info.Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$info.Func.refGene == "splicing" | RS2108_After_F_Filters$info.Func.refGene == ".") & (RS2108_After_F_Filters$info.ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$info.ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$info.ExonicFunc.refGene == "."),]
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$info.Gene.refGene %in% GeneListNHS,]
  
  #edit(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$MaxF <-apply(X= RS2108_After_F_Filters_And_Selected_Panel_Green_Genes%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes)), grep("GME", names(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes))) , MARGIN=1, FUN=max)
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange <- (sub(".*:p. *(.*?) *,*", "\\1", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$info.AAChange.refGene))
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange <- RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange<-sub('"',"", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange)
 # if(agrep("biol", "biology"))
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <-  str_remove(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$info.AAChange.refGene, r"(\\.*)")
 # RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <- sub(".*:c.", "",   RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange )
 # RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <- sub("\\\\.*", "", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange)
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange[grepl("NM", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange[grepl("NM", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange, ignore.case=FALSE)] <- "."
#  if( RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$info.Func.refGene != "exonic")
 # {
    
    # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
    #  X <- (sub(".*:c.", "", X))
    #  X <- sub("\\\\.*", "",  X)
    
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    #
    #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_F_Filters_And_Selected_Panel_Green_Genes <-  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes %>% 
      mutate(NTChange=ifelse(info.Func.refGene != "exonic",(sub(".*:c.", "",    RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$info.GeneDetail.refGene)),NTChange))
    # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
    RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <- sub("\\\\.*", "",  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange)
    RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange[grepl("NM", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange, ignore.case=FALSE)] <- "."
    # 
    
    
    
    
 # }
}


#dt$AAChange[grepl("NM", dt$AAChange, ignore.case=FALSE)] <- "."
#dt<- edit(dt)

#dt$`AA Change` <- sub("\\\\.*", "", dt$`AA Change`)

  
  if(name != "RS12C (HG38)_query_SGUL_exomes_Index22_OtB1239_multianno_transposed.txt" & name != "RS24742 (HG38)_query_SGUL_exomes_Index47_OtB1026_multianno_transposed.txt")
    
  {
    
  RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Func.refGene == "exonic" | RS2108_After_F_Filters$Func.refGene == "exonic;splicing" | RS2108_After_F_Filters$Func.refGene == "splicing" | RS2108_After_F_Filters$Func.refGene == ".") & (RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift deletion" | RS2108_After_F_Filters$ExonicFunc.refGene == "frameshift insertion" | RS2108_After_F_Filters$ExonicFunc.refGene ==  "nonsynonymous SNV" | RS2108_After_F_Filters$ExonicFunc.refGene == "stopgain" | RS2108_After_F_Filters$ExonicFunc.refGene == "stoploss" | RS2108_After_F_Filters$ExonicFunc.refGene == "."),]
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$Gene.refGene %in% GeneListNHS,]
  
  #edit(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes <-  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$MaxF <-apply(X= RS2108_After_F_Filters_And_Selected_Panel_Green_Genes%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes)), grep("GME", names(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes))) , MARGIN=1, FUN=max)
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange <- (sub(".*:p. *(.*?) *,*", "\\1", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange.refGene))
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange <- RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange<-sub('"',"", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange)
  # if(agrep("biol", "biology")) - this could be the issue ^
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <-  str_remove(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange.refGene, r"(\\.*)")
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <- (sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange.refGene))
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <- sub("\\\\.*", "", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange)
  
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange[grepl("NM", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$AAChange, ignore.case=FALSE)] <- "."
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange[grepl("NM", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange, ignore.case=FALSE)] <- "."
  #  if( RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$info.Func.refGene != "exonic")
  # {
  
  # X <-  "NM_147148:exon4:c.259+1G>A\x3bNM_000850:exon4:c.259+1G>A"
  #  X <- (sub(".*:c.", "", X))
  #  X <- sub("\\\\.*", "",  X)
  
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous  <-   RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic"] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  #
  #RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange[which(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.Func.refGene != "exonic")] <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes <-  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes %>% 
    mutate(NTChange=ifelse(Func.refGene != "exonic",(sub(".*:c.", "",    RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$GeneDetail.refGene)),NTChange))
  # RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$NTChange <- (sub(".*:c.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$info.GeneDetail.refGene))
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange <- sub("\\\\.*", "",  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange)
  RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange[grepl("NM", RS2108_After_F_Filters_And_Selected_Panel_Green_Genes$NTChange, ignore.case=FALSE)] <- "."
  # 
  
  
  
  
  
 

  
}

if('Chr' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes, Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
}


if('ï..Chr' %in% colnames(RS2108))
{
  
  
  
  dt <- select(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes, ï..Chr, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, Otherinfo)
}

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes, CHROM, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.AF)
  
}

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}
dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'


if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if("Chr"  %in% colnames(dt) )
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if("CHROM"  %in% colnames(dt) )
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}


#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

#dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00

library(dplyr)
library(knitr)
library(kableExtra)
library(magrittr)
#webshot::install_phantomjs()


library("magick")

require("kableExtra")

if(nrow(dt) >0)
  
{
  
  dt %>%
    kbl(caption = paste(Family, " " ,"Remaining Panelapp Green Gene Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("table_3a" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)
  
}

if('Chr' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes, Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8 )
  
}

if('ï..Chr' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes, ï..Chr, Start, End, Gene.refGene, AAChange, NTChange , MaxF, Polyphen2_HDIV_pred, CADD_phred, SIFT_pred, GeneDetail.refGene, AAChange.refGene, Func.refGene, avsnp150, Otherinfo, X.8 )
  
}

if('CHROM' %in% colnames(RS2108))
  
{
  
  dt <- select(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes, CHROM, POS, info.Gene.refGene, AAChange, NTChange , MaxF, info.Polyphen2_HDIV_pred, info.CADD_phred, info.SIFT_pred, info.GeneDetail.refGene, info.AAChange.refGene, info.Func.refGene, ID, info.AF, FT )
  
}
#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))

if('CADD_phred' %in% colnames(dt))
{
  dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
  dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
}
if('info.CADD_phred' %in% colnames(dt))
{
  dt$info.CADD_phred <- sprintf("%.2f", round(as.numeric(dt$info.CADD_phred) ,2))
  dt$info.CADD_phred[dt$info.CADD_phred == "NA"] <- "."
}

dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'ï..Chr'] <- 'Chr'
colnames(dt)[colnames(dt) == 'CHROM'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MaxF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Polyphen2_HDIV_pred'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'info.CADD_phred'] <- 'CADD score'
colnames(dt)[colnames(dt) == 'info.SIFT_pred'] <- 'SIFT'
colnames(dt)[colnames(dt) == 'info.Gene.refGene'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Otherinfo'] <- 'Zygosity'
colnames(dt)[colnames(dt) == 'info.AF'] <- 'Zygosity'

if( ((! "gnomAD_exome_AMI"  %in% colnames(RS2108) )== TRUE ) & 'gnomAD_exome_ALL' %in% colnames(RS2108) ) 
  
{
  
  dt$Chr <- dt$Chr
  
}
#if("Chr"  %in% colnames(dt) )
else{
  
  dt$Chr <- gsub("^.{0,3}", "", dt$Chr)
  
}
if("CHROM"  %in% colnames(dt) )
{
  dt$CHROM <- gsub("^.{0,3}", "", dt$CHROM)
  
}



#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#dt$CADD_phred[is.na(dt$CADD_phred)] <- "."

#dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

#dt$Chr <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))
#dt$Chr[dt$Chr != 'X'] <- sprintf("%.0f", round(as.numeric(dt$Chr) ,0))

#dt$MaxF[dt$MaxF == 0] <- 0.00

library(dplyr)
library(knitr)
library(kableExtra)
library(magrittr)
#webshot::install_phantomjs()


library("magick")

require("kableExtra")

if(nrow(dt) >0)
  
{
  dt %>%
    kbl(caption = paste(Family, " " ,"Remaining Panelapp Green Gene Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("table_3a" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)
  
}


nrow(RS2108_After_F_Filters)
nrow(RS2108_After_F_Filters_And_Function)
nrow(RS2108_After_F_Filters_And_Function_And_Recessive)
nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)
nrow(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)
#Extracting the correct

#sub(".*p.", "", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene)  
#Same for NT and gene name, before or after, or use standalone gene name


#gsub(".*. (.+)  :*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene )

#sub(".*:c. *(.*?) *:p.*", "\\1", RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous$AAChange.refGene)

#edit(RS2108_After_F_Filters_And_Function_And_RecessiveOrHeterozygous_AND_Miscellaneous)

p1 <- qplot(Sepal.Length, Sepal.Width, data = iris) + theme_void() + geom_point(colour = "white")
# ggdraw() sets up a new coordinate system running from 0 to 1. This
# allows you to place an image on top of the plot.
p1 <- p1 + 
  draw_image("~/Test/panelapp-green-gene-vari.jpeg",
             x = 5, y = 2.5, width = 2, height = 1.5) +
  
  annotate(geom="text", x=5.855, y=3.73, size =2.7, label= Family,
           color="black")+
  
  annotate(geom="text", size = 3.5, x=5.855, y=3.58, label= paste("Original number of variants N = ", + nrow(RS2108)),
           color="white") +
  
  annotate(geom="text", x=5.855, y=3.32, size = 2.9, label= paste("Filtering for F of <0.01 N = ", + nrow(RS2108_After_F_Filters)),
           color="white") +
  
  
  annotate(geom="text", x=5.855, y=3.08, size = 2.05, label= paste("Functionality filtering N = ", + nrow(RS2108_After_F_Filters_And_Function)),
           color="white") +
  # annotate(geom="text", x=5.855, y=3, size = 2.3 ,label= paste("Others N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)),
  #           color="white")+
  annotate(geom="text", x=5.855, y=2.87, size = 0.8, label= paste("Panelapp Gene Match N = ", + nrow(RS2108_After_F_Filters_And_Selected_Panel_Green_Genes)),
           color="white")



ggsave(p1,height = 5.94, width = 8.12,filename=paste("Filter3a",Family,".png",sep=""))



}



#Now to 5'UTR


#setwd(~/)