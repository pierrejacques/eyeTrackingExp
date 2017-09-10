function [all_mean, mean_mat, max_mat, min_mat] = duration()
load ../data

all_mean = zeros(1, max(pics));
mean_mat = zeros(max(users), max(pics));
max_mat = mean_mat;
min_mat = mean_mat;

for pic = pics
    v = [];
    for user = users
        dur_mat = fixations{user, pic}(:, 2);
        max_mat(user, pic) = max(dur_mat);
        min_mat(user, pic) = min(dur_mat);
        mean_mat(user, pic) = mean(dur_mat);
        v = [v;dur_mat];
    end
    all_mean(pic) = mean(v);
end

