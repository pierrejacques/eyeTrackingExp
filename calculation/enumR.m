function [heatCell] = enumR(sigmas)
%输入要计算的指标的sigma向量
%输出与sigma等长的全局熵，包括：
%传统热图的全局熵（以sigma为标准差）
%去权热图的全局熵（以sigma为标准差）
%布尔饼图的全局面积（以3sigma为半径）

sigmas = sigmas(:);
len = length(sigmas);
heatCell = cell(len, 1);
weightlessCell = cell(len, 1);
discCell = cell(len, 1);
parfor idx = 1:len
    sigma = sigmas(idx)
    [discCell{idx}, weightlessCell{idx}, heatCell{idx}] = globalEntropy(getKernel('gaussian', sigma));
end
if len == 1
    heatCell = heatCell{1};
    weightlessCell = weightlessCell{1};
    discCell = discCell{1};
end
end

function [disc, weightless, heat] = globalEntropy(kernel)
% 输出kernel下的全时长指标，对fixation仅仅计次
load data

weightless = [];
disc = [];
heat = [];
for pic  = pics
    canvasWeightless = zeros(1280, 800);
    canvasHeat = zeros(1280, 800);
    for user = users
        fixMat = fixations{user, pic};
        n = size(fixMat, 1);
        for i = 1:n
            duration = fixMat(i, 2);
            x = fixMat(i, 3);
            y = fixMat(i, 4);
            if isValid(x, y)
%                 canvasWeightless = kernelize(canvasWeightless, kernel, x, y);
                canvasHeat = kernelize(canvasHeat, duration * kernel, x, y);
            end
        end
    end
    disc(pic) = area(canvasHeat);
    weightless(pic) = entropy(canvasWeightless);
    heat(pic) = entropy(canvasHeat);
end

end

function [val] = entropy(mat)
vec = mat(:);
val = 0;
if sum(vec) > 0
    p = vec./sum(vec);
    p(p==0) = [];
    val = -sum(p.*log(p)/log(2));
end
end

function [val] = area(mat)
vec = mat(:);
vec(vec == 0) = [];
val = length(vec);
end

function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
end

function out = kernelize(mat, kernel, x, y)
d = size(kernel, 1);
r = (d - 1) / 2;
[xmax, ymax] = size(mat);
xup = max(1, x-r);
kxup = max(r-x+2, 1);
xdown = min(xmax, x+r);
kxdown = min(d + xmax - x - r, d);
yleft = max(1, y-r);
kyleft = max(r-y+2, 1);
yright = min(ymax, y+r);
kyright = min(d + ymax - y - r, d);
out = [mat(1:xup - 1, :); mat(xup:xdown, 1:yleft-1), mat(xup:xdown, yleft:yright)+ kernel(kxup:kxdown, kyleft:kyright), mat(xup:xdown, yright + 1:ymax); mat(xdown + 1:xmax,:)];
end

function kernel = getKernel(type, r)
if strcmp(type, 'circle') || strcmp(type, 'oval') | strcmp(type, 'round') || strcmp(type, 'disc') || strcmp(type, 'disk')
    kernel = fspecial('disk', r);
else
    if strcmp(type, 'gauss') || strcmp(type, 'gaussian') || strcmp(type, 'normal')
        kernel = fspecial('gaussian', 6*r + 1, r);
        threshold = kernel(3*r+1, 1);
        kernel(kernel < threshold) = 0;
    else
        kernel = [1];
    end
end
end