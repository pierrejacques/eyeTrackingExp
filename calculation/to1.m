function out = to1(in)
%��һ���ĺ���

load data
out = in./log(mean(fixLen)).*log(2);