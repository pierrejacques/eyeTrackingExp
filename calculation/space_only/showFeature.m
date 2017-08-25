function [r, percent] = showFeature(feature)
load data;
category = category(pics);
score = score(pics);
feature = feature(pics);
feature = feature(:)';
r = corr(score', feature');
percent = f_rate(category, feature);
figure()
boxplot(feature, category);
figure()
plot(score, feature,'x');
end

function percent = f_rate(c, f)
percent = 0;
for thres = f
    rate = (sum(and(f>=thres, c==1)) + sum(and(f<thres, c==0)))/40;
    if rate >= 0.5 && rate > percent
        percent = rate;
    end
    if rate < 0.5 && (1 - rate) > percent
        percent = 1 - rate;
    end
end
percent = percent * 100;
end