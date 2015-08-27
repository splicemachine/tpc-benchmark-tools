# TPC-H generation

## Prerequisites

You'll need build RPMs installed on a CentOS box. In the colo, there's a script to facilitate this. As the `splice` user run this to install and verify that you have **make** and the **gcc** C compiler:

```
curl http://yum/ks/centos/post-inst/install-build-rpms.sh | sudo bash
which -a make gcc
```

## Getting and building the dbgen tool

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