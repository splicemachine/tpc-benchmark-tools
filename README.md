# Benchmarks
This directory contains the unlatered benchmark downloads from http://www.tpc.org.  

The directories herein contain both the tool downloads and the specs.
* The provided tools have been extracted and the permissions updated appropriately.  Otherwise they are completely unaltered.
* The downloads are current as of March 2015.

## TPC-C
[TPC-C](http://www.tpc.org/tpcc/default.asp) is a transactional benchmark aimed at measuring OLTP type performance.  This benchmark is executed by the code in the [test-benchmark-tool](https://github.com/splicemachine/test-benchmark-tool)

## TPC-H
[TPC-H](http://www.tpc.org/tpch/default.asp) is an analytical benchmark aimed at measuring OLAP type perfprmance.  This benchmark is executed by the scripts in the this repo under the [performance/tpch](https://github.com/splicemachine/test/tree/master/performance/tpch) folder.  

## TPC-DS
[TPC-DS](http://www.tpc.org/tpcds/default.asp) is also an analytical benchmark, but leverages more randomly generated data such that it is more difficult to "game".  This is not presently implememted for execution against splice, though there is an attemtp living in the [performance/tpcds](https://github.com/splicemachine/test/tree/master/performance/tpcds) folder.