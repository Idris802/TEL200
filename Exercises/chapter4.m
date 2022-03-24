% 1. For a 4-wheel vehicle with L = 2 m and width between wheel centers of 1.5 m
% a) What steering wheel angle is needed for a turn rate of 10 deg s−1
% at a forward 
% speed of 20 km h−1?

% L = 2 m
% W = 1.5 m
% gamma = ? 
% v = 5.55555556 m/s 
% theta = 10 1/s

% theta = v/L * tan(gamma)
% gamma = arctan(theta*L/v) = arctan( (10/s * 2 m) / 5.55555556 m/s) = 1.30
%% 
% b) compute the difference in wheel steer angle for Ackermann steering around 
% curves of radius 10, 50 and 100 m

L = 2;

r = [10 50 100];

w = 1.5;

rl = r - w/2;

rr = r + w/2;

rd = (atan(L./rl) - atan(L./rr)) * (180/pi)

%% 

% c) If the vehicle is moving at 80 km h−1 compute the difference in back 
% wheel rotation rates for curves of radius 10, 50 and 100 m.

Rw = 0.3;

R = [10 50 100];

RLeft = R - w/2;
RRight = R + w/2;

v = 80 * (1000/3600);

omegaLeft = ((v ./ R) .* RLeft/Rw); 
omegaRight = ((v ./ R) .* RRight/Rw);  

Rd = omegaRight./omegaLeft

%% 

% 2. Write an expression for turn rate in terms of the angular rotation rate
% of the two back wheels. Investigate the effect of errors in wheel radius 
% and vehicle width.

syms theta omega Rw v R RRight RLeft real

theta = v/R;

v = omega * Rw;

thetaL = v/RRight
thetaR = v/RLeft

%% 
% 3. Consider a car and bus with L = 4 and 12 m respectively. To follow a 
% curve with radius of 10, 20 and 50 m determine the respective steered 
% wheel angles.
LCar = 4;
LBus = 12;

R = [10 20 50];

% R = L/tan(γ) -->  γ = arctan(L/R)
gammaCar = atan(L./R) * 180/pi
gammaBus = atan(L./R) * 180/pi

