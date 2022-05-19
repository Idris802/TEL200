function path = createpath(x, phi, iterations)
% CREATEPATH creates a path for the walking robot

% The functions input arguments are: x a list containing the steps for the 
% robot to take (NB: the robot only walks forward). phi is a list containing
% angles in radians which the robots legs and body should rotate accordingly 
% to.

% The trajectory function returns a compunded matrix containing the x, y 
% phi values in intervals based on the value of iterations.
    
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

         fill_x = zeros(sp(1)-n, 1)+dx_dt_vals(i);
         fill_y = zeros(sp(1)-n, 1)+dy_dt_vals(i);
         fill_phi = zeros(sp(1)-b, 1)+phi(i+1);

         path(k:end, 1) = path(k:end, 1) + fill_x;
         path(k:end, 2) = path(k:end, 2) + fill_y;
         path(j:end, 3) = path(j:end, 3) + fill_phi;

         k = k+b;
         n = n+b;
         j = j+b;
         b = b+b;

     end

end
