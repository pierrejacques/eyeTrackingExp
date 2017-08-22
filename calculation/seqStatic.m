function [vmean, vmax, vmin, vmle] = seqStatic(cell)

load data

n = max(pics);

vmax = zeros(1, n);
vmin = zeros(1, n);
vmean = zeros(1, n);
vmle = zeros(1, n);

load data
for pic = pics
    mat = cell{pic};
    tmp = mle('normal', sample(mat));
    vmle(pic) = tmp(1);
    vmean(pic) = mean(sample(mat));
    vmax(pic) = mean(max(minDiag(mat)));
    vmin(pic) = mean(min(maxDiag(mat)));
end
end

function [out] = maxDiag(mat)
%对角极大化
[n, ~] = size(mat);
out = diagless(mat) + 1000.*diag(ones(n, 1));
end

function [out] = minDiag(mat)
%对角极小化
[n, ~] = size(mat);
out = diagless(mat) - 1000.*diag(ones(n, 1));
end

function [out] = diagless(mat)
%去对角化
[n, ~] = size(mat);
out = mat - mat.*diag(ones(n, 1));
end

function [out] = sample(mat)
%只保留下三角样本，得到样本向量
[n, ~] = size(mat);
v = n * (n - 1) / 2;
out = zeros(v, 1);
pointer = 0;
for i = 1:n-1
    for j = i+1:n
        pointer = pointer + 1;
        out(pointer) = mat(i, j);
    end
end
end
        