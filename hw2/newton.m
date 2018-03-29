function newton

%  Solve  f(x) = 0  using Newton's method

%  Input:
%	xa = starting point
%	tol = tolerance for stopping
%	f(x) and df(x) These are at end of file

xa=1;
tol=10^(-3);

% exact solution
xe=1.3140968;

err=1;
it=0;
while err>tol
    xb=xa-f(xa)/df(xa);
    err=abs(xb-xe);
    xa=xb;
    it=it+1; iteration(it)=it; error(it)=abs(xe-xb);
    fprintf('\n %d  Computed Solution = %13.8e    Error = %5.2e',it,xb,error(it))
    pause
end
fprintf('\n\n')




function g=f(x)
e=2.7182818284;
g=log(x)/log(e)-2+x^2;

function g=df(x)
g=1/x+2*x;