% Specifying a unit twist 
tw = Twist('R', [1 0 0], [0 0 0]);
disp(tw)

% SE(3)-homogenous transformation
Transformation = tw.T(0.3);
disp(Transformation)

% trotx(0.3) == tw.T(0.3)

% Translation in the y-direction 
tw = Twist('T', [0 1 0]);
disp(tw)

Transformation = tw.T(2);
disp(Transformation)

% Defining a frame {X}
X = transl(3, 4, -4); % Translational points for our frame

% Range of angles to for x to roatate about
angles = [0:0.3:15];

%            direction   point    pitch
%                x y z
tw = Twist('R', [0 0 1], [2 3 2], 0.5);

tranimate(@(theta) tw.T(theta) * X, angles, ...
    'lenght', 0.5, 'retain', 'rgb', 'notext');

% Screw axis is the line 
L = tw.line;
disp(L)

L.plot('k', 'LineWidth', 2)


% Converting an arbitary homogenous transformation to a nonunit
% twist
T = transl(1, 2, 3) * eul2tr(0.3, 0.4, 0.5);
tw = Twist(T);
disp(tw)


% The picth of the twist is 
disp(tw.pitch)

% And the rotation abou the axis is 
disp(tw.theta)

% And a point lying on the twist axis is
disp(tw.pole)

