1_To direct my directory<<
  set.dir(input= C:\Users\magdy.eissa\Downloads\safa\metagenomics,output=.\test2)
2_ create stability file<<<
  3_to merge read with its reverse    paired
make.contigs(file= C:\Users\magdy.eissa\Downloads\safa\metagenomics\stability.files, processors=8)
4_ to get summary last file
summary.seqs(fasta=current)
5_ to filter the results or sequences according to Length, ambig and polymer
screen.seqs(fasta=current,group=current,maxambig=0,maxhomop=8,maxlength=300)
6_ to summery the filtration 
summary.seqs(fasta=current)
7_ to know how many reads in each sample
count.groups(group=current)
8_ to get the unique sequence 
unique.seqs(fasta=current)
9_summery after unique
summary.seqs(fasta=current)
10_ summery of unique with total seq
summary.seqs(fasta=current,name=current)
11-Merge names and groups to get count_table [ open on excel ] no of sequences = 16421, sum of their totals
count.seqs(name=current, group=current)
12_to decrease size of reference 
pcr.seqs(fasta= "C:\Users\magdy.eissa\Downloads\safa\metagenomics\silva bacteria\silva.bacteria.fasta", start=11894, end=25319, keepdots=F, processors=8)
13_ rename reference file
rename.file(input=silva.bacteria.pcr.fasta, new=silva.v4.fasta)
14_to align my filtered seq with reference
align.seqs(fasta=C:\Users\magdy.eissa\Downloads\safa\test2\stability.trim.contigs.good.unique.fasta,reference= C:\Users\magdy.eissa\Downloads\safa\test2\silva.v4.fasta)
14) filter to get all sequences begin at same start and end at same end
screen.seqs(fasta=current, count=current, start=6000, end=9000)
15) Summery
summary.seqs(fasta=current)
16) To remove gaps in the file
filter.seqs(fasta=C:\Users\magdy.eissa\Downloads\safa\test2\stability.trim.contigs.good.unique.good.align, vertical=T, trump=.)
17) summery
summary.seqs(fasta=current,count=current)
18- after remove gaps, some sequences are produced like each others
unique.seqs(fasta=current,count=current)
18) denoising
pre.cluster(fasta=current, count=current, diffs=2)
19- chimera search
chimera.vsearch(fasta=current,count=current,dereplicate=t)
20- #remove sequences that have chimera
  remove.seqs(fasta=current,accnos=current)
21- direct to OTU
#determine distance
dist.seqs(fasta=current,cutoff=0.03)
22- clustering, column means dist file 
cluster(column=current,count=current)
23 shared, list means output of cluster
make.shared(list=current,count=current,label=0.03)
24- alpha diversity
summary.single(shared=current)
26- rarefaction
#rarefaction.single(shared=current, feq=500)
27- beta diversity
dist.shared(shared=current, calc=thetayc-jclass, subsample=t)
pcoa(phylip=current)
28 amova(phylip=current,design=mouse.time.design)




