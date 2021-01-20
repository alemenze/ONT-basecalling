#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

////////////////////////////////////////////////////
/* --              Parameter setup             -- */
////////////////////////////////////////////////////

if (params.input_dir) { ch_input_dir = Channel.fromPath(params.input_dir, checkIfExists: true)} else { exit 1, 'Please specify a valid run directory for Guppy!' }

////////////////////////////////////////////////////
/* --              IMPORT MODULES              -- */
////////////////////////////////////////////////////

include { Demux } from '../subworkflows/demux'
include { Kraken } from '../subworkflows/kraken'

////////////////////////////////////////////////////
/* --           RUN MAIN WORKFLOW              -- */
////////////////////////////////////////////////////

workflow Demux_Only {
    Demux(
        ch_input_dir
    )
    Kraken(
        Demux.out.reads,
        'Kraken'
    )
} 

