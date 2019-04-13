function [ C ] = CentroidAdjustment( X,K,Ci )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(X);
noElmentsCentroidK = zeros(K,1);
sumOverCentroidK = zeros(K,c);
C=zeros(K,c);
for i = 1:r
	j = Ci(i);
	noElmentsCentroidK(j) = noElmentsCentroidK(j)+1;
	sumOverCentroidK(j,:) =sumOverCentroidK(j,:)+ X(i,:);
end

for f=1:K
C(f,:) = sumOverCentroidK(f,:)/noElmentsCentroidK(f);
end

end

