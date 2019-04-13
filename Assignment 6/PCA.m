clc

x = housepricesdatatrainingdata1(:,4:21);
Corr_x = corr(x);
x_cov=cov(x);
 [U S V] =  svd(x_cov);
 
 eigen= zeros(1,18);
 
 for j=1:18
     eigen(j)= S(j,j);
 end
 
SumOver_k=sum(eigen);
alpha=0.001;
for i=1:18
    t = 1-(sum(eigen(1,1:i))/SumOver_k);
    if(t~=0 & t<=alpha)
        K=i;
        break;
    end
end
R= U(:,1:K)'* x';
A= U(:,1:K)*R;
Error= (1/K) *(sum(sum((x-A').^2)));
ErrorPercentage=Error/(sum(sum(x.^2)));
[m,n]=size(R);
y=housepricesdatatrainingdata1(:,3);
X=[ones(n,1) transpose(R)];

[E,theta]=RegressionFun(X,y,n,t);
figure (1)
plot(E)