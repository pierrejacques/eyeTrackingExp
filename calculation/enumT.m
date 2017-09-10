function [weightless, fix_sum] = enumT()
%给出weightless在sigma=20和disc在r=50时的归一化的眼动熵
load data
t = cell(max(pics), 1); %t{pic}储存了网页pic的产生变化的时间轴
x = cell(max(pics), 1); %fix{pic}储存了网页pic的沿着时间排布的注视x坐标
y = cell(max(pics), 1); %fix{pic}储存了网页pic的沿着时间排布的注视y坐标

for pic = pics
    %collecting raw t,x,y
    pointer = 0;
    for user = users
        sum = 2;
        mat = fixations{user, pic};
        n = size(mat, 1);
        for i = 1:n
            pointer = pointer + 1;
            t{pic}(pointer) = sum;
            x{pic}(pointer) = mat(i, 3);
            y{pic}(pointer) = mat(i, 4);
            sum = sum + mat(i,2);
        end
    end
    %sorting t,x,y
end

%对t进行归并的同时，计算出每个t对应的眼动熵
weightless = cell(max(pics), 1);
fix_sum = cell(max(pics), 1);
for pic = pics
    pic
    fix_count = 0;
    last_weightless = 0;
    canvas_weightless = zeros(1280, 800);
    for t_val = 1:3000
        idxs = (t{pic} == t_val);
        xs = x{pic}(idxs);
        ys = y{pic}(idxs);
        n = length(xs); % t_val时刻开始的fixation个数
        fix_count = fix_count + n; % 更新总数
        if n > 0
            canvas_weightless = addCanvasWeightless(canvas_weightless, xs, ys);
            last_weightless = calcWeightless(canvas_weightless);
        end
        weightless{pic}(t_val) = last_weightless;
        fix_sum{pic}(t_val) = fix_count;
    end
end
end

function canvas_out = addCanvasWeightless(canvas_in, xs, ys)
canvas_out = canvas_in;
for idx = 1:length(xs)
    x = xs(idx);
    y = ys(idx);
    if isValid(x, y)
        canvas_out = kernelize(canvas_out, getKernel('gaussian', 30), x, y);
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