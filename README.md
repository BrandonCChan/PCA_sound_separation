# PCA for sound separation

Source code written in MATLAB and exists as the file "pca_network.m"
Function pca_network() requires no special inputs, but requires that 
sound.csv is located in the same running directory. As such, run the function
by calling pca_network() in the MATLAB command console. The function 
implements a PCA network to filter out the sound of talking in the sound file 
where someone is talking over someone singing. 
The function will generate 2 files: "output_sound.wav" and "output.csv".