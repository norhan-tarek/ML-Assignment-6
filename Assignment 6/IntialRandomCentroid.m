function [ C ] = IntialRandomCentroid( k,X )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
  [r,c]=size(X);
   Ci= randi(r,1,k);
   C= X(Ci,:);
end

