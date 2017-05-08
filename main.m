clear;
tic();

left = imread('viewL.png');
right = imread('viewR.png');
dispMat = load('disp.mat');
dispMat = dispMat.L;

leftI = mean(left, 3);
rightI = mean(right, 3);

tic();
resultSSD = SSD(leftI, rightI);
toc();

tic();
resultCC  = Cross_Correlation(leftI, rightI);
toc();

tic();
resultNCC = Normalized_Cross_Correlation(leftI, rightI);
toc();

figure;
imshow(resultSSD);
figure;
imshow(resultCC);
figure;
imshow(resultNCC);

minSSD  = min(min(dispMat - resultSSD));
maxSSD  = max(max(dispMat - resultSSD));
meanSSD = mean(mean(dispMat - resultSSD));
stdSSD  = std(std(double(dispMat) - double(resultSSD)));

minCC  = min(min(dispMat - resultCC));
maxCC  = max(max(dispMat - resultCC));
meanCC = mean(mean(dispMat - resultCC));
stdCC  = std(std(double(dispMat) - double(resultCC)));

minNCC  = min(min(dispMat - resultNCC));
maxNCC  = max(max(dispMat - resultNCC));
meanNCC = mean(mean(dispMat - resultNCC));
stdNCC  = std(std(double(dispMat) - double(resultNCC)));