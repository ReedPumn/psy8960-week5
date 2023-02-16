# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)
library(lubridate)

#Data Import
Adata_tbl <- read_delim(file = "../data/Aparticipants.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
Anotes_tbl <- read_delim(file = "../data/Anotes.csv", col_names = c("parnum", "notes"), skip = 1)
Bdata_tbl <- read_tsv(file = "../data/Bparticipants.dat", col_names = c("casenum", "parnum", "stimver", "datadate", "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9", "q10"))
Bnotes_tbl <- read_delim(file = "../data/Bnotes.txt", col_names = c("parnum", "notes"), skip = 1)

#Data Cleaning
Aclean_tbl <- Adata_tbl %>%
  separate(col = qs, into = c("q1", "q2", "q3", "q4", "q5"), sep = " - ") %>%
  mutate(datadate = parse_date_time(Adata_tbl$datadate, c("%b %d %Y, %H:%M:%S"))) %>%
  mutate(across(contains("q"), ~ as.integer(.))) %>%
  full_join(Anotes_tbl, by = "parnum") %>%
  subset(is.na(notes))
ABclean_tbl <- Bdata_tbl %>%
  mutate(datadate = parse_date_time(Bdata_tbl$datadate, c("%b %d %Y, %H:%M:%S"))) %>%
  mutate(across(contains("q"), ~ as.integer(.))) %>%
  full_join(Bnotes_tbl, by = "parnum") %>%
  subset(is.na(notes)) %>%
  select(casenum:q10) %>%
  full_join(Aclean_tbl, by = "parnum") #I will add the "lab" column code if I figure it out.