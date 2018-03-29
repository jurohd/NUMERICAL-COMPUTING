function trap0

%  Integrate  f(x)  over  [a, b]  using composite trapezoidal rule
%  Compares computed and exact value
%  f(x) given at end of file

a=0; b=3;
exact=0.72732289075;


%  calculate integral using composite trapezoidal rule
nk=11;
interv=[10 20 40 80 160 320 640 1280 2560 5120 9714];
fprintf('\n Subinervals  Composite Trapezoidal      Error \n')
for k=1:nk
    n=interv(k);
    % calculate I_T
    I_T(k)=trap_v(a,b,n);
    err(k)=abs(exact-I_T(k));
    fprintf('   n =  %i     I_T = %10.8f      E_T = %8.1e \n',interv(k),I_T(k),err(k));
    pause
end
fprintf('\n')


% function for evaluating y_i
function y_i=trap_v(a,b,n)
xd=linspace(a,b,n+1);
h=xd(2)-xd(1);
sum=0.5*trap_a(a,xd(2),1);
for j=2:n
    sum=sum+trap_a(a,xd(j),j-1);
end
y_i=h*(sum+0.5*trap_a(a,xd(n+1),n));


% function for evaluating v_i 
function v_i=trap_a(a,b,n)
xd=linspace(a,b,n+1);
h=xd(2)-xd(1);
sum=0.5*f(xd(1));
for j=2:n
    sum=sum+f(xd(j));
end
v_i=h*(sum+0.5*f(xd(n+1)));


% function a(t)
function a_i=f(x)
a_i=sin(x^4);


