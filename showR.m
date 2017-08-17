function [] = showR(cell)
load data;
score = score(pics);
r = [];
x = [];
pointer = 0;
for i = 1:length(cell)
    if length(cell{i}) > 0
        feature = cell{i};
        feature = feature(pics);
        feature = feature(:)';
        pointer = pointer + 1;
        x(pointer) = i;
        r(pointer) = corr(score', feature');
    end
end
plot(x, r, '-');