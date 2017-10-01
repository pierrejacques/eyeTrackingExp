function out = enumR_rvae(maxsigma)
if nargin == 0 
    maxsigma = 133;
end

cvs0 = zeros(1280, 800);
load data
out = cell(1, maxsigma);
parfor sigma = 1:maxsigma
    kernel = getKernel('gauss', sigma);
    rvae = zeros(1, 42);
    for pic = 1:42
        if pic == 5 || pic == 18
            continue
        end
        cvs = cvs0;
        bvae = zeros(1, 30);
        for user = 1:30
            bcvs = cvs0;
            fixmat = fixations{user, pic};
            n = size(fixmat, 1);
            for i = 1:n
                d = fixmat(i, 2);
                x = fixmat(i, 3);
                y = fixmat(i, 4);
                if isValid(x, y)
                    bcvs = kernelize(bcvs, d * kernel, x, y);
                    cvs = kernelize(cvs, d * kernel, x, y);
                end
            end
            bvae(user) = entropy(bcvs);
        end
        rvae(pic) = entropy(cvs)/mean(bvae);     
    end
    out{sigma} = rvae;
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