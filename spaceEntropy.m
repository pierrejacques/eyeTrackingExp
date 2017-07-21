function [out] = spaceEntropy(kernelType, static)
% 输出沿时间的空间分布熵
if nargin == 0
    kernelType = 'circle';
    static = 'area';
else
    if nargin == 1
        static = 'area';
    end
end
load data

% 转换fixations
xStream = {};
yStream = {};
for pic  =pics
    for user = users
        t = 1;
        xMat = [];
        yMat = [];
        fixMat = fixations{users, pics};
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
dt = 20;
for t = 1:dt:3000
    t
    for pic = pics
        canvas = zeros(1280, 800);
        for user = users
            xMat = xStream{user, pic};
            yMat = yStream{user, pic};
            if length(xMat) < t
                continue;
            end
            x = xMat(t);
            y = yMat(t);
            for dx = -r:r
                for dy = -r:r
                    if isValid(x + dx, y + dy)
                        if strcmp(kernelType, 'circle')
                            canvas(x + dx, y + dy) = or(canvas(x + dx, y + dy), kernel(r + 1 + dx, r + 1 + dy));
                        else
                            canvas(x + dx, y + dy) = canvas(x + dx, y + dy) + kernel(r + 1 + dx, r + 1 + dy);
                        end
                    end
                end
            end
        end
        if strcmp(static, 'entropy')
            out(pic, t:t + dt - 1) = entropy(canvas);
        else
            out(pic, t:t + dt - 1) = area(canvas);
        end
    end
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