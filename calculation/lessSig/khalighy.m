function [individual_mat, all] = khalighy()
load ../data

for pic = pics
    v = [];
    for user = users
        fixmat = fixations{user, pic};
        individual_mat(user, pic) = size(fixmat, 1)*std(fixmat(:, 2));
        v = [v; fixmat(:, 2)];
    end
    all(pic) = length(v)*std(v);
end
