% --------------------------------1.1-----------------------------------

% (a)

x = 10^9;
y = 10^-300;
z = x/y             % because x/y exceeds Xm (2*10^308)

% (b)

x = Inf;
y = Inf;
z = x/y             % because Inf/Inf is undefined.

% (c)

x = 1;
y = Inf;
z = x/y             % because x/y less than xm (2*10^-308)

% (d)

x = 1+10^-30;
y = 1-10^-30;
z = x/y             % because 10^-30 is less than eps/2,
                    % so x and y are rounded to 1, then x/y = 1


% --------------------------------1.6-----------------------------------
% (a)

a = 100;
n = 365*24;
r = 0.01;

A = a*(1+(r/n))^n

% (b)

n = 365*24*60;
A = a*(1+(r/n))^n

% (c)

n = 365*24*60*1000;
A = a*(1+(r/n))^n

% (d)

n = 365*24*60*10^9;
A = a*(1+(r/n))^n

% (e)

n = 365*24*60*10^12;
A = a*(1+(r/n))^n

% (f)

% The value is incorrect because before taking the power operation
% Since r/n=1.9025875e-17 is less than half of the machine eps 10e-16
% So the number 1+(r/n) is automatically round to 1 by the computer
% in the floating point system. So the edge value for n to take in
% order to avoid this round-off error is r/n > eps/2, then we have
% n < 2r/eps, since 0 < r < 1 we should have 0 < n < 2/eps = 10e+16
% Hence if n>10e+16 we have the incorrect answer


% --------------------------------1.8-----------------------------------

% (a)

% Since the maximum number in the floating system is Xm and e^1000  
% far more exceeds Xm, it will be regarede as Inf, so the answer is 
% undefined since we are trying to compute Inf/Inf, So what we will
% do is just modify the sum by deviding both the numerator and denominator
% by e^k so the sum become 1/(1+e^(-k))

syms k;
a = double(symsum((1)/(1+exp(-k)), k, 0, 1000))

% --------------------------------1.10----------------------------------

% (a) (b) are on the LATEX print
