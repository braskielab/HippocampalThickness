#!/bin/bash

#CHANGE: SUBJECT IDS FOR PARALLEL PROCESSING
SUBJECTS=(1234 5678 9012 3456) 

subj=$SUBJECT
subj=${SUBJECT[${SGE_TASK_ID}-1]}

#CHANGE: INPUT DIRECTORIES
HHR=/HHR/${subj}
MPRAGE=/MPRAGE/${subj}

#CHANGE: FILE SUFFIX 
file_suffix=lfseg_heur

#NAVIGATE TO HHR DIRECTORY, CREATE SUBFIELD THICKNESS DIRECTORY
#CHANGE atlas directory as needed
cd ${HHR}/Atlas/final
mkdir subfield_thickness
cd subfield_thickness

#Array of Left and Right
declare -a sides=("left" "right")

#CHANGE IF NEEDED: Associative array pairing subfields with lower and upper threshold values
#For example, the value of the CA1 is 1, so we threshold it between 0.9 and 1.1
declare -A subfields
subfields[CA1]=0.9,1.1
subfields[CA23DG]=2.9,3.1
subfields[SUB]=7.9,8.1
subfields[PHG]=8.9,9.1
subfields[ERC]=9.9,10.1

#THRESHOLD HHR SEGMENTATIONS REGION-WISE, GENERATE 10 OUTPUT FILES (5 SUBREGIONS, 2 SIDES)
#TRIM EACH IMAGE WITH FSLSTATS AND FSLROI
for i in "${sides[@]}"
do
	for j in "${!subfields[@]}"
	do
		fslmaths ../${subj}_${i}_${file_suffix}.nii.gz -thr ${subfields[${j}]:0:3} -uthr ${subfields[${j}]:4:5} ${subj}_${i}_${file_suffix}_${j}.nii.gz
		size="$(fslstats ${subj}_${i}_${file_suffix}_${j}.nii.gz -w)"
		fslroi ${subj}_${i}_${file_suffix}_${j}.nii.gz ${subj}_${i}_${file_suffix}_${j}.nii.gz ${size}
	done
done

chmod 775 *
#CREATE AND SAVE LINE SEGMENTS

#GET THICKNESS

#AVERAGE
