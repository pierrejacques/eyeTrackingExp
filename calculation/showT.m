function [rmat, rmat_1] = showT()
load data
load enumT
weightless_1 = {};
for pic = pics
    pre = zeros(1, 3000);
    for user = users
        pre = pre + singleByT{user, pic};
    end
    pre = pre / 30;
    weightless_1{pic} = weightless{pic}./pre;
end

% for pic = pics
%     if category(pic) == 0
%         plot(weightless{pic}, 'r-');
%     end
%     if category(pic) == 1
%         plot(weightless{pic}, 'b-');
%     end
% end

rmat = zeros(3000, 1);
rmat_1 = zeros(3000, 1);
figure();
for t = 1:3000
    entMat = [];
    entMat_1 = [];
    for pic = pics
        entMat(pic) = weightless{pic}(t);
        entMat_1(pic) = weightless_1{pic}(t); %#ok<AGROW>
    end
    rmat(t) = corr(score(pics)', entMat(pics)');
    rmat_1(t) = corr(score(pics)', entMat_1(pics)');
end
plot(rmat);
hold on
plot(rmat_1, 'r');
    