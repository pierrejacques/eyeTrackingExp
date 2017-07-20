function [stimout]=dither(strength,stim)
if nargin<=1
    load RAWstimulus.mat
    stim = stimulus;
end
if nargin==0
    strength=1;
end

times=10*strength;
spaces=5*strength;
stimout=stim;

for i=1:length(stim)
    for j=1:29
        tmpmat = stim{i}.fixation{j};
        for k=1:length(tmpmat(:,1))
            tmpmat(k,2) = round(randn*times)+tmpmat(k,2);
            ang = pi*rand;
            dist = spaces*randn;
            tmpmat(k,3) = tmpmat(k,3) + round(dist * cos(ang));
            tmpmat(k,4) = tmpmat(k,4) + round(dist * sin(ang));
        end
        stimout{i}.fixation{j} = tmpmat;
    end
end

        