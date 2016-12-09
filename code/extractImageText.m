function [text] = extractImageText(fname)
% [text] = extractImageText(fname) loads the image specified by the path 'fname'
% and returns the next contained in the image as a string.
load('nist36_model.mat')
load('../data/nist36_valid.mat', 'valid_data', 'valid_labels')



[lines, bw] = findLetters(fname);

for i = 1:numel(lines)
    empty = isempty(lines{i});
end
lines = lines(~cellfun('isempty',lines));

% newlines = lines{~empty}

data = [];

for j = 1:numel(lines)
    for i = 1:size(lines{j},1)
        temp = bw(lines{j}(i,2):lines{j}(i,4),lines{j}(i,1):lines{j}(i,3));
        
        temp = imrotate(imresize(temp,[32 32]),0);
%         temp = bwulterode(temp);
%         imshow(temp)
        temp = temp(:)';
        data(i,:) = temp;
    end
    [outputs{j}] = Classify(W, b, data);
    data = [];
end
tolabel = cell2mat(outputs');
[~,estimate_labels] = max(tolabel,[],2);

Alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

text = Alphabet(estimate_labels);

% [~,real_labels] = max(valid_labels,[],2);
% estimate_labels

% size(estimate_labels)
% size(real_labels)
% C = confusionmat(real_labels,estimate_labels);
% figure
% image(C)


end
