function ent = userEntropy(sigma)
%给出每个被试对每个页面的眼动熵，以sigma为标准差
load data

weightless = zeros(max(pics), max(users));
for pic = pics
    pic
    for user = users
        mat = fixations{user, pic};
        xs = mat(:, 3);
        ys = mat(:, 4);
        canvas = addCanvasWeightless(xs, ys, sigma);
        ent(user, pic) = calcWeightless(canvas);
    end
end
end

function canvas = addCanvasWeightless(xs, ys, sigma)
canvas = zeros(1280, 800);
for idx = 1:length(xs)
    x = xs(idx);
    y = ys(idx);
    if isValid(x, y)
        canvas = kernelize(canvas, getKernel('gaussian', sigma), x, y);
    end
end
end

function [ent] = calcWeightless(canvas)
ent = entropy(canvas);
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

function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
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