function [outputs] = Classify(W, b, data)
% [predictions] = Classify(W, b, data) should accept the network parameters 'W'
% and 'b' as well as an DxN matrix of data sample, where D is the number of
% data samples, and N is the dimensionality of the input data. This function
% should return a vector of size DxC of network softmax output probabilities.

n = size(W{1,1},1);
X = repmat(X,n);
act_a = dot(W{1,1},X,2)+b{1,1};
act_h = 1./(1+exp(-nw));
output = dot(W{1,2},act_h,2)+b{1,2};
exp_nw = exp(nw);
probabilities = exp_nw/sum(exp_nw);
    Li = -log10(probabilities);


end
