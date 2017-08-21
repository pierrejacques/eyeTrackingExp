function [heatCell, weightlessCell, discCell] = enumerateR(minR, maxR)
% the r here refers to 3*sigma in Gauss or radius in Disk
if nargin == 0
    minR = 1;
    maxR = 90;
else if nargin == 1
        maxR = 90;
    end
end

heatCell = cell(maxR, 1);
weightlessCell = cell(maxR, 1);
discCell = cell(maxR, 1);

minSigma = max(1, floor(minR / 3));
maxSigma = floor(maxR / 3);
for sigma = minSigma:maxSigma
   r = sigma * 3
   [discCell{sigma*3}, weightlessCell{sigma*3}, heatCell{sigma*3}] = spaceEntropyGlobal(getKernel('gaussian', sigma));
end
