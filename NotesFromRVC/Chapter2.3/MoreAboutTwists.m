tw = Twist('R', [1 0 0], [0 0 0]);
disp(tw)

% The screw in space or the 6-vector
disp(tw.S)

%  where v ∈ R 3 is referred to as the moment and encodes the position of the action line
% in space and the pitch of the screw
disp(tw.v)

% The direction of the screw axis
disp(tw.w)

% creating the special-euclidiean room in 3 dimensions
disp(tw.se)

% Homogenous transformation are created by 
disp(tw.T(0.3))

% Line of the screw represented in tucker coordinates
disp(tw.line)

% compounding two lists 
t2 = tw * tw;
tr2angvec(t2.T)
