function [areaMatCountOnly, entropyMatCountOnly, areaMat, entropyMat] = spaceEntropyGlobal(kernel)
% 输出kernel下的全时长指标，对fixation仅仅计次
load data
areaMatCountOnly = [];
entropyMatCountOnly = [];
areaMat = [];
entropyMat = [];
for pic  = pics
    pic
    canvasCount = zeros(1280, 800);
    canvas = zeros(1280, 800);
    for user = users
        fixMat = fixations{user, pic};
        n = size(fixMat, 1);
        for i = 1:n
            duration = fixMat(i, 2);
            x = fixMat(i, 3);
            y = fixMat(i, 4);
            if isValid(x, y)
                canvasCount = kernelize(canvasCount, kernel, x, y);
                canvas = kernelize(canvasCount, duration * kernel, x, y);
            end
        end
    end
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