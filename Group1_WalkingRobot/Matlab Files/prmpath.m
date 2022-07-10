function path = prmpath(plan, interval)
%PRMPATH this function is spesifically made for accepting the waypoints
% created by PRBROADMAP from random start to goal positions and generates a 
% a matrix containing x, y positions and angle phi which the robot
% should follow. Input arguments are way-points generated PRBROADMAP and 
% interval.

    via_x = plan(:,1).';
    via_y = plan(:,2).';
    start_x = via_x(1);
    start_y = via_y(1);
    

    % These are the distances for the robot to travel
    px = diff(via_x);
    py = diff(via_y);

    % finds the orientation of each vector 
    phi = atan2(py, px);
    phi_d = [phi(1), diff(phi)];
    
    % Pre allocation of path
    path = zeros(interval*(length(via_x)-1)*2, 3);
    path(:, 1) = start_x; 
    path(:, 2) = start_y; 

    k = 1;
    j = interval+1;

    c = interval+1;
    b = interval*2;

    for i=1:length(px)

        pxp = linspace(0, px(i), interval);
        pyp = linspace(0, py(i), interval);
        phi_p = linspace(0, phi_d(i), interval);

        % Making the robot turn and walk distances to next via point
        path(k:j-1, 3) = path(k:j-1, 3) + phi_p.';
        path(c:b, 1) = path(c:b, 1) + pxp.';
        path(c:b, 2) = path(c:b, 2) + pyp.';


        % Filling the rest of the matrix with last values
        path(j:end, 3) = path(j:end, 3) + phi_p(end);
        path(b+1:end, 1) = path(b+1:end, 1) + pxp(end);
        path(b+1:end, 2) = path(b+1:end, 2) + pyp(end);

        k = k+interval*2;
        j = j+interval*2;
        b = b+interval*2;
        c = c+interval*2;

    end


end