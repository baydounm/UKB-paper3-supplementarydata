library(ggplot2)
library(ggrepel)
library(readstata13)

# install.packages("ggrepel")
# install.packages("readstata13")

# setwd("T:\\LEPS\\NES\\newStaff\\OSORIO\\UKB_May_collaboration\\May_project_20230112")
setwd("/zdsk/Manuscripts/Baydoun/UK-BioBank/2023-03-01--03--Life8-Infect-AD/2023-03-01")

#------------------------------------ my code starts here ---------------------------------------#
#----- read first sheet "not hospitalized" (currently in Excel but I waill save it into csv ) ---#
#----- read second sheet "hospitalized"    (currently in Excel but I waill save it into csv ) ---#
#----- read Outputdata_overall_F_INFECTIONPARMS.dta (an output file in STATA format) ------------#

#------ read weight file (this is the file merge from the hosp. no hosp files above ) -------#
A <- read.csv("Weight_for_plots.csv")
#------ read STATA output file --------#
datObj = read.dta13("Outputdata_overall_F_INFECTIONPARMS.dta")

#----- create ID to match A -----#
datObj$ID = substr(datObj$parm,4,9)

#---- merge A and datObj and save into B and back to datObj ----#
B = merge(datObj,A) ; head(B) ; datObj = B

#----- merge datObjs (first creat an ID to be merged) with both Excel files using different names for each mean --------#
#----- make sure ID's in Excel match ID's in datOBj --------------------#
#----- now datOBj has mean1 and mean2 (Hosp and notHosp) ---------------#
#----- get the greater of the two means (say mean_larger_of_both )------#

#----- make circles from volcano plot proportional to the new variable "wp" ------#
#----- Let X be the mean of larger than hosp and non-hosp
#----- W = 3*(X/avg(X)) ;  wp = 1+floor(log2(1+W))

datObj$EffSize   = factor((datObj$estimate > -0.69) + (datObj$estimate > 0.69), 0:2, c('LnOR < .69', '0.69 ≤ LnOR ≤ 0.69', 'LnOR > 0.69'))

datObj$label      = sub('_0_0_yn', '', datObj$parm)
datObj$label      = sub('ts_',     '', datObj$label)

head(datObj)

datObj$pLog = log10(datObj$p)
nrow(datObj)
summary(datObj)

datObj = subset(datObj, p>0)
nrow(datObj)
summary(datObj)

Volcano = function() ggplot(data=datObj, aes(x=estimate, y=-log10(p), label=label, col=EffSize)) +
	geom_point(aes(size = wp)) +
	geom_text_repel(size=3) +
	labs(x='Ln(Odds ratio)') +
	labs(size='Proportional prevalence') +
	labs(col='Effect size') +
	theme_minimal() +
	theme(legend.position = c(0.85, 0.75), legend.text.align=0) +
	scale_color_manual(values=c("blue", "black", "red"), labels=c('LnOR < .69', expression('0.69 <= LnOR <= 0.69'), 'LnOR > 0.69')) +
	geom_hline(yintercept=-log10(0.05/132), col="gray", linetype=2)

pdf("volcano_plot.pdf")
Volcano()
jnk = dev.off()

png("volcano_plot.png")
Volcano()
jnk = dev.off()
