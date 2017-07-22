function [areaMatCountOnly, entropyMatCountOnly, areaMat, entropyMat] = spaceEntropyGlobal(kernel)
% 输出kernel下的全时长指标，对fixation仅仅计次
load data
areaMatCountOnly = [];
entropyMatCountOnly = [];
areaMat = [];
entropyMat = [];
for pic  = pics
    canvasCount = zeros(1280, 800);
    canvas = zeros(1280, 800);
    for user = users
        fixMat = fixations{user, pic};
        n = size(fixMat, 1);
        for i = 1:n
            duration = fixMat(x, y);
            x = fixMat(i, 3);
            y = fixMat(i, 4);
            if isValid(x, y)
                canvasCount(x, y) = 1;
                canvas(x, y) = canvas(x, y) + duration;
            end
        end
    end
    canvas = imfilter(canvas, kernel);
    canvasCount = imfilter(canvasCount, kernel);
    areaMatCountOnly(pic) = area(canvasCount);
    areaMat(pic) = area(canvas);
    entropyMatCountOnly(pic) = entropy(canvasCount);
    entropyMat(pic) = entropy(canvas);
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