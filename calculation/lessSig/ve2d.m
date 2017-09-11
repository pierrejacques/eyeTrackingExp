function out = ve2d(timelimit)
if nargin == 0
    timelimit = 5000;
end

load ../data
for pic = pics
    markov_mat = zeros(AOInum(pic));
    map = AOImap{pic};
    for user = users
        fix_mat = fixations{user, pic};
        t = 0;
        n = size(fix_mat, 1);
        for i = 1:n-1
            t = t + fix_mat(i, 2);
            if t > timelimit
                break;
            end
            x_from = fix_mat(i, 3);
            y_from = fix_mat(i, 4);
            x_to = fix_mat(i + 1, 3);
            y_to = fix_mat(i + 1, 4);
            if isValid(x_from, y_from) && isValid(x_to, y_to)
                AOI_from = map(x_from, y_from);
                AOI_to = map(x_to, y_to);
                if AOI_from > 0 && AOI_to > 0 && AOI_from ~= AOI_to
                    markov_mat(AOI_from, AOI_to) = markov_mat(AOI_from, AOI_to) + 1;
                end
            end
        end
    end
    out(pic) = calc2dEntropy(markov_mat)/max2dEntropy(AOInum(pic));
end

end

function bool = isValid(x, y)
if x > 0 && x <= 1280 && y > 0 && y<=800
    bool = 1;
else
    bool = 0;
end
end

function out = calc2dEntropy(mat)
n = size(mat, 1);
prior = sum(mat');
prior = prior/sum(prior);
out = 0;
for i = 1:n
    out = out + prior(i) * calc1dEntropy(mat(i, :));
end
end

function out = calc1dEntropy(row)
s = sum(row);
out = 0;
if s > 0
    row = row./sum(row);
    n = length(row);
    for i = 1:n
        if row(i) > 0
            out = out - row(i)*log(row(i))/log(2);
        end
    end
end
end

function out = max2dEntropy(n)
mat = ones(n);
mat = mat - diag(ones(1, n));
out = calc2dEntropy(mat);
end