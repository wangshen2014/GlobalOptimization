clear
clc
% % Set the random stream to get exactly the same output
% rng(14,'twister')


% First using GlobalSearch
gs = GlobalSearch;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
sixmin = @(x)(4*x(1)^2 - 2.1*x(1)^4 + x(1)^6/3 ...
    + x(1)*x(2) - 4*x(2)^2 + 4*x(2)^4);
problem = createOptimProblem('fmincon','x0',[-1,2],...
    'objective',sixmin,'lb',[-3,-3],'ub',[3,3],...
    'options',opts);
[xming,fming,flagg,outptg,manyminsg] = run(gs,problem);


% First using MultiStart
ms = MultiStart;
opts = optimoptions(@fmincon,'Algorithm','interior-point');
sixmin = @(x)(4*x(1)^2 - 2.1*x(1)^4 + x(1)^6/3 ...
    + x(1)*x(2) - 4*x(2)^2 + 4*x(2)^4);
problem = createOptimProblem('fmincon','x0',[-1,2],...
    'objective',sixmin,'lb',[-3,-3],'ub',[3,3],...
    'options',opts);
[xminm,fminm,flagm,outptm,manyminsm] = run(ms,problem,50);


% f=[-150;-175];
% A=[7 11;10 8];
% b=[77;80];
% Aeq=[0 0;0 0];
% beq=[0;0];
% LB=[0;0];UB=[9;6];
% x=linprog(f,A,b,Aeq,beq,LB,UB)

% https://optimization.mccormick.northwestern.edu/index.php/Optimization_with_absolute_values

f=[1;0;0;0];
A=[-1 0 0 0;
    -1 0 0 1;
    -1 0 1 0;
    -1 0 -1 0;
    0 -1 0 1;
    0 -1 0 -1;];
b=[-1e-10;1e-10;1e-10;1e-10;1e-10;1e-10];
Aeq=[0 0 1 1];
beq=[1];
LB=[];UB=[];
x=linprog(f,A,b,Aeq,beq,LB,UB)