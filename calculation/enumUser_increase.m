function [weighted, weightless, rWeighted, rWeightless] = enumUser_increase()
% 每次引入一个新的用户的算法

load data
load enumR

users_to_push = randperm(30, 30);
kernel = getKernel('gauss', 30);
weighted = cell(1, max(pics));
weightless = weighted;
rWeighted = weighted;
rWeightless = weighted;

for pic = pics
    pic
    currentUsers = [];
    canvas_weightless = zeros(1280, 800);
    canvas_weighted = zeros(1280, 800);
    mat1 = zeros(1, 30);
    mat2 = zeros(1, 30);
    mat3 = zeros(1, 30);
    mat4 = zeros(1, 30);
    for i = 1:30
        user = users_to_push(i);
        currentUsers = [currentUsers, user];
        fix_mat = fixations{user, pic};
        n = size(fix_mat, 1);
        for j = 1:n
            duration = fix_mat(j, 2);
            x = fix_mat(j, 3);
            y = fix_mat(j, 4);
            if isValid(x, y)
                canvas_weightless = kernelize(canvas_weightless, kernel, x, y);
                canvas_weighted = kernelize(canvas_weighted, duration * kernel, x, y);
            end
        end
        mat1(i) = entropy(canvas_weightless);
        mat2(i) = entropy(canvas_weighted);
        mat3(i) = mat1(i)/mean(basic(currentUsers, pic));
        mat4(i) = mat2(i)/mean(basicHeat(currentUsers, pic));
    end
    weightless{pic} = mat1;
    weighted{pic} = mat2;
    rWeightless{pic} = mat3;
    rWeighted{pic} = mat4;
end

end

function [] = showCanvas(in)
cmax = max(max(in));
figure();
pcolor(flipud(in'))
shading flat
caxis([0,cmax]);
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