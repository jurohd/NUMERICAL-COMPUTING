function interpolates

% polynomial interpolation of data
% compares lagrange and cubic spline 

% data for temperature of the day
xd=[0 2 4 6 8 10 12 14 16 18 20 22 24];
yd=[59 56 53 54 60 67 72 74 75 74 70 65 61];
nx=length(xd); a=xd(1); b=xd(nx);

n=200;
x=linspace(a,b,n);

% evaluate lagrange poly at n points in interval
for ii=1:n
    p(ii)=0;
    for k=1:nx
        p(ii)=p(ii)+yd(k)*ell(k,x(ii),xd);
    end
end

% evaluate cubic spline
ys = nspline(xd,yd,x);

% plot curves
clf
% get(gcf)
set(gcf,'Position', [25 1115 658 230])
co = [0 0 1;
      0 0.5 0;
      1 0 0;
      0 0.75 0.75;
      0.75 0 0.75;
      0.75 0.75 0;
      0.25 0.25 0.25];
set(groot,'defaultAxesColorOrder',co)

hold on
box on
plot(xd,yd,'ok','LineWidth',1.8)

pause

plot(x,ys,'-r','LineWidth',1.6)
plot(x,p,'--b','MarkerSize',7,'LineWidth',2)
grid on
xlabel('x-axis')
ylabel('y-axis')
legend({' Exact',' Natural Spline',' Lagrange'},'Location','NorthWest','FontSize',16,'FontWeight','bold')
set(gca,'FontSize',16,'FontWeight','bold')

% evalue at particular time 11 AM

time=11
pause
for ii=1:n
    pL=0;
    for k=1:nx
        pL=pL+yd(k)*ell(k,time,xd);
    end
end
pS = nspline(xd,yd,time);
pop_lagrange=pL
pop_spline=pS
pause

% evalue at particular time 1 AM the next day

time=25
pause
for ii=1:n
    pL=0;
    for k=1:nx
        pL=pL+yd(k)*ell(k,time,xd);
    end
end
pS = nspline(xd,yd,time);
pop_lagrange=pL
pop_spline=pS


% evalue at particular time 9 AM the next day
time=33
for ii=1:n
    pL=0;
    for k=1:nx
        pL=pL+yd(k)*ell(k,time,xd);
    end
end
pS = nspline(xd,yd,time);
pop_lagrange=pL
pop_spline=pS   


% lagrange basis function
function p=ell(i,x,xd)
[n1 n2]=size(xd);
p=1;
for j=1:n2
    if j ~= i
        p=p*(x-xd(j))/(xd(i)-xd(j));
    end
end