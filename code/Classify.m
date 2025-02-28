function [outputs] = Classify(W, b, data)
% [predictions] = Classify(W, b, data) should accept the network parameters 'W'
% and 'b' as well as an DxN matrix of data sample, where D is the number of
% data samples, and N is the dimensionality of the input data. This function
% should return a vector of size DxC of network softmax output probabilities.

for i = 1:size(data,1)
    [output, act_h, act_a] = Forward(W, b, data(i,:)');
    exp_out = exp(output);
    outputs(i,:) = exp_out/sum(exp_out); 
end
% outputs(i,:) = -log10(probabilities);

end
