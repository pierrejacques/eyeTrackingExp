function [r] = visualize(feature)
load data;
category = category(pics);
score = score(pics);
feature = feature(pics);
r = corr(score', feature');
figure()
boxplot(feature, category);
figure()
plot(score, feature,'x');