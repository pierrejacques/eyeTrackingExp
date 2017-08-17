function [heatCell, weightlessCell, discCell] = enumerateR(minR, maxR)
% the r here refers to 3*sigma in Gauss or radius in Disk
if nargin == 0
    minR = 1;
    maxR = 90;
else if nargin == 1
        maxR = 90;
    end
end

heatCell = {};
weightlessCell = {};
discCell = {};

for r = minR:maxR
    if mod(r, 3) == 0
        %À„gauss
        [heatCell{r}, weightlessCell{r}, discCell{r}] = spaceEntropyGlobal(getKernel('gaussian', r/3));
    end
    
end
