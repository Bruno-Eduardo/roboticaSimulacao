clc; clear all; close all;
s = tf('s');

% parametros ideais
k = 10; c = 1; m = .8;

%aparametros reais
k = 10; c = 1; m = .8;

T = 10; %segundo
t = [0:0.001:T];

% Modelo NDI
%
%x' = A x + B u
A = -1/m*[k c; 0 -m];
B = [-1/m; 0];
C = [1 1];
D = 0;

planta_teorica = 1/(m*s^2+c*s+k);

y = step(planta_teorica, t);
plot(t,y);
yd = y;
for i = 1:length(y)-1
    
end


%sim('simulacaoNDI', T);

% Modelo INDI
%

%sim('simulacaoINDI', T);
