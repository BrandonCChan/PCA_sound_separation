function W = pca_network()
%Implementation of a Principle Component Analysis Network structured with
%two input nodes and one output node to isolate a sound source from the
%provided dataset. Outputs the resulting .wav file and an output.csv file.
%Trained weights are returned by the function as variable W. Requires no input
%parameters.
%Implementation of PCA network is based on formula's outlined in notes 
%provided in CISC 452 at Queen's University
%Brandon Chan, 11/12/2016

%Read data into an array
data = csvread('sound.csv'); 
[n, ~] = size(data);

%Initialize varibles 
W = [1 0];
learning_rate = 0.1;
max_iterations = 1;
iteration = 0;

while iteration < max_iterations
    %Calculation of y (Sum of W_ij * X_i)
    y = bsxfun(@times,data,W);
    y = sum(y,2).';
    
    %Calculation of K using K = y*y.' as suggested by Williams (1985)
    k = y * y.'; 
    
    for i = 1:n 
        %Calculation of delta weight and adjustment of W
        d_w = learning_rate * y(:,i) * (data(i,:).' - learning_rate*(k.*W.'));
        W = W + d_w.';
    end
    
    iteration = iteration + 1;
end

%Application of trained weights to data to calculate and write output
y_out = bsxfun(@times,data,W);
y_out = sum(y_out,2);
csvwrite('output.csv',y_out)
audiowrite('output_sound.wav',y_out,8192);
end