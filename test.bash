trimmomatic PE -threads 2 data/raw_reads/2_S2_R1_001.fastq.gz data/raw_reads/2_S2_R2_001.fastq.gz output/trimmed_files/2_S2_R1_trimmed.fastq output/trimmed_files/2_S2_R1_trimmed_unpaired.fastq output/trimmed_files/2_S2_R2_trimmed.fastq output/trimmed_files/2_S2_R2_trimmed_unpaired.fastq ILLUMINACLIP:data/adapters/NexteraPE-PE.fa:2:30:10:1:true TRAILING:3 SLIDINGWINDOW:4:15


bowtie2-build chr1.fa,chr2.fa,chr3.fa,chr4.fa,chr5.fa,chr6.fa,chr7.fa,chr8.fa,chr9.fa,chr10.fa,chr11.fa,chr12.fa,chr13.fa,chr14.fa,chr15.fa,chr16.fa,chr17.fa,chr18.fa,chr19.fa mouse_vn_chrN

bowtie2-build chrM.fa mouse_vn_chrM.fa



bowtie2 -p 4 -X 2000 --very-sensitive -x mouse_vn_chrM -1 output/trimmed_files/2_S2_R1_trimmed.fastq -2 output/trimmed_files/2_S2_R2_trimmed.fastq -S temp_files/A_tempM.sam --un-conc temp_files/A_noM_fastq
