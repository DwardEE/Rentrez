# Initiate the NCBI IDs as a vector
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")
# Import rentrez
library(rentrez)
# Passes the ncbi_ids vector to obtain the FASTA files associated with each name
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
Sequences <- strsplit(Bburg, "\n\n")
Sequences <- unlist(Sequences)
#  Seperating the headers and the sequence and storing them in a dataframe
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
# Saving the sequences dataframe
write.csv(Sequences, "Sequences.csv")
