function [ JBr ] = ClusteringReduced( K,Xr)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
% reduced Xr

Corr_x = corr(Xr);
x_cov=cov(Xr);
 [U S V] =  svd(x_cov);
 [o,p]=size(Xr);
eigen= zeros(1,p);
 
 for j=1:p
     eigen(j)= S(j,j);
 end
 SumOver_k=sum(eigen);
alpha=0.001;
for i=1:p
    t = 1-(sum(eigen(1,1:i))/SumOver_k);
    if(t~=0 & t<=alpha)
        M=i;
    end
end
R= transpose(U(:,1:M)'* Xr');

 [r,c]=size(Xr);
Jr=zeros(1,c);
%Best centroid 
CBr=zeros(1,K);
% Best centroid assignment
CBxr=zeros(size(R));
% Best error J
JBr=Inf;

for i=1:1
%Centroids C
Cr=IntialRandomCentroid(K,R);
%Centroids assignment Cx
[Cxr,C1r,C2r,Cir]= NearestCendroid( R,Cr,K );
% Error Function J 
Jr(1)= (1/r)* sum(sum((R-Cxr).^2));
T=1;
v=1;
while T==1
 v=v+1;
Cr=CentroidAdjustment( R,K,Cir);
%Centroids assignment Cx
[Cxr,C1r,C2r,Cir]= NearestCendroid( R,Cr,K );
% Error Function J 
Jr(v)= (1/r)* sum(sum((R-Cxr).^2));
q=(Jr(v-1)-Jr(v))./Jr(v-1);
if q <.00001;
    T=0;
end
end
if(JBr>Jr(v))
    CB=Cr;
    CBx=Cxr;
    JBr=Jr(v);
end
end

end

