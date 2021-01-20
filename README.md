# ONT-basecalling
![GitHub last commit](https://img.shields.io/github/last-commit/alemenze/trycycler-workflow)
[![Nextflow](https://img.shields.io/badge/nextflow%20DSL2-%E2%89%A520.11.0--edge-23aa62.svg?labelColor=000000)](https://www.nextflow.io/)
[![run with docker](https://img.shields.io/badge/run%20with-docker-0db7ed?labelColor=000000&logo=docker)](https://www.docker.com/)
[![run with singularity](https://img.shields.io/badge/run%20with-singularity-1d355c.svg?labelColor=000000)](https://sylabs.io/docs/)
[![run with GCP](https://img.shields.io/badge/run%20with-GCP-ffff00.svg?labelColor=000000&logo=googlecloud)](https://cloud.google.com/)
[![run with slurm](https://img.shields.io/badge/run%20with-slurm-ff4d4d.svg?labelColor=000000)](https://slurm.schedmd.com/)

## Description:
This workflow is built to provide basecalling, demultiplexing, and associated QC for Oxford Nanopore based projects. 

## Summary Features:
- Basecalling and demultiplexing with [guppy](https://community.nanoporetech.com/protocols/Guppy-protocol/v/gpb_2003_v1_revt_14dec2018)
- Sample and trimming QC with [pycoQC](https://adrienleger.com/pycoQC/), [fastp](https://github.com/OpenGene/fastp), [NanoPlot](https://github.com/wdecoster/NanoPlot), and [Filtlong](https://github.com/rrwick/Filtlong).
- Predictive QC and contaminant detection with [Kraken2](https://ccb.jhu.edu/software/kraken2/)

## Example Commands
### Slurm HPC execution
```
nohup nextflow -bg run alemenze/ONT-basecalling -profile slurm --input_dir ./fast5 --flowcell FLO-MIN106 --kit SQK-LSK109 --node_partition='main' --gpu_active --gpus 1 > run_num_log.txt
```