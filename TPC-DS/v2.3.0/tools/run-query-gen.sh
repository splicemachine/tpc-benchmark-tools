#!/bin/bash

# for i in {1..99}; do
./dsqgen \
-VERBOSE N \
-OUTPUT_DIR ./dsqgen_output \
-QUIET Y \
-INPUT ../query_templates/templates.lst \
-SCALE 1 \
-LOG ./dsqgen.$(date +%s).log \
-QUALIFY Y \
 \
-RNGSEED 0 \
-DIALECT splicemachine \
-DIRECTORY ../query_templates
# done

# qgen2 Population Generator (Version 2.3.0)
# Copyright Transaction Processing Performance Council (TPC) 2001 - 2016
# USAGE: qgen2 [options]
# Note: When defined in a parameter file (using -p), parmeters should use the form below.
# Each option can also be set from the command line, using a form of '-param [optional argument]'
# Unique anchored substrings of options are also recognized, and case is ignored, so '-sc' is equivalent to '-SCALE'
# 
# General Options
# ===============
# FILE =  <s>              -- read parameters from file <s>
# VERBOSE =  [Y|N]         -- enable verbose output
# HELP =  [Y|N]            -- display this message
# OUTPUT_DIR =  <s>        -- write query streams into directory <s>
# QUIET =  [Y|N]           -- suppress all output (for scripting)
# STREAMS =  <n>           -- generate <n> query streams/versions
# INPUT =  <s>             -- read template names from <s>
# SCALE =  <n>             -- assume a database of <n> GB
# LOG =  <s>               -- write parameter log to <s>
# QUALIFY =  [Y|N]         -- generate qualification queries in ascending order
# 
# Advanced Options
# ===============
# DISTRIBUTIONS =  <s>     -- read distributions from file <s>
# PATH_SEP =  <s>          -- use <s> to separate path elements
# RNGSEED =  <n>           -- seed the RNG with <n>
# RELEASE =  [Y|N]         -- display QGEN release info
# TEMPLATE =  <s>          -- build queries from template <s> ONLY
# COUNT =  <n>             -- generate <n> versions per stream (used with TEMPLATE)
# DEBUG =  [Y|N]           -- minor debugging outptut
# FILTER =  [Y|N]          -- write generated queries to stdout
# DIALECT =  <s>           -- include query dialect defintions found in <s>.tpl
# DIRECTORY =  <s>         -- look in <s> for templates
