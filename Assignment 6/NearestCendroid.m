function [ Cx,C1,C2,Ci] = NearestCendroid( X,C,K )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(X);
Cx=zeros(size(X));
Ci=zeros(1,r);
C1=[];
C2=[];
for i = 1:size(X,1)
	min = Inf;
	for j = 1:K
		diff = sum((X(i,:) - C(j,:)).^2);
		if min > diff
			min = diff;
			Cx(i,:) = C(j,:);
            Ci(i)=j;
            if(j==1)
            C1=[X(i,:);C1];
            end
            if(j==2)
            C2=[X(i,:);C2];
            end
		end
	end
end			

end

