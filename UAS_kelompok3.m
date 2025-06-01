%Parameter motor
R = 0.5;
L = 0.0003;
J = 0.0005;
B = 0.0032;
Kt = 0.0620;
Ke = 0.0620;

%Transfer function G(s)=
num= [Kt];
den= [L*J, (L*B + R*J),(R*B + Ke*Kt)];
G= tf(num,den);
