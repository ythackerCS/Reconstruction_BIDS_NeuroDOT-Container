#!/bin/bash


die(){
    echo >&2 "$@"
    exit 1
}

echo $@

SUBJECT_MAT=$1
shift
PARAMS=$1
shift
E_MAT=$1
shift
MNI_MAT=$1
shift
A_fn=$1

dt=`date --utc +%Y%m%d-%H%M%S`

echo dt 

OUTPUTFOLDER_NOTEBOOK="/outputfiles/${dt}_reconstruction_notebook"
OUTPUTFOLDER_SAVEMAT="/outputfiles/${dt}_saved_mat/"

mkdir $OUTPUTFOLDER_NOTEBOOK $OUTPUTFOLDER_SAVEMAT

echo 'papermill neuro_dot/NeuroDOT_Reconstruction_Script.ipynb $OUTPUTFOLDER_NOTEBOOK/output.ipynb -p patient_data /input/$SUBJECT_MAT -p params_file /input/$PARAMS -p saveMatPath $OUTPUTFOLDER_SAVEMAT'

papermill neuro_dot/NeuroDOT_Reconstruction_Script.ipynb $OUTPUTFOLDER_NOTEBOOK/output.ipynb -p participant_data /input/$SUBJECT_MAT -p params_file /input/$PARAMS -p saveMatPath $OUTPUTFOLDER_SAVEMAT -p Emat $E_MAT -p MNI_file $MNI_MAT -p A_fn $A_fn --log-output --progress-bar
