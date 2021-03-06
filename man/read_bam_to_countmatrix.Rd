% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_bam_to_countmatrix.R
\name{read_bam_to_countmatrix}
\alias{read_bam_to_countmatrix}
\title{read_bam_to_countmatrix}
\usage{
read_bam_to_countmatrix(sampleTable, gtffile, projectfolder = getwd(),
  outPrefix, singleEnd = FALSE, ignore.strand = TRUE, fragments = TRUE)
}
\arguments{
\item{sampleTable}{Sample Table. See Vignette for instructions on how to build this data frame.}

\item{gtffile}{GTF file.}

\item{projectfolder}{File path where to save the output to. Defaults to working directory. Here, it saves the output to a subfolder called "Networks".}

\item{outPrefix}{Prefix added to output name.}

\item{singleEnd}{A logical indicating if reads are single or paired-end. In Bioconductor > 2.12 it is not necessary to sort paired-end BAM files by qname. When counting with summarizeOverlaps, setting singleEnd=FALSE will trigger paired-end reading and counting. It is fine to also set asMates=TRUE in the BamFile but is not necessary when singleEnd=FALSE.}

\item{ignore.strand}{A logical indicating if strand should be considered when matching.}

\item{fragments}{A logical; applied to paired-end data only. fragments controls which function is used to read the data which subsequently affects which records are included in counting.
When fragments=FALSE, data are read with readGAlignmentPairs and returned in a GAlignmentPairs class. This class only holds 'mated pairs' from opposite strands; same-strand pairs singletons, reads with unmapped pairs and other fragments are dropped.
When fragments=TRUE, data are read with readGAlignmentsList and returned in a GAlignmentsList class. This class holds 'mated pairs' as well as same-strand pairs, singletons, reads with unmapped pairs and other fragments. Because more records are kept, generally counts will be higher when fragments=TRUE.
The term 'mated pairs' refers to records paired with the algorithm described on the ?readGAlignmentsList man page.}
}
\value{
Writes the count matrix as .txt to file and returns a DESeq data set, which can then be used further with DESeq2.
}
\description{
Reads in bam files and creates a count matrix based on a gtf file.
}
\details{
So far, it is only implemented for obtaining read counts for genes based on summarized counts of reads overlapping all exons of each gene.
}

