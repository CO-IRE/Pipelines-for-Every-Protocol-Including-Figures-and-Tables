#RS2108 <- RS2256C_A_KO.SA.annovar.hg38_multianno_E_removed #File here e.g. RS2256 with nothing

#Need to link with others somehow.

#RS2108 <- read.table("~/Test/EveryFile/UTR/Output_annotated_VCFs_callum/Output_annotated_VCFs_callum/Files/RS1897C_MA_KA.filtered.vcf.anno.txt", sep = '\t', comment.char = "@", skip = 104, header = T)

#getwd()

files <- list.files(pattern = ".txt")

for (i in seq_along(files)) {
  
  #  Family <- i
  
  # name <- list.files(pattern = ".csv")
  
  
  # name <- read.csv(files[i])
  # Family <-  sub("_.*", "",  name)
  
  #Rename the columns as x.
  
  name <- files[i]
  Family <- sub("_.*", "", name)
  
  assign(paste("RS2108"), read.table(files[i], sep = '\t', comment.char = "@", skip = 104, header = T))

  RS2108 <- RS2108 %>% 
    mutate(Location2 = Location)
 # assign(paste("RS2108"), read.table("RS1851C_.filtered.vcf.anno.txt", sep = '\t', comment.char = "@", skip = 104, header = T))
#Just change the right of <- RS2108 was the first try so will always have that name.
#RS2108 <- RS2108 %>% replace("", '.')
#gsub("-", ".", RS2108)
#Low F sounds good.
RS2108_After_F_Filters <- RS2108[  #(RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
                                     (RS2108$AFR_AF == "-" | RS2108$AFR_AF < 0.01 ) &
                                     (RS2108$gnomAD_AF == "-" | RS2108$gnomAD_AF < 0.01 ) &
                                     (RS2108$AMR_AF == "-" | RS2108$AMR_AF < 0.01 ) &
                                     (RS2108$gnomAD_AFR_AF == "-" | RS2108$gnomAD_AFR_AF < 0.01 ) &
                                     (RS2108$EAS_AF == "-" | RS2108$EAS_AF < 0.01 ) &
                                   #  (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) &
                                     (RS2108$EUR_AF == "-" | RS2108$EUR_AF < 0.01 ) &
                                    # (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) &
                                    # (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) &
                                    # (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) & 
                                    # (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) &
                                    # (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) &
                                     (RS2108$AF == "-" | RS2108$AF < 0.01 ) &
                                     (RS2108$AA_AF == "-" | RS2108$AA_AF < 0.01 ) &
                                     (RS2108$gnomAD_FIN_AF == "-" | RS2108$gnomAD_FIN_AF < 0.01 ) &
                                     (RS2108$gnomAD_EAS_AF == "-" | RS2108$gnomAD_EAS_AF < 0.01 )  &
                                     (RS2108$gnomAD_AMR_AF == "-" | RS2108$gnomAD_AMR_AF < 0.01 ) &
                                     (RS2108$SAS_AF == "-" | RS2108$SAS_AF < 0.01 ) &
                                   #  (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) &
                                     (RS2108$EA_AF == "-" | RS2108$EA_AF < 0.01 ) &
                                     (RS2108$gnomAD_ASJ_AF == "-" | RS2108$gnomAD_ASJ_AF < 0.01) &
                                     (RS2108$gnomAD_NFE_AF== "-" | RS2108$gnomAD_NFE_AF < 0.01 ) &
                                     (RS2108$gnomAD_OTH_AF == "-" | RS2108$gnomAD_OTH_AF < 0.01 )  &
                                     (RS2108$gnomAD_SAS_AF == "-" | RS2108$gnomAD_SAS_AF < 0.01 ) &
                                     
                                  #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
                                     ( as.numeric(RS2108$SGUL_Exomes_AC) < 20 | RS2108$SGUL_Exomes_AC == "-") 
                                    # (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) &
                                    # (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) &
                                    # (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) &
                                   #  (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) &
                                    ## (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) &
                                   #  (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 ) &
                                   #  (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) &
                                  #   (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 )
                                    ,]




#Filter for function still a good idea if blanks included
#Only splice and 5'UTR containing functions
#Shoudl I include upstream?

#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant" | RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant,NMD_transcript_variant" |RS2108_After_F_Filters$Consequence == "." ) & (RS2108_After_F_Filters$VARIANT_CLASS == "frameshift deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "frameshift insertion" | RS2108_After_F_Filters$VARIANT_CLASS ==  "deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "insertion" | RS2108_After_F_Filters$VARIANT_CLASS == "SNV" | RS2108_After_F_Filters$VARIANT_CLASS == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[grep("5_prime_UTR|splice|-", RS2108_After_F_Filters$Consequence),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("deleterious|-", RS2108_After_F_Filters_And_Function$SIFT),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("damaging|-", RS2108_After_F_Filters_And_Function$PolyPhen),]
#No CADD available.
#Contains splice in consequence.
#Do Homo then hetero
#Filter for mode of inheritance - in this case recessive

RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$ZYG == "HOM" ,]
#**** hetero
#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
#Other miscellaneous ones
#Remove FLAGs and bad quality
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive[ !  RS2108_After_F_Filters_And_Function_And_Recessive$SYMBOL %in% FLAGGeneList,]
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[grep("Pass|-", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$SGUL_Exomes_FILTER),]

RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$five_prime_UTR_variant_consequence != "-",]
#Write something for FLAG genes to remove - common ones - in above keep adding as more found


#max af for table.

#Use MAXF already in table AND maybe traingles for output later. Then loop and run
#TABLE

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous))) , MARGIN=1, FUN=max)

RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR$AAChange <- (sub(".*p.", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR$HGVSp))
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR$NTChange <- (sub(".*:c.-", "", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR$HGVSc))

#max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))

#RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

#X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))


dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, five_prime_UTR_variant_consequence, ZYG)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MAX_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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
#Family <- "lemons"
#gsub("-", ".", dt)
{

dt %>%
  kbl(caption = paste(Family, " " ,"Remaining 5'UTR Homozygous Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("5-UTR" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

}
#### info table
dt <- select(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, MANE_SELECT, five_prime_UTR_variant_consequence, Existing_variation, ZYG, HGVSc, Location2, five_prime_UTR_variant_annotation)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MAX_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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
  kbl(caption = paste(Family, " " ,"Remaining 5'UTR Homozygous Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("5-UTR" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)

}

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
  annotate(geom="text", size = 1.3, x=6.02, y=2.7, label= paste("Others N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR)),
           color="white")



ggsave(p1, height = 5.94, width = 8.12, filename=paste("Filter1-5-UTR", Family,".png",sep=""))


#HETEROZYGOUS PROTOCOL BELOW

######
#2) AND 3) would still be the same, so are gone.

#Too many, so match to gene list

RS2108_After_F_Filters <- RS2108[  #(RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
  (RS2108$AFR_AF == "-" | RS2108$AFR_AF < 0.01 ) &
    (RS2108$gnomAD_AF == "-" | RS2108$gnomAD_AF < 0.01 ) &
    (RS2108$AMR_AF == "-" | RS2108$AMR_AF < 0.01 ) &
    (RS2108$gnomAD_AFR_AF == "-" | RS2108$gnomAD_AFR_AF < 0.01 ) &
    (RS2108$EAS_AF == "-" | RS2108$EAS_AF < 0.01 ) &
    #  (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) &
    (RS2108$EUR_AF == "-" | RS2108$EUR_AF < 0.01 ) &
    # (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) &
    # (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) &
    # (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) & 
    # (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) &
    # (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) &
    (RS2108$AF == "-" | RS2108$AF < 0.01 ) &
    (RS2108$AA_AF == "-" | RS2108$AA_AF < 0.01 ) &
    (RS2108$gnomAD_FIN_AF == "-" | RS2108$gnomAD_FIN_AF < 0.01 ) &
    (RS2108$gnomAD_EAS_AF == "-" | RS2108$gnomAD_EAS_AF < 0.01 )  &
    (RS2108$gnomAD_AMR_AF == "-" | RS2108$gnomAD_AMR_AF < 0.01 ) &
    (RS2108$SAS_AF == "-" | RS2108$SAS_AF < 0.01 ) &
    #  (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) &
    (RS2108$EA_AF == "-" | RS2108$EA_AF < 0.01 ) &
    (RS2108$gnomAD_ASJ_AF == "-" | RS2108$gnomAD_ASJ_AF < 0.01) &
    (RS2108$gnomAD_NFE_AF== "-" | RS2108$gnomAD_NFE_AF < 0.01 ) &
    (RS2108$gnomAD_OTH_AF == "-" | RS2108$gnomAD_OTH_AF < 0.01 )  &
    (RS2108$gnomAD_SAS_AF == "-" | RS2108$gnomAD_SAS_AF < 0.01 ) &
    
    #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
    ( as.numeric(RS2108$SGUL_Exomes_AC) < 20 | RS2108$SGUL_Exomes_AC == "-") 
  # (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) &
  # (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) &
  # (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) &
  #  (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) &
  ## (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) &
  #  (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 ) &
  #  (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) &
  #   (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 )
  ,]


#Filter for function still a good idea if blanks included
#Only splice and 5'UTR containing functions
#Shoudl I include upstream?

#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant" | RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant,NMD_transcript_variant" |RS2108_After_F_Filters$Consequence == "." ) & (RS2108_After_F_Filters$VARIANT_CLASS == "frameshift deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "frameshift insertion" | RS2108_After_F_Filters$VARIANT_CLASS ==  "deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "insertion" | RS2108_After_F_Filters$VARIANT_CLASS == "SNV" | RS2108_After_F_Filters$VARIANT_CLASS == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[grep("5_prime_UTR|splice|-", RS2108_After_F_Filters$Consequence),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("deleterious|-", RS2108_After_F_Filters_And_Function$SIFT),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("damaging|-", RS2108_After_F_Filters_And_Function$PolyPhen),]
#No CADD available.
#Contains splice in consequence.
#Do Homo then hetero
#Filter for mode of inheritance - in this case recessive

#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$ZYG == "HOM" ,]
#**** hetero
RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
#Other miscellaneous ones
#Remove FLAGs and bad quality
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive[ !  RS2108_After_F_Filters_And_Function_And_Recessive$SYMBOL %in% FLAGGeneList,]
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[grep("Pass|-", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$SGUL_Exomes_FILTER),]

RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$five_prime_UTR_variant_consequence != "-",]
#Write something for FLAG genes to remove - common ones - in above keep adding as more found



RS2108_5UTR_Gene_List_Homozygous_Only <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR$SYMBOL %in% GeneList,]
#####


#Use MAXF already in table AND maybe traingles for output later. Then loop and run
#TABLE

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous))) , MARGIN=1, FUN=max)

RS2108_5UTR_Gene_List_Homozygous_Only$AAChange <- (sub(".*p.", "", RS2108_5UTR_Gene_List_Homozygous_Only$HGVSp))
RS2108_5UTR_Gene_List_Homozygous_Only$NTChange <- (sub(".*:c.-", "", RS2108_5UTR_Gene_List_Homozygous_Only$HGVSc))

#max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))

#RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

#X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))


dt <- select(RS2108_5UTR_Gene_List_Homozygous_Only, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, five_prime_UTR_variant_consequence, ZYG)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Max_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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


#Family <- "lemons"
#gsub("-", ".", dt)

if(nrow(dt) >0)
  
{

dt %>%
  kbl(caption = paste(Family, " " ,"Remaining 5'UTR Heterozygous Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("5-UTR_Het" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)

}
#### info table
dt <- select(RS2108_5UTR_Gene_List_Homozygous_Only, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, MANE_SELECT, five_prime_UTR_variant_consequence, Existing_variation, ZYG, HGVSc, Location2, five_prime_UTR_variant_annotation)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Max_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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
  kbl(caption = paste(Family, " " ,"Remaining 5'UTR Heterozygous Variants")) %>%
  kable_classic(full_width = F, html_font = "Cambria") %>%
  #  kable(row.names = F) %>%
  column_spec(2, italic = T) %>%
  #  column_spec(4, italic = T) %>%
  save_kable(file = paste("5-UTR_Het" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)

}


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
  annotate(geom="text", x=5.855, y=3, size = 2.3 ,label= paste("Others N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR)),
           color="white")+
  annotate(geom="text", x=5.855, y=2.83, size = 1, label= paste("Gene Match N = ", + nrow(RS2108_5UTR_Gene_List_Homozygous_Only)),
           color="white")



ggsave(p1,height = 5.94, width = 8.12,filename=paste("Filter1a",Family,".png",sep=""))

#GreenGenes - no QC or hom/het

######
#2) AND 3) would still be the same, so are gone.

#Too many, so match to gene list

RS2108_After_F_Filters <- RS2108[  #(RS2108$gnomAD3_exome_ALL == "." | RS2108$gnomAD3_exome_ALL < 0.01 ) &
  (RS2108$AFR_AF == "-" | RS2108$AFR_AF < 0.01 ) &
    (RS2108$gnomAD_AF == "-" | RS2108$gnomAD_AF < 0.01 ) &
    (RS2108$AMR_AF == "-" | RS2108$AMR_AF < 0.01 ) &
    (RS2108$gnomAD_AFR_AF == "-" | RS2108$gnomAD_AFR_AF < 0.01 ) &
    (RS2108$EAS_AF == "-" | RS2108$EAS_AF < 0.01 ) &
    #  (RS2108$gnomAD3_exome_FEMALE == "." | RS2108$gnomAD3_exome_FEMALE < 0.01 ) &
    (RS2108$EUR_AF == "-" | RS2108$EUR_AF < 0.01 ) &
    # (RS2108$gnomAD3_exome_MALE == "." | RS2108$gnomAD3_exome_MALE < 0.01 ) &
    # (RS2108$gnomAD3_exome_OTH == "." | RS2108$gnomAD3_exome_OTH < 0.01 ) &
    # (RS2108$gnomAD3_exome_NFE == "." | RS2108$gnomAD3_exome_NFE < 0.01 ) & 
    # (RS2108$gnomAD_genome_ALL == "." | RS2108$gnomAD_genome_ALL < 0.01 ) &
    # (RS2108$gnomAD_genome_POPMAX == "." | RS2108$gnomAD_genome_POPMAX < 0.01 ) &
    (RS2108$AF == "-" | RS2108$AF < 0.01 ) &
    (RS2108$AA_AF == "-" | RS2108$AA_AF < 0.01 ) &
    (RS2108$gnomAD_FIN_AF == "-" | RS2108$gnomAD_FIN_AF < 0.01 ) &
    (RS2108$gnomAD_EAS_AF == "-" | RS2108$gnomAD_EAS_AF < 0.01 )  &
    (RS2108$gnomAD_AMR_AF == "-" | RS2108$gnomAD_AMR_AF < 0.01 ) &
    (RS2108$SAS_AF == "-" | RS2108$SAS_AF < 0.01 ) &
    #  (RS2108$gnomAD_genome_MALE == "." | RS2108$gnomAD_genome_MALE < 0.01 ) &
    (RS2108$EA_AF == "-" | RS2108$EA_AF < 0.01 ) &
    (RS2108$gnomAD_ASJ_AF == "-" | RS2108$gnomAD_ASJ_AF < 0.01) &
    (RS2108$gnomAD_NFE_AF== "-" | RS2108$gnomAD_NFE_AF < 0.01 ) &
    (RS2108$gnomAD_OTH_AF == "-" | RS2108$gnomAD_OTH_AF < 0.01 )  &
    (RS2108$gnomAD_SAS_AF == "-" | RS2108$gnomAD_SAS_AF < 0.01 ) &
    
    #   (RS2108$CADD_phred == "." | RS2108$CADD_phred > 18 ) &
    ( as.numeric(RS2108$SGUL_Exomes_AC) < 20 | RS2108$SGUL_Exomes_AC == "-") 
  # (RS2108$GME_AF == "." | RS2108$GME_AF < 0.01 ) &
  # (RS2108$GME_AP == "." | RS2108$GME_AP < 0.01 ) &
  # (RS2108$GME_NWA == "." | RS2108$GME_NWA < 0.01 ) &
  #  (RS2108$GME_NEA == "." | RS2108$GME_NEA < 0.01 ) &
  ## (RS2108$GME_Israel == "." | RS2108$GME_Israel < 0.01 ) &
  #  (RS2108$GME_SD == "." | RS2108$GME_SD < 0.01 ) &
  #  (RS2108$GME_TP == "." | RS2108$GME_TP < 0.01 ) &
  #   (RS2108$GME_CA == "." | RS2108$GME_CA < 0.01 )
  ,]


#Filter for function still a good idea if blanks included
#Only splice and 5'UTR containing functions
#Shoudl I include upstream?

#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant" | RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant,NMD_transcript_variant" |RS2108_After_F_Filters$Consequence == "." ) & (RS2108_After_F_Filters$VARIANT_CLASS == "frameshift deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "frameshift insertion" | RS2108_After_F_Filters$VARIANT_CLASS ==  "deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "insertion" | RS2108_After_F_Filters$VARIANT_CLASS == "SNV" | RS2108_After_F_Filters$VARIANT_CLASS == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[grep("5_prime_UTR|splice|-", RS2108_After_F_Filters$Consequence),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("deleterious|-", RS2108_After_F_Filters_And_Function$SIFT),]
RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("damaging|-", RS2108_After_F_Filters_And_Function$PolyPhen),]
#No CADD available.
#Contains splice in consequence.
#Do Homo then hetero
#Filter for mode of inheritance - in this case recessive

#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$ZYG == "HOM" ,]
#**** hetero
RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
#Other miscellaneous ones
#Remove FLAGs and bad quality
#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <-  RS2108_After_F_Filters_And_Function_And_Recessive[ !  RS2108_After_F_Filters_And_Function_And_Recessive$SYMBOL %in% FLAGGeneList]
#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[grep("Pass|-", RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$SGUL_Exomes_FILTER),]
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive
RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR <-  RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$five_prime_UTR_variant_consequence != "-",]
#Write something for FLAG genes to remove - common ones - in above keep adding as more found



RS2108_5UTR_Green_Genes <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR[RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR$SYMBOL %in% GeneListNHS,]
#####


#Use MAXF already in table AND maybe traingles for output later. Then loop and run
#TABLE

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous <- RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous %>% select(-contains(c('NHOM', 'Filter', 'NHET', 'ALL_AC')))

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous))) , MARGIN=1, FUN=max)

RS2108_5UTR_Green_Genes$AAChange <- (sub(".*p.", "", RS2108_5UTR_Green_Genes$HGVSp))
RS2108_5UTR_Green_Genes$NTChange <- (sub(".*:c.-", "", RS2108_5UTR_Green_Genes$HGVSc))

#max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))

#RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

#X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))


dt <- select(RS2108_5UTR_Green_Genes, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, five_prime_UTR_variant_consequence, ZYG)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Max_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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


#Family <- "lemons"
#gsub("-", ".", dt)

if(nrow(dt) >0)
  
{
  
  dt %>%
    kbl(caption = paste(Family, " " ,"Remaining 5'UTR Panelapp Green Gene Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("5-UTR_Green" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)
  
}
#### info table
dt <- select(RS2108_5UTR_Green_Genes, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, MANE_SELECT, five_prime_UTR_variant_consequence, Existing_variation, ZYG, HGVSc, Location2, five_prime_UTR_variant_annotation)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'Max_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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
    kbl(caption = paste(Family, " " ,"Remaining 5'UTR Panelapp Green Gene Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("5-UTR_Green" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)
  
}


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
  
  
  annotate(geom="text", x=5.855, y=3.08, size = 2.05, label= paste("Functionality filtering N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous_AND_5UTR)),
           color="white") +
  # annotate(geom="text", x=5.855, y=3, size = 2.3 ,label= paste("Others N = ", + nrow(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)),
  #           color="white")+
  annotate(geom="text", x=5.855, y=2.87, size = 0.8, label= paste("Panelapp Gene Match N = ", + nrow(RS2108_5UTR_Green_Genes)),
           color="white")



ggsave(p1,height = 5.94, width = 8.12,filename=paste("Filter3a",Family,".png",sep=""))



##### CLINSIG


#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[(RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant" | RS2108_After_F_Filters$Consequence == "5_prime_UTR_variant,NMD_transcript_variant" |RS2108_After_F_Filters$Consequence == "." ) & (RS2108_After_F_Filters$VARIANT_CLASS == "frameshift deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "frameshift insertion" | RS2108_After_F_Filters$VARIANT_CLASS ==  "deletion" | RS2108_After_F_Filters$VARIANT_CLASS == "insertion" | RS2108_After_F_Filters$VARIANT_CLASS == "SNV" | RS2108_After_F_Filters$VARIANT_CLASS == ".")  &  (RS2108_After_F_Filters$Polyphen2_HDIV_pred == "D" | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "." | RS2108_After_F_Filters$Polyphen2_HDIV_pred == "P") & (RS2108_After_F_Filters$SIFT_pred == "D" | RS2108_After_F_Filters$SIFT_pred == "."),]
#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters[grep("5_prime_UTR|splice|-", RS2108_After_F_Filters$Consequence),]
#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("deleterious|-", RS2108_After_F_Filters_And_Function$SIFT),]
#RS2108_After_F_Filters_And_Function <- RS2108_After_F_Filters_And_Function[grep("damaging|-", RS2108_After_F_Filters_And_Function$PolyPhen),]
#No CADD available.
#Contains splice in consequence.
#Do Homo then hetero
#Filter for mode of inheritance - in this case recessive

#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function[RS2108_After_F_Filters_And_Function$ZYG == "HOM" ,]
#**** hetero
#RS2108_After_F_Filters_And_Function_And_Recessive <- RS2108_After_F_Filters_And_Function
#Other miscellaneous ones
#Remove FLAGs and bad quality
RS2108_After_CLINSIG_Filters <- RS2108[RS2108$CLIN_SIG == "pathogenic" | RS2108$CLIN_SIG == "likely_pathogenic" ,]
RS2108_After_CLINSIG_Filters <-  RS2108_After_CLINSIG_Filters[RS2108_After_CLINSIG_Filters$five_prime_UTR_variant_consequence != "-",]

#RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous$MaxF <-apply(X= RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous%>% dplyr:: select(grep("gnomAD", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous)), grep("GME", names(RS2108_After_F_Filters_And_Function_And_Recessive_AND_Miscellaneous))) , MARGIN=1, FUN=max)

RS2108_After_CLINSIG_Filters$AAChange <- (sub(".*p.", "", RS2108_After_CLINSIG_Filters$HGVSp))
RS2108_After_CLINSIG_Filters$NTChange <- (sub(".*:c.-", "", RS2108_After_CLINSIG_Filters$HGVSc))

#max(na.omit(na.omit(RS2108_After_Filters_For_Top_Genes$gnomAD_exome_AFR)))

#RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))

#X <- RS2108_After_Filters_For_Top_Genes%>% dplyr:: select(starts_with("gnomAD"))


dt <- select(RS2108_After_CLINSIG_Filters, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, five_prime_UTR_variant_consequence, CLIN_SIG, ZYG)

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MAX_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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
  #Family <- "lemons"
  #gsub("-", ".", dt)
{
  
    dt %>%
    kbl(caption = paste(Family, " " ,"Remaining ClinVar Selected Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
     # column_spec(4, italic = T) %>%
    save_kable(file = paste("5-UTR-ClinVar" ,"_" , Family , ".png"), bs_theme = "flatly", zoom = 1.5)
  
}
#### info table
dt <- select(RS2108_After_CLINSIG_Filters, Location, SYMBOL, AAChange, NTChange , MAX_AF, PolyPhen, SIFT, MANE_SELECT, five_prime_UTR_variant_consequence, Existing_variation, CLIN_SIG, ZYG, HGVSc, Location2, five_prime_UTR_variant_annotation )

#max(as.numeric(na.omit(dt$Polyphen2_HDIV_pred)), as.numeric(na.omit(dt$SIFT_pred)))
#dt$CADD_phred <- sprintf("%.2f", round(as.numeric(dt$CADD_phred) ,2))
#dt$CADD_phred[dt$CADD_phred == "NA"] <- "."
#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))
#dt$Chr <- round(as.numeric(dt$Chr) ,0)

#dt[is.na(dt)] <- "."
#dt$MaxF[dt$MaxF == "NA"] <- "."
row.names(dt) <- NULL

colnames(dt)[colnames(dt) == 'Location'] <- 'Chr'
colnames(dt)[colnames(dt) == 'AAChange'] <- 'AA Change'
colnames(dt)[colnames(dt) == 'NTChange'] <- 'NT Change'
colnames(dt)[colnames(dt) == 'SYMBOL'] <- 'Gene'
colnames(dt)[colnames(dt) == 'MAX_AF'] <- 'Max F'
colnames(dt)[colnames(dt) == 'PolyPhen'] <- 'PolyPhen2'
colnames(dt)[colnames(dt) == 'five_prime_UTR_variant_consequence'] <- '5-UTR Alteration'
colnames(dt)[colnames(dt) == 'SIFT'] <- 'SIFT'





#dt <- dt %>% replace(is.na(dt), '.')

#dt$MaxF <- sprintf("%.2f", round(as.numeric(dt$MaxF) ,2))

#  dt$CADD_phred[is.na(dt$CADD_phred)] <- "."
dt$Chr <- sub('\\:.*', '', dt$Chr)
dt$Chr <- gsub("^.{0,3}", "", dt$Chr)

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
    kbl(caption = paste(Family, " " , "Remaining ClinVar Selected Variants")) %>%
    kable_classic(full_width = F, html_font = "Cambria") %>%
    #  kable(row.names = F) %>%
    column_spec(2, italic = T) %>%
    #  column_spec(4, italic = T) %>%
    save_kable(file = paste("5-UTR_ClinVar" ,"_" , Family , ".html"), bs_theme = "flatly", zoom = 1.5)
  
}



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











}
