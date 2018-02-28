function [out] = enumT_heat()
%给出weightless在sigma=20和disc在r=50时的归一化的眼动熵
load data

% 通过fix_trans按发生时刻记录fix
fix_trans = cell(max(users), max(pics));
for pic = pics
    %collecting raw t,x,y
    pointer = 0;
    for user = users
        sum = 2;
        mat = fixations{user, pic};
        n = size(mat, 1);
        mat_trans = zeros(n, 3);
        mat_trans(:, 2:3) = mat(:, 3:4);
        mat_trans(1, 1) = 1;
        for i = 2:n
            mat_trans(i, 1) = mat_trans(i - 1, 1) + mat(i - 1, 2);
        end
        fix_trans{user, pic} = mat_trans;
    end
end

% idx 指向当下用户停留的位置
out = initOut();
kernel = getKernel('gauss', 30);
parfor pic = 1:max(pics)
    if pic == 5 || pic == 18
        continue
    end
    pic
    idx = zeros(30, 1);
    canvas = zeros(1280, 800);
    for t = 1:5:3000
        for user = 1:30
            n = size(fix_trans{user, pic}, 1);
            if idx(user) < n && fix_trans{user, pic}(idx(user) + 1, 1) <= t
                idx(user) = idx(user) + 1;
            end
            x = fix_trans{user, pic}(idx(user), 2);
            y = fix_trans{user, pic}(idx(user), 3);
            if isValid(x, y)
                canvas = kernelize(canvas, kernel, x, y);
            end
            out{pic}(t) = entropy(canvas);
        end
    end
end

end

function out = initOut()
load data
for pic = pics
    out{pic} = zeros(3000, 1);
end
end

function canvas = initCanvas()
load data
for pic = pics
    canvas{pic} = zeros(1280, 800);
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