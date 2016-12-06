%% testFindLetters

I1 = imread('../01_list.jpg');

I = I1;
[lines, bw] = findLetters(I);

hold on

imshow(I);

for j = 1:numel(lines)
    for i = 1:size(lines{j},1)
        b = [lines{j}(i,1) lines{j}(i,2) lines{j}(i,3)-lines{j}(i,1) lines{j}(i,4)-lines{j}(i,2)];
        rectangle('Position',b,'EdgeColor','b')
    end
end
hold off

clear all
I2 = imread('../02_letters.jpg');
I = I2;
[lines, bw] = findLetters(I);
figure
imshow(I);
hold on
for j = 1:numel(lines)
    for i = 1:size(lines{j},1)
        b = [lines{j}(i,1) lines{j}(i,2) lines{j}(i,3)-lines{j}(i,1) lines{j}(i,4)-lines{j}(i,2)];
        rectangle('Position',b,'EdgeColor','b')
    end
end
hold off

clear all

I3 = imread('../03_haiku.jpg');
I = I3;
[lines, bw] = findLetters(I);
figure
imshow(I);
hold on
for j = 1:numel(lines)
    for i = 1:size(lines{j},1)
        b = [lines{j}(i,1) lines{j}(i,2) lines{j}(i,3)-lines{j}(i,1) lines{j}(i,4)-lines{j}(i,2)];
        rectangle('Position',b,'EdgeColor','b')
    end
end
hold off

clear all
I4 = imread('../04_deep.jpg');
I = I4;
[lines, bw] = findLetters(I);
figure
imshow(I);
hold on
for j = 1:numel(lines)
    for i = 1:size(lines{j},1)
        b = [lines{j}(i,1) lines{j}(i,2) lines{j}(i,3)-lines{j}(i,1) lines{j}(i,4)-lines{j}(i,2)];
        rectangle('Position',b,'EdgeColor','b')
    end
end

% figure
% imshow(I2);
% figure
% imshow(I3);
% figure
% imshow(I4);
