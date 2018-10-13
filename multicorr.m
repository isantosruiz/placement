function r = multicorr(X,y)
%multicorr  Multiple correlation coefficient
%--------------------------------------------------------
%   Sintax
%       r = multicorr(X,y)
%--------------------------------------------------------
%   Arguments
%       X : Matrix with the values of independent
%           variables arranged in columns
%       y : Column vector with the values of the
%           dependent variable
%       r : Multiple correlation coefficient
%--------------------------------------------------------
%   Ildeberto de los Santos Ruiz, 2018
%--------------------------------------------------------
X = [ones(size(y)),X];
b = X\y;
yhat = X*b;
r = corr(y,yhat);