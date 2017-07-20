function []=TOOLcurveshow(index,num,stim)
if nargin<=2
    load RAWstimulus.mat
    stim = DATstim;
end
if nargin==1
    num=1:41;
end


    if min(size(eval(['stim{1}.',index])))>1
        disp('index dimension exceeds');
        return;
    end


hold on

for i=num
    gram = eval(['stim{i}.',index]);
    if strcmp(index,'heatgram')
        if stim{i}.score
            plot(gram.x',gram.y,'b');
        else
            plot(gram.x',gram.y,'r');
        end
    else
        if stim{i}.score
            plot(gram,'b');
        else
            plot(gram,'r');
        end
    end
end
