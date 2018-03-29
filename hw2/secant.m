function secant

%  Solves  f(x) = 0  using the secant method

%  Input:
%	xa = first starting point
%	xb = second starting point
%	tol = tolerance for stopping
%	f(x) This is at end of code
u=1.8*10^(-5);
p=1.2;
g=9.8;
m=0.14;
pi=3.1415926;
d=0.075;
a=8*p*m*g/(pi*u^2)

xa=a/25;
xb=a/24;
tol=10^(-5);

% exact solution
xe=1.767129*10^5;

fa=f(xa);
fb=f(xb);
err=3*tol;
it=0;
while err>tol
    xc=xb-fb*(xb-xa)/(fb-fa);
    err=abs(xc-xb);
    xa=xb;  fa=fb;
    xb=xc;  fb=f(xb);
    it=it+1; iteration(it)=it; error(it)=abs(xe-xc);
    fprintf('\n %d  Computed Solution = %13.8e    Error = %5.2e',it,xb,error(it))
    %pause
end

velocity=xe*u/(p*d)
fprintf('\n\n')


function g=f(x)
u=1.8*10^(-5);
p=1.2;
g=9.8;
m=0.14;
pi=3.1415926;
a=8*p*m*g/(pi*u^2);
g=2*x^2/5+6*x^2/(1+sqrt(x))+24*x-a;