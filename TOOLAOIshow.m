function []=TOOLAOIshow(num,stim)
if nargin<=1
    load RAWstimulus.mat
    stim = DATstim;
end



if isfield(stim{num},'heatmap')
    map = stim{num}.heatmap;
else
    disp('please calculate heatmap first');
    return;
end

colormax=max(max(stim{num}.AOImap));

   figure();
   pcolor(flipud(map'))
   shading flat
   caxis([0,colormax]);
