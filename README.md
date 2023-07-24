# UKB-paper3-supplementarydata
Supplementary data and materials for UK Biobank manuscript entitled: "Cardiovascular health, infection burden and dementia incidence in the UK biobank" by Hind A. Beydoun and colleagues. 

Two folders named FIGURES and STATA_SCRIPT can be downloaded and their structure is below. FIGURE1 under FIGURES, included the Stata FIGURE1.gph file from Stata.
FIGURE3 sub-folder under FIGURES folder includes all the materials needed to generate the volcano plot and also includes the R script for the plot which uses both a *.dta Stata dataset and an excel sheet named "Weight_for_plot" derived from DATASHEET1_INFECTIONBURDEN_HOSPNOHOSP.xlx and more directly from INFECTION_HOSPNOHOSP.dta, which includes the prevalence of infections within the hospital-treated and non-hospital treated infection groups. 
FIGURES2 is supplementary Figure2.gph file. OUTPUT and OUTPUT2 contains some Stata output for main analysis and sensitivity analysis (excluding participants with <3 y of follow-up), respectively. 



├── FIGURES
│   ├── FIGURE1
│   │   ├── FIGURE1.gph
|   ├── FIGURE2
│   │   └──DATASHEET1_INFECTIONBURDEN_HOSPNOHOSP.xlx
│   │   └──FIGURE2_TOPHITS.txt
│   │   └──INFECTION_HOSPNOHOSP.dta
│   │   └──Outputdata_overall_F_INFECTIONPARMS.dta
│   │   └──R_SCRIPT_OSORIO_Z_FINAL.R
│   │   └──volcano_plot_FINALIZED.pdf
│   │   └──Weight_for_plots.xlx
└
└   ├──FIGURES2
       └── FIGURES2fin.gph
└─ STATA_SCRIPT
    └── UKB_PAPER3_LE8INFECTDEM_FINALIZED_GITHUB.do
└─OUTPUT
└─OUTPUT2
