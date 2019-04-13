clc
Xr=housepricesdatatrainingdata1(:,4:21);
K=[2,3,4,5,6,8,10];
JBr=zeros(1,7);
for i=1:7
  JBr(i)=  ClusteringReduced( K(i),Xr);
end
figure(2)
plot(K,JBr);