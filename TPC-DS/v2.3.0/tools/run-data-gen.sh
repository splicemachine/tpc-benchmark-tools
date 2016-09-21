#!/bin/bash
SCALE=100
DIR=/data/TPCDS/${SCALE}
mkdir -p ${DIR}

for i in {1..10}
do
    ./dsdgen -DIR ${DIR} -QUIET Y -SCALE ${SCALE} -PARALLEL 10 -CHILD ${i} -VERBOSE N -RELEASE N -_FILTER N -VALIDATE N -FORCE Y -TERMINATE Y -RNGSEED 0 &
done



# dsdgen Population Generator (Version 2.3.0)                                                                                                                                                                         │
# Copyright Transaction Processing Performance Council (TPC) 2001 - 2016                                                                                                                                              │
# USAGE: dsdgen [options]                                                                                                                                                                                             │
# Note: When defined in a parameter file (using -p), parmeters should                                                                                                                                                 │
# use the form below. Each option can also be set from the command                                                                                                                                                    │
# line, using a form of '-param [optional argument]'                                                                                                                                                                  │
# Unique anchored substrings of options are also recognized, and                                                                                                                                                      │
# case is ignored, so '-sc' is equivalent to '-SCALE'                                                                                                                                                                 │
#                                                                                                                                                                                                                     │
# General Options                                                                                                                                                                                                     │
# ===============                                                                                                                                                                                                     │
# ABREVIATION =  <s>       -- build table with abreviation <s>                                                                                                                                                        │
# DIR =  <s>               -- generate tables in directory <s>                                                                                                                                                        │
# HELP =  <n>              -- display this message                                                                                                                                                                    │
# PARAMS =  <s>            -- read parameters from file <s>                                                                                                                                                           │
# QUIET =  [Y|N]           -- disable all output to stdout/stderr                                                                                                                                                     │
# SCALE =  <n>             -- volume of data to generate in GB                                                                                                                                                        │
# TABLE =  <s>             -- build only table <s>                                                                                                                                                                    │
# UPDATE =  <n>            -- generate update data set <n>                                                                                                                                                            │
# VERBOSE =  [Y|N]         -- enable verbose output                                                                                                                                                                   │
# PARALLEL =  <n>          -- build data in <n> separate chunks                                                                                                                                                       │
# CHILD =  <n>             -- generate <n>th chunk of the parallelized data                                                                                                                                           │
# RELEASE =  [Y|N]         -- display the release information                                                                                                                                                         │
# _FILTER =  [Y|N]         -- output data to stdout                                                                                                                                                                   │
# VALIDATE =  [Y|N]        -- produce rows for data validation                                                                                                                                                        │
#                                                                                                                                                                                                                     │
# Advanced Options                                                                                                                                                                                                    │
# ===============                                                                                                                                                                                                     │
# DELIMITER =  <s>         -- use <s> as output field separator                                                                                                                                                       │
# DISTRIBUTIONS =  <s>     -- read distributions from file <s>                                                                                                                                                        │
# FORCE =  [Y|N]           -- over-write data files without prompting                                                                                                                                                 │
# SUFFIX =  <s>            -- use <s> as output file suffix                                                                                                                                                           │
# TERMINATE =  [Y|N]       -- end each record with a field delimiter                                                                                                                                                  │
# VCOUNT =  <n>            -- set number of validation rows to be produced                                                                                                                                            │
# VSUFFIX =  <s>           -- set file suffix for data validation
# RNGSEED =  <n>           -- set RNG seed
