function [] = showT2(c)
% read a constant c to normalize the initial data
load data
load enumT

entCell = weightless;

rmat = zeros(3000, 1);
figure();
for t = 1:3000
    entMat = [];
    count = [];
    for pic = pics
        entMat(pic) = entCell{pic}(t);
        count(pic) = fix_count{pic}(t);
        entMat = entMat./log(count/30)*log(2);
    end
    rmat(t) = corr(score(pics)', entMat(pics)');
end
plot(rmat);