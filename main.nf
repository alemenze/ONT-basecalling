#!/usr/bin/env nextflow
/*
                              (╯°□°)╯︵ ┻━┻

========================================================================================
                Basecalling and Demultiplexing workflow for ONT data
========================================================================================
                  https://github.com/alemenze/ONT-basecalling
*/

nextflow.enable.dsl = 2

def helpMessage(){
    log.info"""

    Usage:
    
        nextflow run alemenze/ONT-basecalling \
        --input_dir ./fast5/ \
        --flowcell FLO-MIN106 \
        --kit SQK-LSK109 \
        --barcode_kit EXP-NBD104 EXP-NBD114 \
        -profile singularity

    Mandatory for full workflow:
        --input_dir                 Path to directory of .FAST5 files off the ONT device
        --flowcell                  Flowcell type for guppy demux. Standard FLO-MIN106
        --kit                       ONT kit for guppy demux. Standard SQK-LSK109
        -profile                    Currently available for docker (local), singularity (HPC local), slurm (HPC multi node) and GCP (requires credentials)
    
    Guppy parameters:
        --barcode_kit               Barcode kit used for multiplexing with ONT. Defaults to 'EXP-NBD104 EXP-NBD114'
        --gpu_active                Default: False. Activates use of GPUs
        --gpus                      Number of GPUs to use. Requires GPUs to use. Defaults to 0
        --cpus                      Number of CPUs to use. Defaults to 2
        --threads                   Number of threads per CPU to use. Defaults to 20

    Kraken QC:
        --kraken_db                 Default: Standard DB from https://genome-idx.s3://genome-idx/kraken/k2_standard_20201202.tar.gz that can be found https://benlangmead.github.io/aws-indexes/k2
        --kraken_tax_level          Default: S. Options Include D, K, P, C, O, F, G, S for respective taxonomic rank

    Optional:
        --outdir                    Directory for output directories/files. Defaults to './results'  

    GCP Options:
        --google_bucket             <gs://bucket/subfolder/> to stage running files. 
        --google_preemptible        Defaults to false. You can change this to true to get better cost savings, but nodes can be taken
        
    """

}

// Show help message
if (params.help) {
    helpMessage()
    exit 0
}


////////////////////////////////////////////////////
/* --              Parameter setup             -- */
////////////////////////////////////////////////////

////////////////////////////////////////////////////
/* --              IMPORT MODULES              -- */
////////////////////////////////////////////////////

////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

// Full workflow demultiplexing through Trycycler
workflow {
    include { Demux_Only } from './modules/main_workflows/demux_only'
    Demux_Only()
}