function [result]=SSD(leftI, rightI)

result = zeros(size(leftI),'uint8');

disparityRange = 75;
halfBlockSize = 3;
blockSize = 2 * halfBlockSize + 1;

[imgHeight, imgWidth] = size(leftI);

for i=1:imgHeight
    minr = max(1, i - blockSize);
    maxr = min(imgHeight, i + blockSize);
    
    for j=1:imgWidth
        minc = max(1, j - blockSize);
        maxc = min(imgWidth, j + blockSize);
        
        mind = 0; 
        maxd = min(disparityRange, imgWidth - maxc);

        template = rightI(minr:maxr, minc:maxc);
		numBlocks = maxd - mind + 1;
		blockDiffs = zeros(numBlocks, 1);
        
        for k = mind : maxd
			block = leftI(minr:maxr, (minc + k):(maxc + k));
			blockIndex = k - mind + 1;
			blockDiffs(blockIndex, 1) = sum(sum((template - block).^2));
        end
        
        [temp, sortedIndeces] = sort(blockDiffs);
		bestMatchIndex = sortedIndeces(1, 1);
		d = bestMatchIndex + mind - 1;
        result(i,j) = d;
        
    end
end