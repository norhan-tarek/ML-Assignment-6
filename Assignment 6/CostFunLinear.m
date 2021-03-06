function [ E,X,Y ] = CostFunLinear( X,y,Theta,m)
n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
    X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end
Y= y/mean(y);

E=(1/(2*m))*sum((X*Theta-Y).^2);

end

