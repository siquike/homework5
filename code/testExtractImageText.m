I1 = imread('../01_list.jpg');
imshow(I1)

[text1] = extractImageText(I1)

%%

I2 = imread('../02_letters.jpg');
imshow(I2)

[text2] = extractImageText(I2)
%%

I3 = imread('../03_haiku.jpg');
imshow(I3)

[text3] = extractImageText(I3)

%%

I4 = imread('../04_deep.jpg');
imshow(I4)

[text4] = extractImageText(I4)