#!/bin/bash

./wmLHEGEN.sh $1
./SIM.sh
./DIGIPremix.sh
./HLT.sh
./RECO.sh
./MiniAODv2.sh
./customizedNanoAOD.sh
