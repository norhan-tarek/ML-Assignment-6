clc 

X=housepricesdatatrainingdata1(:,11:12);
[r,c]=size(X);
x_cov=cov(X); 
Mean= mean(X);
StandardDeviation = std(X);
%assume that the data is Gaussian distributed 
%exponant=exp(-0.5*(X-Mean)'*(X-Mean)*(1/x_cov));
%pdf=(1/((2*pi)^(c/2))*(x_cov^0.5))*exponant

pdf=mvnpdf(X,Mean,x_cov);
cdf=mvncdf(X,Mean,x_cov);
pdfSort=sort(pdf);
pdfMax=max(pdf);
%choosing epsilon
%epsilon=pdfSort(170);
epsilon=pdfMax*0.1;
%anomly detection
detected=zeros(r,1);
TotalDetection=0;
for i=1:r
    if(pdf(i)<epsilon)
        detected(i)=1;
        TotalDetection=TotalDetection+1;
    end
end
TotalDetection
%Recall = tp/(tp+fn)
%Precision= tp/(tp+fp)
