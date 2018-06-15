## Setup R error handling to go to stderr
options(show.error.messages=F, error=function(){cat(geterrmessage(),file=stderr());q("no",1,F)})
loc <- Sys.setlocale("LC_MESSAGES", "en_US.UTF-8")
## Import library
library("reshape2")
input <- read.csv('$input', sep='\t', header=TRUE)
minput <- melt(input)
write.table(minput, "output.tabular", sep="\t", quote=FALSE, row.names=FALSE)