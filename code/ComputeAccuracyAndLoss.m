function [accuracy, loss] = ComputeAccuracyAndLoss(W, b, data, labels)
% [accuracy, loss] = ComputeAccuracyAndLoss(W, b, X, Y) computes the networks
% classification accuracy and cross entropy loss with respect to the data samples
% and ground truth labels provided in 'data' and labels'. The function should return
% the overall accuracy and the average cross-entropy loss.
nsamples = size(data,1);
outputs = Classify(W, b, data);
% A(A < 0) = -A(A < 0);
% accuracy = outputs - labels;
% accuracy(accuracy < 0) = -accuracy(accuracy < 0);
accuracy = 1-sum(min(abs(outputs - labels),[],2))/nsamples;
loss = -log10(dot(labels,outputs,2));
loss = sum(loss,1)/nsamples;

