function out=EF_IF(in)

out=in;

for i=1:41     %%%%%
    matX=[];
    matY=[];
    for j=1:29   %%%%%
        tmp=in{i}.fixation{j};
        start=0;
        for k=1:length(tmp(:,1))
            for t=start+1:start+tmp(k,2)
                matX(t,j)=tmp(k,3);
                matY(t,j)=tmp(k,4);
            end
            start=t;
        end
    end
    mat{i,1}=matX;
    mat{i,2}=matY;
end

for i=1:41    %%%%%
    tmp=mat{i,1};
    for j=3000:-1:1
        flag=0;
        for k=1:29    %%%%%
            if  tmp(j,k)==0
                flag=flag+1;
            end
        end
        if flag==2
            break;
        end
    end
    mat{i,1}(j+1:length(tmp(:,1)),:)=[];
    mat{i,2}(j+1:length(tmp(:,1)),:)=[];
end

parfor i=1:41   %%%%%
    IF=[];
    EF=[];
    matX=mat{i,1};
    matY=mat{i,2};
    l=length(matX(:,1));
    for t=1:l
        IF(t)=Island(matX(t,:)',matY(t,:)');
        EF(t)=Ellipse(matX(t,:)',matY(t,:)');
    end
    out{i}.EF=EF;
    out{i}.IF=IF;
end