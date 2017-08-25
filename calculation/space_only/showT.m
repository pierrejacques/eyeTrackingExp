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

% 转换为mat以加速计算, 注意，这个mat只有40列
entCell = entCell(pics);
entMat = cell2mat(entCell);
rmat = zeros(3000, 1);
figure()
for t = 1:3000
    rmat(t) = corr(score(pics)', entMat(t, :)');
end
plot(rmat);
    