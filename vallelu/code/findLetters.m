function [lines, bw] = findLetters(im)
% [lines, BW] = findLetters(im) processes the input RGB image and returns a cell
% array 'lines' of located characters in the image, as well as a binary
% representation of the input image. The cell array 'lines' should contain one
% matrix entry for each line of text that appears in the image. Each matrix entry
% should have size Lx4, where L represents the number of letters in that line.
% Each row of the matrix should contain 4 numbers [x1, y1, x2, y2] representing
% the top-left and bottom-right position of each box. The boxes in one line should
% be sorted by x1 value.
im = rgb2gray(im);
% background = imopen(im,strel('disk',15));
% imshow(im)
% im = im - background;
% imshow(im)

sigma = 1.3;
im = imcomplement(im);
im = imgaussfilt(im,sigma);

im = imadjust(im);
% imshow(im)
% figure
% imshow(im);

level = 0.43;

bw = imbinarize(im);
bw = bwareaopen(bw, 50);

% figure
% imshow(bw);

n = size(bw);

cc = bwconncomp(bw);
L = labelmatrix(cc);

% figure
% imshow(label2rgb(L));

count = 1;
for i = 1:numel(cc.PixelIdxList)
   [x,y] = ind2sub(n,cc.PixelIdxList{1,i});
   x1 = min(x);
   y1 = min(y);
   x2 = max(x);
   y2 = max(y);
%    [x2,y2] = ind2sub(n,cc.PixelIdxList{1,i}(end));
   if ((y2 - y1) < 500*n(1)*n(2)/3702370) && ((y2 - y1) > 20*n(1)*n(2)/3702370*.8) && ((x2 - x1) < 500*n(1)*n(2)/3702370) && ((x2 - x1) > 30*n(1)*n(2)/3702370)   
       letters(count,:) = [y1-5 x1-10 y2+5 x2+20];
%        centerx = round((letters(count,1)+letters(count,3))/2);
%        centery = round((letters(count,2)+letters(count,4))/2);
%        letters(count,:) = [centerx-16 centery-16 centerx+16 centery+16];
       count = count + 1;
   end
end

% avg_size = mean(letters(:,4)-letters(:,2),1);
% 
% n_lines = round(n(1)/(avg_size*2));
% 
% [FX,FY] = gradient(bw);
% % bw

[~,Idx] = sort(letters(:,4));
letters = letters(Idx,:);

change = 1;
count2 = 1;
count3 = 1;

lines = cell(1,10);
while change == 1
    if (letters(count2+1,4) - letters(count2,4)) > 80
        count3 = count3 +1;
    end
    lines{count3} = [lines{count3}; letters(count2+1,:)];
    count2 = count2 +1;
    if (count2) == size(letters,1)
        break
    end
end

location = [];
for i = size(lines,1)
    location =  [location;lines{i}(1,4)];
end

[~,Idx2] = min(abs(letters(1,4) - location));
lines{Idx2} = [lines{Idx2}; letters(1,:)];

for i = 1:count3
    [~,Idx2] = sort(lines{i}(:,1));
    lines{i} = lines{i}(Idx2,:);     
end

bw = imcomplement(bw);
end