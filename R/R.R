# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(lubridate)

#Data Import
Adata_tbl <- read_delim(file = "../data/Aparticipants.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
Anotes_tbl <- read_delim(file = "../data/Anotes.csv", col_names = c("parnum", "notes"))
Bdata_tbl <- read_tsv(file = "../data/Bparticipants.dat", col_names = c("casenum", "parnum", "stimver", "datadate", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"))
Bnotes_tbl <- read_delim(file = "../data/Bnotes.txt", col_names = c("parnum", "notes"))
