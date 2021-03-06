#!/usr/bin/env nextflow

// Specify DSL2
nextflow.enable.dsl = 2

// Process definition
process pycoqc {
    tag "${sequencing_summary}"

    publishDir "${params.outdir}/pycoqc/${type}",
        mode: "copy",
        overwrite: true,
        saveAs: { filename -> filename }

    container "quay.io/biocontainers/pycoqc:2.5.0.23--py_0"

    input:
        path(sequencing_summary)
        val(type)

    output:
        path '*.html', emit: report

    script:    
        """
        pycoQC --summary_file $sequencing_summary --html_outfile pycoqc_report.html
        """
}