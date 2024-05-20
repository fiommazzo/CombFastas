#Generate paired fastas from a list of Protein IDs

library(UniprotR)
library(utils)


protein_ID <- c("P23798", "Q99496", "Q8N488", 
                "Q14781", "O00257", "O95503",
                "P78364", "Q8IXK0", "Q8NDX5",
                "Q96GD3", "Q9UN30", "Q9UQR0") #list of Protein ID

tab <- combn(protein_ID, 2) #tab of protein pairs


for(i in 1:dim(tab)[2]){
  a <- tab[,i]
  assign(x = paste0(tab[,i][1], "_", tab[,i][2]), value = a)
}


fasta_list <- mget(ls())


for(i in 1:length(fasta_list)){
  UniprotR::GETSeqFastaUniprot(fasta_list[[i]],
                               FilePath = "/output/", 
                               FileName = names(fasta_list[i]))
} #retrieve fasta sequences



