# Hippocampal Thickness
Method to get thickness for hippocampal subfields

Citation:

Deydeep Kothapalli, Meral A. Tubi, Sophia I. Thomopoulos, Iman Aganj, Melanie D. Sweeney, Lon
S. Schneider, Elizabeth B. Joe, John M. Ringman, Hussein Yassine, Michael G. Harrington, Berislav V.
Zlokovic, Arthur W. Toga, Helena C. Chui, Paul M. Thompson, and Meredith N. Braskie, Automated
Measurement of Medial Temporal Lobe Subregion Cortical Thickness using Minimum Line Integrals;
Society for Neuroscience (SfN) 2019, Chicago, IL (Oral presentation)

There are two main steps:
1) Run thickness_calculation.sh to get the individual thresholded and binarized files (Currently set it up for parallel processing, but you can switch it to a for loop)
2) Run subfield_thickness.m to perform the minimum line integral calculation and output thickness results. 

The repository contains a) thickness_calculation.sh, b) compressed folder with the necessary MATLAB scripts, and c) more detailed instructions in a Word document.


