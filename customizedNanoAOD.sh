#!/bin/bash

export HOME=`pwd`; export SCRAM_ARCH=slc7_amd64_gcc700
rm -rf CMSSW_10_6_31; scram p CMSSW CMSSW_10_6_31; cd CMSSW_10_6_31/src; eval `scram runtime -sh`; cmsenv
git clone https://github.com/colizz/NanoTuples.git PhysicsTools/NanoTuples -b dev-part-UL
./PhysicsTools/NanoTuples/scripts/install_onnxruntime.sh
wget https://coli.web.cern.ch/coli/tmp/.240120-181907_ak8_stage2/model.onnx -O $CMSSW_BASE/src/PhysicsTools/NanoTuples/data/InclParticleTransformer-MD/ak8/V02/model.onnx
scram b clean && scram b -j4; cd ~

cmsDriver.py mc_2018 -n -1 --mc --eventcontent NANOAODSIM --datatier NANOAODSIM \
    --conditions 106X_upgrade2018_realistic_v16_L1v1 --step NANO --nThreads 1 --era Run2_2018,run2_nanoAOD_106Xv2 \
    --customise PhysicsTools/NanoTuples/nanoTuples_cff.nanoTuples_customizeMC \
    --filein file:MiniAODv2.root --fileout file:custom_nano.root --no_exec;

exec >/dev/null 2>&1; cmsRun mc_2018_NANO.py
