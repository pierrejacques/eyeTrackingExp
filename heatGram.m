function [stimout]=heatGram(d,stim)
if nargin<=1
    load RAWstimulus.mat
    stim = DATstim;
end
if nargin==0
    d=0.000005;
end

if isfield(stim{1},'heatmap')==0
    disp('please calculate heatmap first');
    return;
end

stimout = stim;

for i=1:41
    max=0;
    map = stim{i}.heatmap;
    for x=1:1280
        for y=1:800
            if map(x,y)>max
                max=map(x,y);
            end
        end
    end
    gramx=0:1:floor(max/d);
    gramx=gramx*d;
    gram=zeros(1+floor(max/d),1);
    for x=1:1280
        for y=1:800
            val=map(x,y);
            if val==0
                continue;
            end
            gram(1+floor(val/d))=gram(1+floor(val/d))+1;
        end
    end
    stimout{i}.heatgram.x = gramx;
    stimout{i}.heatgram.y = gram;
end
