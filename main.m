clear all
rand('seed',0)
close all

global MyTestMatrix


rand('seed',0)
%%% generate matrix A and right hand side vector b
A=diag([1/250,[200:250]]);
n=size(A,2); b=ones(n,1); b(1,1)=250^2;
rho=norm(b); b=b/rho; rho=1;
%%% rotate system to avoid that diagonality of A leads to high accuracy 
B=rand(n); [Q,R]=qr(B); 
A=Q*A*Q'; A=(A+A')/2; b=Q*b; 
MyTestMatrix=A;

CondA=condest(A);
fprintf('\nDimension = %i.\nCond(A)   = %5.1e.\n',n,CondA);
fprintf('Cond^2(A) = %5.1e.\n',CondA^2);
t=(1:n)'/n;


%%% set parameters
max_it=30;  tol=1e-12; show=1; max_it=min(max_it,n);
fprintf('\ntol= %7.2e; max_it= %i; display = % i\n',tol,max_it,show)
%%% and shifts
tau=[1.e-16;1.e-4;1;0];




% Hist0


method='mcgls'; 


eval(['help ',method]), pause
eval(method), pause
feval(method,A,b);  pause
[xg,hist] = feval(method,A,b); hist, pause
[xg,hist] = feval(method,A,b,tau,1.e-12,max_it,show); pause
[xg,hist] = feval(method,A,b,tau,[1.e-12,1.e-8],max_it,show); pause
[xg,hist] = feval(method,A,b,tau,max_it,show,1.e-12); pause
[xg,hist] = feval(method,A,b,tau,1); pause

options=struct('re',[1.e-14,1.e-10],'ma',40,'disp',show);
[xg,hist] = feval(method,A,b,tau,options); pause

options.shift=tau;
[xg,hist] = feval(method,A,b,options); pause
[xg,hist] = feval(method,'Op',b,options);  pause
[xg,hist] = feval(method,'Op',b,options,A);  pause
[xg,hist] = feval(method,'Op',b,tau,max_it,show,1.e-12,A);  pause
[xg,hist] = feval(method,'Op',b,options,A,7);  pause
options.ma=20;
[xg,hist,J] = feval(method,'Op0',b,options); J, pause
[xg,hist] = feval(method,'Op1',b,options,A,7);  pause
