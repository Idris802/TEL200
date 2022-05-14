% This function trajectory creates a path for the walking robot created in walking.m

% The trajectory function returns a compounded marix and hence that its
% name that is given should be changed to something related to matrix.

% The function has two input arguments one is a list of the forward travel
% destinations that the robot is suposed to travel to and the other are agnles
% in radians which the robots legs and body shopuld rotate accordingly to.
% iterations is also named wrong here as it is the intervals not
% iterations.


function path = trajectory(x, phi, iterations)
    
    path = zeros(0);
    y = zeros(length(x), 1);
    phi = [0, phi];

    for i=1:length(x)

        % trejactories
        fxt = linspace(0, x(i), iterations); % forward trajectory for x-dir
        fyt = linspace(0, y(i), iterations); % forward trajectory for y-dir
        rt = linspace(0, phi(i+1), iterations); % rotation trajectory according to input matrix 

        % Calculating x and y coordniates from rotation angles
        dx_dt = fxt*cos(-phi(i))-fyt*sin(-phi(i));
        dy_dt = fyt*cos(-phi(i))-fxt*sin(-phi(i));

        % Takes the existing path and doubles it for each iteration
        path = [path; zeros(iterations*2, 3)];
        ps = size(path);
        emx = ps(1);

        % upadate x, y and phi columns of matrix
        path((emx-(iterations*2)+1):(emx-(iterations)), 1) = path((emx-(iterations*2)+1):(emx-(iterations)), 1) + dx_dt.';
        path((emx-(iterations*2)+1):(emx-(iterations)), 2) = path((emx-(iterations*2)+1):(emx-(iterations)), 2) + dy_dt.';
        path((emx-(iterations-1)):(emx), 3) = path((emx-(iterations-1)):(emx), 3) + rt.';
       
    end
   
    dx_dt_vals = [];
    dy_dt_vals = [];

     for i=1:length(x)

        dx_dt = x(i)*cos(-phi(i))-y(i)*sin(-phi(i));
        dy_dt = y(i)*cos(-phi(i))-x(i)*sin(-phi(i));
        dx_dt_vals = [dx_dt_vals, dx_dt];
        dy_dt_vals = [dy_dt_vals, dy_dt];

     end
    
     k = iterations+1;
     n = iterations;
     j = (iterations*2)+1;
     b = iterations*2;
     sp = size(path);

     for i=1:length(dx_dt_vals)

         fill_x = ones(sp(1)-n, 1)*dx_dt_vals(i);
         fill_y = ones(sp(1)-n, 1)*dy_dt_vals(i);
         fill_phi = ones(sp(1)-b, 1)*phi(i+1);

         path(k:end, 1) = path(k:end, 1) + fill_x;
         path(k:end, 2) = path(k:end, 2) + fill_y;
         path(j:end, 3) = path(j:end, 3) + fill_phi;

         k = k+b;
         n = n+b;
         j = j+b;
         b = b+b;

     end

end
