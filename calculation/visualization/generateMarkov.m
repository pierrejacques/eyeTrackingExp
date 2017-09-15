function [p, mat] = generateMarkov(pic)
% p表示先验概率，mat是归一化的markov矩阵
load ../data

map = AOImap{pic};
mat = zeros(AOInum(pic));
for user = users
    fixmat = fixations{user, pic};
    n = size(fixmat, 1);
    lastAOI = 0;
    for i = 1:n
        x = fixmat(i, 3);
        y = fixmat(i, 4);
        if isValid(x, y)
            AOI = map(x, y);
            if AOI > 0 && AOI ~= lastAOI
                if lastAOI
                    mat(lastAOI, AOI) = mat(lastAOI, AOI) + 1;
                end
                lastAOI = AOI;
            end
        end
    end
end
p = sum(mat')'
pmat = p * ones(1, length(p));
mat = mat./pmat;
p = p./sum(p);
end

function [bool] = isValid(x, y)
bool = (x>0 && x<=1280 && y>0 && y<=800);
end
