function [areaCell, entropyCell] = spaceEntropy(kernelType)
% 输出沿时间的空间分布熵
if nargin == 0
    kernelType = 'circle';
end
load data

% 转换fixations
xStream = {};
yStream = {};
for pic  = pics
    for user = users
        t = 1;
        xMat = [];
        yMat = [];
        fixMat = fixations{user, pic};
        n = size(fixMat, 1);
        for i = 1:n
            duration = fixMat(i, 2);
            x = fixMat(i, 3);
            y = fixMat(i, 4);
            xMat([t: t + duration - 1]) = x;
            yMat([t: t + duration - 1]) = y;
            t = t + duration;
        end
        xStream{user, pic} = xMat;
        yStream{user, pic} = yMat;
    end
end

% kernel计算存储
if strcmp(kernelType, 'circle')
    kernel = circle(55);
else
    kernel = gauss(20);
end
r = (size(kernel, 1) - 1)/2;

% 计算关于时间的结果，42行，3000列
dt = 10;
parfor pic = 1:42
    pic
    if pic == 5
        continue
    end
    entropyMat = zeros(3000, 1);
    areaMat = zeros(3000, 1);
    for t = 1:dt:3000
        canvas = zeros(1280, 800);
        for user = 1:30
            xMat = xStream{user, pic};
            yMat = yStream{user, pic};
            if length(xMat) < t
                continue;
            end
            x = xMat(t);
            y = yMat(t);
            if isValid(x, y)
                if strcmp(kernelType, 'circle')
                    canvas = kernelize('or', canvas, kernel, x, y);
                else
                    canvas = kernelize('and', canvas, kernel, x, y);
                end
            end
        end
        entropyMat(t:t+dt-1) = entropy(canvas);
        areaMat(t:t+dt-1) = area(canvas);
    end
    entropyCell{pic} = entropyMat;
    areaCell{pic} = areaMat;
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

function [mat] = circle(r)
mat = zeros(2*r + 1);
for x = -r:r
    for y = -r:r
        if x*x + y*y <= r*r
            mat(x + r + 1 , y + r + 1) = 1;
        end
    end
end
end

function [mat] = gauss(r)
scale = 2;
mat = zeros(2*scale*r + 1);
for x = -scale*r:scale*r
    for y = -scale*r:scale*r
        if x*x + y*y <= scale*scale*r*r
            mat(x + scale*r + 1, y + scale*r + 1) = exp(-(x*x + y*y)/2/r/r);
        end
    end
end
end

function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
end

function out = kernelize(method, mat, kernel, x, y)
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
if strcmp(method, 'or')
    out = [mat(1:xup - 1, :); mat(xup:xdown, 1:yleft-1), or(mat(xup:xdown, yleft:yright), kernel(kxup:kxdown, kyleft:kyright)), mat(xup:xdown, yright + 1:ymax); mat(xdown + 1:xmax,:)];
else
    out = [mat(1:xup - 1, :); mat(xup:xdown, 1:yleft-1), mat(xup:xdown, yleft:yright)+ kernel(kxup:kxdown, kyleft:kyright), mat(xup:xdown, yright + 1:ymax); mat(xdown + 1:xmax,:)];
end
end