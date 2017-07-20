function [out]=ANApearson(stim,index)
% 
% if isfield(stim{1},index)==0
%     disp('no such index');
%     return;
% end

if max(size(eval(['stim{1}.',index])))==1
    score=zeros(41,1);
    tmp=zeros(41,1);
    for i=1:41
        tmp(i)=eval(['stim{i}.',index]);
        score(i)=stim{i}.score;
    end
    out=corr(tmp,score);
else
    score=[];
    leng=[];
    for i=1:41
        score(i)=stim{i}.score;
        leng(i)=length(eval(['stim{i}.',index]));
    end
    for t=1:min(leng)
        tmp=[];
        for i=1:41
            tmp(i)=eval(['stim{i}.',index,'(t)']);
        end
        out(t)=corr(tmp',score');
    end
    hold on
    plot(out);
end