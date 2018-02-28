function [rmat] = showUser(entCell, plotoption)
if nargin == 1
    plotoption = 'b';
end

load data
hold on
rmat = zeros(30, 1);
if max(size(entCell)) == 42
    for userNum = 2:30
        mat = [];
        for pic = pics
            mat(pic) = entCell{pic}(userNum);
        end
        rmat(userNum) = corr(mat(pics)', score(pics)');
    end
else
     for userNum = 2:30
        entMat = entCell{userNum};
        rmat(userNum) = corr(entMat(pics)', score(pics)');
    end
end

plot(rmat, plotoption);
end