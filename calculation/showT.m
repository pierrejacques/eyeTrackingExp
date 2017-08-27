function [rmat] = showT(entCell)

load data
figure()
hold on
for pic = pics
    if category(pic) == 0
        plot(entCell{pic}, 'r-');
    end
    if category(pic) == 1
        plot(entCell{pic}, 'b-');
    end
end

rmat = zeros(3000, 1);
figure();
for t = 1:3000
    entMat = [];
    for pic = pics
        entMat(pic) = entCell{pic}(t);
    end
    rmat(t) = corr(score(pics)', entMat(pics)');
end
plot(rmat);
    