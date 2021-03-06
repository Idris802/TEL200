function walking(plan)

    Tz = [-1 0 0 0; 0 -1 0 0; 0 0 1 0; 0 0 0 1];
    opt.niterations = 500;
    opt.movie = [];
    
    opt = tb_optparse(opt);
    
L1 = 0.1; L2 = 0.1;

fprintf('create leg model\n');

% create the leg links based on DH parameters
%                    theta   d     a  alpha  
links(1) = Link([    0       0    0   pi/2 ], 'standard');
links(2) = Link([    0       0    L1   0   ], 'standard');
links(3) = Link([    0       0   -L2   0   ], 'standard');

% now create a robot to represent a single leg
leg = SerialLink(links, 'name', 'leg', 'offset', [pi/2   0  -pi/2]);

% define the key parameters of the gait trajectory, walking in the
% x-direction
xf = 5; xb = -xf;   % forward and backward limits for foot on ground
y = 5;              % distance of foot from body along y-axis
zu = 2; zd = 5;     % height of foot when up and down
% define the rectangular path taken by the foot
segments = [xf y zd; xb y zd; xb y zu; xf y zu] * 0.01;

% build the gait. the points are:
%   1 start of walking stroke
%   2 end of walking stroke
%   3 end of foot raise
%   4 foot raised and forward
%
% The segments times are :
%   1->2  3s
%   2->3  0.5s
%   3->4  1s
%   4->1  0.5ss
%
% A total of 4s, of which 3s is walking and 1s is reset.  At 0.01s sample
% time this is exactly 400 steps long.
%
% We use a finite acceleration time to get a nice smooth path, which means
% that the foot never actually goes through any of these points.  This
% makes setting the initial robot pose and velocity difficult.
%
% Intead we create a longer cyclic path: 1, 2, 3, 4, 1, 2, 3, 4. The
% first 1->2 segment includes the initial ramp up, and the final 3->4
% has the slow down.  However the middle 2->3->4->1 is smooth cyclic
% motion so we "cut it out" and use it.
fprintf('create trajectory\n');

segments = [segments; segments];
tseg = [3 0.25 0.5 0.25]';
tseg = [tseg; tseg];
x = mstraj(segments, [], tseg, segments(1,:), 0.01, 0.1);

% pull out the cycle
fprintf('inverse kinematics (this will take a while)...');
xcycle = x(100:500,:);
qcycle = leg.ikine( transl(xcycle), 'mask', [1 1 1 0 0 0] );

% dimensions of the robot's rectangular body, width and height, the legs
% are at each corner.
W = 0.1; L = 0.2;

% a bit of optimization.  We use a lot of plotting options to 
% make the animation fast: turn off annotations like wrist axes, ground
% shadow, joint axes, no smooth shading.  Rather than parse the switches 
% each cycle we pre-digest them here into a plotopt struct.
% plotopt = leg.plot({'noraise', 'nobase', 'noshadow', ...
%     'nowrist', 'nojaxes'});
% plotopt = leg.plot({'noraise', 'norender', 'nobase', 'noshadow', ...
%     'nowrist', 'nojaxes', 'ortho'});

fprintf('\nanimate\n');

plotopt = {'noraise', 'nobase', 'noshadow', 'nowrist', 'nojaxes', 'delay', 0};

% create 4 leg robots.  Each is a clone of the leg robot we built above,
% has a unique name, and a base transform to represent it's position
% on the body of the walking robot.


% walk!
k = 1;
A = Animate(opt.movie);

path = plan;


for i=1:length(path)

    x = path(i, 1);
    y = path(i, 2);
    angle = path(i, 3);

    % draw the robot's body
    % create a fixed size axis for the robot, and set z positive downward
    figure(2)
    clf; axis([-0.3+x 0.3+x -0.2+y 0.2+y -0.15 0.05]); set(gca,'Zdir', 'reverse')
    hold on
    
    % Plotting the path that the robot should follow.
    v0 = zeros(length(path), 1);
    plot3(path(:,1),path(:,2),v0(:),'r')

    % Translating point edges of body to center
    tempx1 = 0.1;
    tempy1 = 0.05;

    tempx2 = -0.1;
    tempy2 = 0.05;

    tempx3 = -0.1;
    tempy3 = -0.05;

    tempx4 = 0.1;
    tempy4 = -0.05;

    % Applying rotations for each edge 
    xy1 = [(tempx1*cos(angle)-tempy1*sin(angle)) (tempx1*sin(angle)+tempy1*cos(angle))];
    xy2 = [(tempx2*cos(angle)-tempy2*sin(angle)) (tempx2*sin(angle)+tempy2*cos(angle))];
    xy3 = [(tempx3*cos(angle)-tempy3*sin(angle)) (tempx3*sin(angle)+tempy3*cos(angle))];
    xy4 = [(tempx4*cos(angle)-tempy4*sin(angle)) (tempx4*sin(angle)+tempy4*cos(angle))];

    % Moving the base according to the legs positioning
    patch([xy1(1)+x xy2(1)+x xy3(1)+x xy4(1)+x], [xy1(2)+y xy2(2)+y xy3(2)+y xy4(2)+y], [0 0 0 0], ...
    'FaceColor', 'r', 'FaceAlpha', 0.5)
    

    legs(1) = SerialLink(leg, 'name', 'leg1', 'base', transl(xy1(1)+x, xy1(2)+y, 0)*trotz(angle));
    legs(2) = SerialLink(leg, 'name', 'leg2', 'base', transl(xy2(1)+x, xy2(2)+y, 0)*trotz(angle));
    legs(3) = SerialLink(leg, 'name', 'leg3', 'base', transl(xy3(1)+x, xy3(2)+y, 0)*trotz(angle)*Tz);
    legs(4) = SerialLink(leg, 'name', 'leg4', 'base', transl(xy4(1)+x, xy4(2)+y, 0)*trotz(angle)*Tz);
    
    % instantiate each robot in the axes
    for j=1:4
        legs(j).plot(qcycle(1,:), plotopt{:});
    end
    hold off
    
    legs(1).animate( gait(qcycle, k, 0,   0));
    legs(2).animate( gait(qcycle, k, 100, 0));
    legs(3).animate( gait(qcycle, k, 200, 1));
    legs(4).animate( gait(qcycle, k, 300, 1));
    
    drawnow
    k = k+1;
    A.add();
end

end