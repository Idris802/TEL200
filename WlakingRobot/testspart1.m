%% PART 1: MOTION PLANNING

% Robot model segments

%%
% Test moving forward 10 cm only
pathforward = createpath([10], [0], 10);
walking(pathforward)

%%
% Test standing still and rotating 1 degree = 0.0174532925 anticlockwise
pathrotation = createpath([0], [1], 10);
walking(pathrotation)

%%
% Test of motion primitives

% 1. Move the robot 100 cm straight forward, i.e., from point A = (0, 0, 0) to B = (100, 0, 0)
pathf10 = createpath([10], [0], 10);
walking(path10)

%%
% 2. Turn the robot 10 degrees clock-/anticlockwise, i.e., from A = (0, 0, 0) to C = (0, 0, ±10)
pathr10 = createpath([0], [10], 10);
walking(pathr10)

%%
% 3. Combine the two aforementioned points to move the robot from point A with straight
%    heading (A = (0, 0, 0) ) to point D with heading phi = ±10 degrees (D = (100, 0, ±10)).
pathw10r10 = createpath([100], [10], 10);
walking(pathw10r10)