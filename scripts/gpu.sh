#!/bin/bash

if [ "$#" -lt 2 ]; then
   echo "Usage: gpu <gpuid> <command> "
   exit 1
fi

gpuid=$1
machine=`hostname`

re='^[0-9]+$'
if ! [[ $gpuid =~ $re ]] ; then
     echo "Error: GPU id is not a number" >&2; exit 1
     exit 1
fi

if [[ $machine == occam ]]; then
  gpus=(1 0)
elif [[ $machine == thousandeyes ]]; then
  gpus=(4 3 0 1 2)
elif [[ $machine == ephesia ]]; then
  gpus=(3 2 0 1)
elif [[ $machine == demeter ]]; then
  gpus=(2 1 0)
elif [[ $machine == persephone ]]; then
  gpus=(0 1 2 3)
elif [[ $machine == tefnut ]]; then
  gpus=(3 2 1 0)
elif [[ $machine == bastet ]]; then
  gpus=(3 2 1 0)
else
  echo "Machine $machine is not registered in this script, aborting."
  exit 1
fi

maxid=${#gpus[@]}
maxid=$(($maxid-1))

if [[ $gpuid -gt $maxid ]]; then
  echo "GPU id $gpuid is out of bounds (max is $maxid), aborting."
  exit 1
fi

deviceid=${gpus[$gpuid]}

echo "Running on $machine's gpu $gpuid"

shift
CUDA_VISIBLE_DEVICES=$deviceid $@
