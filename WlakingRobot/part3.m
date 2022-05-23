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

%% Using PRM to cover entire free space
np = 2000;
prm = PRM(MyKillianMap);
prm.plan('npoints', np)
prm.plot




