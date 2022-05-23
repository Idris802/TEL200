function MyKillianMap = MakeKillianMap(scannedmap, M)
%MAKEKILLIANMAP Creates KillianMap from input scannedmap

    MyKillianMap = scannedmap;

    % Converts cells which are larger than M radar scan to 1
    MyKillianMap(MyKillianMap>=M) = 1;

    % Converts all values other than 1 to 0 
    MyKillianMap(MyKillianMap~=1) = 0;

end

