# Nextflow Hackathon

##  Joint Morning Session: Nextflow 101 (joint, Boehm SR, 9:30-12:30)
Goal: Understand structure of nf-file and key concepts (Channels, Processes, Operators)

Reference: https://training.nextflow.io/basic_training/intro/
- [ ] practical work through intro (hello_world.nf)
- [ ] customisation and adaptation
    - [ ] add parameters: e.g. params.name ("Hello $name")
    - [ ] add processes: to print "uname -a and process-ID" 
    - [ ] process directives:
           - [ ] control processes locally and globally (cpus, memory, container) 
           - [ ] use container from dockerhub (global or process-wise) 
- [ ] configuration: run on slurm
- [ ] workflow on github and test
```bash
  nextflow run  github.com/maxplanck-ie/testflow --params ... -with-apptainer
```

## Lunch (12:30 - 13:30): Pizza @ Boehm SR
- [ ] Make your selection here: https://pizzamonalisa.de

## Afternoon (13:30:15:30): Real Workflows

Goals:
 - employ other workflows with singularity, locally and with slurm (queue test)

### Group 1: Epi2Me,  wf_alignment (DNA)
Challenge: Can we make this work with singularity and slurm?
- [ ] Input: basecalled BAM  (downsampled, drosophila)
- [ ] Output: alignment BAM + QC
- [ ] run wf_alignment (dm6) with apptainer (identify approrpiate container)
- [ ] Extensions?  
   - [ ] add process (e.g. samtools flagstat)
   - [ ] send email upon completion

### Group 2:  nf-core,  nanoseq (RNA)
Challenge: Can we predict RNA modifications? (--> m6anet; skip all other analyses)
- [ ] Input: samplesheet.csv, pod5/fast5 (subsampled)
- [ ] Output:  methylation calls: data.result.csv.gz 

## Final Meeting (16:00): Boehm SR
exchange workflows, test runs & final discussion


## Examples

```bash
module load nextflow/23.10.0 
nextflow run -with-apptainer docker://ubuntu:20.04 sources/tutorial.nf 

# test runs without modification calling
nextflow run nf-core/nanoseq -profile test,singularity

# couldn't get to work
nextflow run ~/.nextflow/assets/epi2me-labs/wf-alignment  --bam data/bam --references /data/repository/organisms/dm6_flybase_r6.12/genome_fasta -with-singularity ontresearch/wf-alignment -without-docker
```


## References:
- https://nextflow.io/
- https://training.nextflow.io/basic_training/
- video (RNA-seq with salmon) https://www.youtube.com/watch?v=1TbVpMjQUtU
- gitpod: https://gitpod.io/#https://github.com/nextflow-io/training

- https://github.com/epi2me-labs/wf-alignment
- https://hub.docker.com/r/ontresearch/wf-alignment
- 
- https://nf-co.re/nanoseq/3.1.0

