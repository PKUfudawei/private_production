#!/bin/bash

source ./wmLHEGEN.sh $1
source ./SIM.sh $1
for i in {1..5}; do
    source ./DIGIPremix.sh $1 && break
    sleep 10
done
source ./HLT.sh $1
source ./RECO.sh $1
source ./MiniAODv2.sh $1
source ./customizedNanoAOD.sh
