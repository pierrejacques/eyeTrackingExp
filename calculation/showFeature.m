function [r, percent] = showFeature(feature)
load data;
raw_feature = feature(:)';
raw_score = score(:)';
category = category(pics);
score = score(pics);
feature = feature(pics);
feature = feature(:)';
r = corr(feature', score');
[percent, pos] = f_rate(category, feature);
% boxplot(feature, category);
anova1(feature, category);
figure()
plot(feature, score,'x');
hold on
for i = 1:40
    idx = map(i);
    text(raw_feature(idx), raw_score(idx), num2str(i));
end
plot([pos, pos],[0, 1]);
end

function [percent, pos] = f_rate(c, f)
percent = 0;
for thres = f
    rate = (sum(and(f>thres, c==1)) + sum(and(f<=thres, c==0)))/40;
    if rate >= 0.5 && rate > percent
        percent = rate;
        pos = thres;
    end
    if rate < 0.5 && (1 - rate) > percent
        percent = 1 - rate;
        pos = thres;
    end
end
percent = percent * 100;
end