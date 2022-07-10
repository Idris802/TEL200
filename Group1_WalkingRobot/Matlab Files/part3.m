poseGraph = PoseGraph('killian.g2o', 'laser');
scanMap = poseGraph.scanmap();

%% Making a killian map from the scanned map
M = -10;
MyKillianMap = MakeKillianMap(scanMap, M);

% Checks if our modified killian map is equal to the original
if isequal(MyKillianMap, KillianMap)
    disp("The maps are equal.")
else
    disp("The maps are not equal!")
end

OccGrid(MyKillianMap)
OccGrid(KillianMap)
pg.plot_occgrid(MyKillianMap)

%% Using PRM to cover entire free space
np = 1000;
prm = PRM(MyKillianMap);
prm.plan('npoints', np)
prm.plot

%% Extracting pose and plotting it as a function of time
M = pg.graph.vertexlist; % The model data 
pg1 = pg.scanxy(3873); 
pg2 = pg.scanxy(1);
T_initial = icp(pg1, pg2, 'verbose' , 'T0', transl2(0.5, 0), 'distthresh', 3) % An initial pose
D = double(T_initial) * M; % Some noisy observed data
[T,d] = icp(M, D, 'plot', 3);




