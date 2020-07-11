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

y_teorico = step(planta_teorica, t);
plot(t, y_teorico);
yd_teorico = y_teorico; yd_teorico(1)=0;
for i = 1:length(y_teorico)-1
    yd_teorico(i+1) = (y_teorico(i+1)-y_teorico(i))/t(2);
end

plot(t,y_teorico,t,yd_teorico)

%Trocar aqui
yd_real = yd_teorico/2;
Kp=1;

x__d = Kp*(yd_teorico-yd_real);
close all;
plot(x__d)

%sim('simulacaoNDI', T);

% Modelo INDI
%

%sim('simulacaoINDI', T);
