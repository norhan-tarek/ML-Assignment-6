clc

% no of cluster K 
K=2;
%X traing set
X=housepricesdatatrainingdata1(:,11:12);
[m,n]=size(X);
J=zeros(1,n);
%Best centroid 
CB=zeros(1,K);
% Best centroid assignment
CBx=zeros(size(X));
% Best error J
JB=Inf;
for i=1:3
%Centroids C
C=IntialRandomCentroid(K,X);
%Centroids assignment Cx
[Cx,C1,C2,Ci]= NearestCendroid( X,C,K );
% Error Function J 
J(1)= (1/m)* sum(sum((X-Cx).^2));
T=1;
v=1;
while T==1
 v=v+1;
C=CentroidAdjustment( X,K,Ci);
%Centroids assignment Cx
[Cx,C1,C2,Ci]= NearestCendroid( X,C,K );
% Error Function J 
J(v)= (1/m)* sum(sum((X-Cx).^2));
q=(J(v-1)-J(v))./J(v-1);
figure(v)
scatter(C1(:,1),C1(:,2),'r');
hold on
scatter(C2(:,1),C2(:,2),'b');
hold on
scatter(C(:,1),C(:,2),'k');
hold off
if q <.00001;
    T=0;
end
end
if(JB>J(v))
    CB=C;
    CBx=Cx;
    JB=J(v);
end
end
 

