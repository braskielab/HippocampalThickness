# HippocampalThickness
Method to get thickness for hippocampal subfields

There are Two Main Steps:
1) Run thickness_calculation.sh to get the individual thresholded and binarized files (Currently set it up for parallel processing, but you can switch it to a for loop)
2) Run subfield_thickness.m to perform the minimum line integral calculation and output thickness results. 

The compressed folder contains a) thickness_calculation.sh, b) compressed folder with the necessary MATLAB scripts, and c) more detailed instructions in a Word document.
