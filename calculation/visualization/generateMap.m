function out = generateMap(pic, isWeighted)
if nargin <= 1
    isWeighted = 1;
end

load ../data
out = zeros(1280, 800);
kernel = getKernel('gauss', 30);
for user = users
    fixmat = fixations{user, pic};
    n = size(fixmat, 1);
    for i = 1:n
        if isWeighted
            duration = fixmat(i, 2);
        else
            duration = 1;
        end
        x = fixmat(i, 3);
        y = fixmat(i, 4);
        out = kernelize(out, duration * kernel, x, y);
    end
end
out = out/sum(sum(out));
cmax = max(max(out));
figure();
pcolor(flipud(out'))
shading flat
caxis([0,cmax]);

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