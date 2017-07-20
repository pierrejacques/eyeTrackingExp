function [stimout]=heatmap(stim)
if nargin<1
    load RAWstimulus.mat
    stim = RAWstim;
end
stimout=stim;

parfor i=1:41
    tmpmap=zeros(1280,800);
    sum=0;
    for j=1:29
        tmpmat=stim{i}.fixation{j};
        l=length(tmpmat(:,1));
        for k=1:l
            x=tmpmat(k,3);
            y=tmpmat(k,4);
            if x>0 && y>0 && x<1280 && y<800
                tmpmap(x,y)=tmpmap(x,y)+tmpmat(k,2);
                sum=sum+tmpmat(k,2);
            end
        end
    end
    %the gauss process
    r=35;
    map=zeros(1280,800);
    for ii=1:1280
        for jj=1:800
            if tmpmap(ii,jj)>0
                for dx=-round(6*r):round(6*r)
                    for dy=-round(6*r):round(6*r)
                        x=ii+dx;
                        y=jj+dy;
                        if x>0 && x<1280 && y>0 && y<800
                            r2=dx*dx+dy*dy;
                            map(x,y)=map(x,y)+tmpmap(ii,jj)*exp(-r2/2/r/r)/sqrt(2*pi)/r;
                        end
                    end
                end
            end
        end
    end
    stimout{i}.heatmap=map/sum;
end

