function []=TOOLgramlog(num,stim)
if nargin<=1
    load RAWstimulus.mat
    stim = DATstim;
end
if nargin==0
    flag=1;
else
    flag=0;
end

if isfield(stim{1},'heatgram')==0
    disp('please calculate heatgram first');
    return;
end

hold on
if flag==1
   for i=1:41
       gram = stim{i}.heatgram;
       if stim{i}.score
           plot(gram.x',log(gram.y),'b');
       else
           plot(gram.x',log(gram.y),'r');
       end
   end
else
   gram = stim{num}.heatgram;
   plot(gram.x',log(gram.y),'k');
end