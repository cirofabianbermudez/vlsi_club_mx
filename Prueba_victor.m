clc
clear all
close all
%% Lorenz System
syms sigma beta rho x y z

f= sigma*(y-x); 
g= rho*x-x*z-y;
h=x*y-beta*z;

% f= -sigma*x + sigma*y; 
% g= rho*x - y - x*z;
% h= x*y-beta*z;

F=[f;g;h]  %%Function
% sol_num=eval(F)  %numerical solution


%% Parametros
sigma = 10;
beta = 8/3;
rho = 30;
a=3;
k1=1/a;
k2=1/a;
k3=1/a;

sol_num=eval(F)  %numerical solution

fs= sigma*((y/k2)-(x/k1)); 
gs= rho*(x/k1)-(x/k1)*(z/k3)-(y/k2);
hs=(x/k1)*(y/k2)-beta*(z/k3);


Fs=[fs;gs;hs];  %%Function
sol_nums=eval(Fs)  %numerical solution

fs2= sigma*(y-x); 
gs2= rho*x-a*rho*x*z-y;
hs2=x*y-beta*z;

Fs2=[fs2;gs2;hs2];  %%Function
sol_nums2=eval(Fs2)  %numerical solution

%% Simulación

% funct = @(t,x) [-sigma*x(1) + sigma*x(2); 
%              rho*x(1) - x(1)*x(3) - x(2) ; 
%              x(1)*x(2) - beta*x(3)];
% [t,x1] = ode45(funct,[0 100],[1 1 1]);     % Runge-Kutta 4th/5th order ODE solver
% 

funct = @(t,x) [sigma*(x(2)-x(1)); 
             rho*x(1)-x(1)*x(3)-x(2) ; 
             x(1)*x(2)-beta*x(3)];
[t,x1] = ode45(funct,[0 100],[0.1 0.1 0.1]);     % Runge-Kutta 4th/5th order ODE solver

figure
subplot (1,3,1)
plot(x1(:,1),x1(:,2))
grid
subplot (1,3,2)
plot(x1(:,1),x1(:,3))
grid
subplot (1,3,3)
plot(x1(:,2),x1(:,3))
grid

figure
subplot (3,1,1)
plot(t,x1(:,1))
grid
subplot (3,1,2)
plot(t,x1(:,2))
grid
subplot (3,1,3)
plot(t,x1(:,3))
grid

   %% %% Simulación escalamiento

functs = @(t,x) [sigma*((x(2)/k2)-(x(1)/k1)); 
             rho*(x(1)/k1)-(x(1)/k1)*(x(3)/k3)-(x(2)/k2) ; 
             (x(1)/k1)*(x(2)/k2)-beta*(x(3)/k3)];
[ts,x1s] = ode45(functs,[0 100],[0.1 0.1 0.1]);     % Runge-Kutta 4th/5th order ODE solver


figure
subplot (1,3,1)
plot(x1s(:,1),x1s(:,2))
grid
subplot (1,3,2)
plot(x1s(:,1),x1s(:,3))
grid
subplot (1,3,3)
plot(x1s(:,2),x1s(:,3))
grid


figure
subplot (3,1,1)
plot(ts,x1s(:,1))
grid
subplot (3,1,2)
plot(ts,x1s(:,2))
grid
subplot (3,1,3)
plot(ts,x1s(:,3))
grid

%% %% Simulación escalamiento 2

fs2= ; 
gs2= ;
hs2=;


functs2 = @(t,x) [sigma*(x(2)-x(1)); 
             rho*x(1)-a*rho*x(1)*x(3)-x(2); 
             x(1)*x(2)-beta*x(3)];
[ts2,x2s] = ode45(functs,[0 100],[0.1 0.1 0.1]);     % Runge-Kutta 4th/5th order ODE solver


figure
subplot (1,3,1)
plot(x2s(:,1),x2s(:,2))
grid
subplot (1,3,2)
plot(x2s(:,1),x2s(:,3))
grid
subplot (1,3,3)
plot(x2s(:,2),x2s(:,3))
grid


figure
subplot (3,1,1)
plot(ts2,x2s(:,1))
grid
subplot (3,1,2)
plot(ts2,x2s(:,2))
grid
subplot (3,1,3)
plot(ts2,x2s(:,3))
grid


%% GM-C implementation
% clc
% clear all
% close all
syms gsigma gbeta grho g1 g2 g3 C x y z


fi= gsigma*((g1/C)*y-(g1/C)*x); 
gi= rho*(g1/C)*x-(g1/C)*x*(g1/C)*z-(g1/C)*y;
hi= (g1/C)*x*(g1/C)*y-beta*(g1/C)*z;

F=[fi;gi;hi]  %%Function

% Parametros
C=1e-6
g1=1/C
g2=9*g1
gsigma=10*g1
grho= 3.11*g1
gbeta= (8/3)*g1 

sol_num=eval(F)  %numerical solution

%% Simulación escalamiento
% Multiplicador x10

funci = @(t,x) [gsigma*((g1/C)*x(2)-(g1/C)*x(1));
    rho*(g1/C)*x(1)-(g1/C)*x(1)*(g1/C)*x(3)-(g1/C)*x(2);
    (g1/C)*x(1)*(g1/C)*x(2)-beta*(g1/C)*x(3) ];
[ti,xsi] = ode45(funci,[0 100],[.01 .01 .01]);     % Runge-Kutta 4th/5th order ODE solver

figure
subplot (1,3,1)
plot(xsi(:,1),xsi(:,2))
grid
subplot (1,3,2)
plot(xsi(:,1),xsi(:,3))
grid
subplot (1,3,3)
plot(xsi(:,2),xsi(:,3))
grid

figure
subplot (3,1,1)
plot(ti,xsi(:,1))
grid
subplot (3,1,2)
plot(ti,xsi(:,2))
grid
subplot (3,1,3)
plot(ti,xsi(:,3))
grid
_2