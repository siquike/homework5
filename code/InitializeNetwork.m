function [W, b] = InitializeNetwork(layers)
% InitializeNetwork([INPUT, HIDDEN1, HIDDEN2, ..., OUTPUT]) initializes the weights and biases
% for a fully connected neural network with input data size INPUT, output data
% size OUTPUT, and in between are the number of hidden units in each of the layers.
% It should return the cell arrays 'W' and 'b' which contain the randomly
% initialized weights and biases for this neural network.

% layers = [5 4 3]

% n = numel(layers);

% W and b are both cell arrays

for i = 1:numel(layers)-1
    W{1,i} = 0.01*normrnd(0,1,[layers(i+1),layers(i)])/sqrt(layers(i))+0.002; 
%     b{1,i} = 0.01*normrnd(0,1,[layers(i+1),1])/sqrt(layers(i));
    b{1,i} = zeros(layers(i+1),1);
end
