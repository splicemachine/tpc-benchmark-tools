# TPC-H dataset generation

## Prerequisites
You'll need build RPMs installed on a CentOS box. In the colo, there's a script to facilitate this. As the `splice` user run this to install and verify that you have **make** and the **gcc** C compiler:
```
curl http://yum/ks/centos/post-inst/install-build-rpms.sh | sudo bash
which -a make gcc
```

## Getting and building the TPC-H tools
TPC-H (and other benchmark) tools are in the splicemachine organization's **test** repository on github. You can check it out on a big boy box in the colo by forwarding your SSH keys. The TPC-H tools are written in ANSI C, so you'll need a compiler, headers and the make tool - install using the instructions above.
```
# make sure we have an SSH agent running with our default SSH key
test -z "${SSH_AUTH_SOCK}" && eval `ssh-agent`
ssh-add
# "ssh-add /path/to/key" any additional SSH keys
ssh -A splice@colo-server
# make sure you can hit github with your key
ssh git@github.com 2>&1 | grep -i hi
mkdir -p ~/git
cd ~/git
git clone git@github.com:splicemachine/test.git
cd ~/git/test/benchmarks/TPC-H/tpch_2_17_0/dbgen
make && { ls -al dbgen qgen ; file dbgen qgen ; } 
```

## Generating datasets 
The `dbgen` tool is used to build TPC-H datasets. By default, it will build a group of **.tbl** files with a scale factor if 1GB. Running `dbgen` with no options will output a group of tables:

```
$ ls -al *.tbl ; time ./dbgen ; ls -al *.tbl
ls: cannot access *.tbl: No such file or directory
TPC-H Population Generator (Version 2.17.0)
Copyright Transaction Processing Performance Council 1994 - 2010

real 0m28.569s
user 0m27.312s
sys  0m1.279s
-rw-rw-r-- 1 splice splice  24346144 Aug 27 13:38 customer.tbl
-rw-rw-r-- 1 splice splice 759863287 Aug 27 13:38 lineitem.tbl
-rw-rw-r-- 1 splice splice      2224 Aug 27 13:38 nation.tbl
-rw-rw-r-- 1 splice splice 171952161 Aug 27 13:38 orders.tbl
-rw-rw-r-- 1 splice splice 118984616 Aug 27 13:38 partsupp.tbl
-rw-rw-r-- 1 splice splice  24135125 Aug 27 13:38 part.tbl
-rw-rw-r-- 1 splice splice       389 Aug 27 13:38 region.tbl
-rw-rw-r-- 1 splice splice   1409184 Aug 27 13:38 supplier.tbl
```
## Specifying a non-default output directory
By default, `dbgen` puts its output **.tbl** datafiles in the current working directory. You can specify an output path using the *DSS_PATH* environment variable. For example, to force overwrite a TPC-H dataset with a scale-factor of 1(GB) to a locally-mounted MapR NFS share (mounted at /mapr) with verbose messages, something like this should work:
```
export DSS_PATH=/mapr/clustername/TPCH/1
sudo mkdir -p $(dirname ${DSS_PATH})
sudo chmod 1777 $(dirname ${DSS_PATH})
sudo chown -R ${USER}:${USER} $(dirname ${DSS_PATH})
mkdir -p $(dirname ${DSS_PATH})/1
time ./dbgen -v -f -s 1
ls -al /mapr/clustername/TPCH/1
```

## Dataset generation examples
Generate TPC-H 1 into a subdirectory, using force and verbose:
```
export DSS_PATH="${PWD}/TPCH/1"
mkdir -p ${DSS_PATH}
./dbgen -v -f -s 1
```

## Useful `dbgen` options

opt | default | use
--- | ------- | ---
-C  | 1       | split datasets into # chunks, default 1 (requires -S)
-f  | no      | force overwrite existing .tbl output files
-h  | no      | help
-q  | no      | opposite of verbose I guess?
-s  | 1       | scale factor (1GB default)
-S  | none    | build Nth step of data/update set with -C or -U
-U  | none    | UPDATE sets to generate
-v  | no      | verbose output

## Update sets

## Query sets

## Useful links
- Some random github dbgen with a README: https://github.com/electrum/tpch-dbgen
