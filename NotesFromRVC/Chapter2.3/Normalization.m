R = eye(3, 3);
disp(det(R) - 1)

for i=1:100
    R = R * rpy2r(0.2, 0.3, 0.4);
end
disp(det(R) - 1)

% Normalization 
R = trnorm(R);
disp(det(R) - 1)





