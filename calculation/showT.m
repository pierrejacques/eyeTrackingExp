function [rmat] = showT(data)
load data
load enumT
% weightless_1 = {};
% for pic = pics
%     pre = zeros(1, 3000);
%     for user = users
%         pre = pre + singleByT{user, pic};
%     end
%     pre = pre / 30;
%     weightless_1{pic} = weightless{pic}./pre;
% end

figure(1);
hold on;
for pic = pics
    if category(pic) == 0
        plot(data{pic}(2:3000), 'r-');
    end
    if category(pic) == 1
        plot(data{pic}(2:3000), 'b-');
    end
end
% 
% figure(2);
% hold on;
% for pic = pics
%     if category(pic) == 0
%         plot(weightless_1{pic}, 'r-');
%     end
%     if category(pic) == 1
%         plot(weightless_1{pic}, 'b-');
%     end
% end

figure(2);
rmat = zeros(3000, 1);
for t = 1:3000
    entMat = [];
    for pic = pics
        entMat(pic) = data{pic}(t);
    end
    rmat(t) = corr(score(pics)', entMat(pics)');
end
plot(rmat);
    