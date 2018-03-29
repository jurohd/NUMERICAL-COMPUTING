function matrixP

for in=1:4
    n=in*4;
    
    % enter matrix A
    A=3*pascal(n);
    
    % pick exact solution
    x=ones(n,1);
    b=A*x;
    
    % solve equation
    xm=A\b;
    xi=inv(A)*b;
    r=b-A*xm;
    
    % compute errors/results
    errorXM=norm(x-xm,inf)/norm(x,inf);
    errorXI=norm(x-xi,inf)/norm(x,inf);
    r_norm=norm(r,inf);
    kA=cond(A,inf);
    epskA=eps*kA;
    
    fprintf('\n n = %d   ErrorXM = %5.3e   ErrorXI = %5.3e  \n||r|| = %5.3e  K(A) = %5.3e  eps*K(A) = %5.3e\n',n,errorXM,errorXI,r_norm, kA, epskA)
end
