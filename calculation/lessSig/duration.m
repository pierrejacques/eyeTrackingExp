function [all_mean, mean_mean, mean_max, mean_min] = duration()
load ../data

all_mean = zeros(1, max(pics));
mean_mean = all_mean;
mean_max = all_mean;
mean_min = all_mean;

for pic = pics
    v = [];
    mean_mat = zeros(1, max(users));
    max_mat = mean_mat;
    min_mat = mean_mat;
    for user = users
        dur_mat = fixations{user, pic}(:, 2);
        max_mat(user) = max(dur_mat);
        min_mat(user) = min(dur_mat);
        mean_mat(user) = mean(dur_mat);
        v = [v;dur_mat];
    end
    all_mean(pic) = mean(v);
    mean_mean(pic) = mean(mean_mat);
    mean_max(pic) = mean(max_mat);
    mean_min(pic) = mean(min_mat);
end

