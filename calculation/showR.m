function [] = showR(cell)
%normalize constant  

load data;
score = score(pics);
category = category(pics);
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
        p(pointer) = f_rate(category, feature);
    end
end
plot(x, r, '-');
hold on
plot(x, p, '-');
end


function percent = f_rate(c, f)
percent = 0;
for thres = f
    rate = (sum(and(f>thres, c==1)) + sum(and(f<=thres, c==0)))/40;
    if rate >= 0.5 && rate > percent
        percent = rate;
    end
    if rate < 0.5 && (1 - rate) > percent
        percent = 1 - rate;
    end
end
end