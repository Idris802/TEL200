function plan = prm_planner(n, points_n)
%PRM_PLANNER generates a map and way-points from ranmdom start to goal points 
% for our walking robot. 

    load house
    prm = PRM(house);

    k = 1;
    f = 0;
    increasedpoints = 0;

    while k <= n

        start = [randi(600) randi(400)];
        goal = [randi(600) randi(400)];
       
        if prm.isoccupied(start) == 0 && prm.isoccupied(goal) == 0

            try 

               prm.plan('npoints', points_n);
               plan = prm.query(start, goal);
               ps = size(plan);
               
               if ps(1) > 2
                   k = k+1;
                   prm.plot;
                   drawnow

               end


            catch MyErr 
               % Tries to generate a path one more time with 500
               increasedpoints = increasedpoints + 1;

            end


        elseif prm.isoccupied(start) == 1 || prm.isoccupied(goal) == 1
           f = f+1; 
        end
        
    end
   
    sprintf("Number of times random start or goal generated was occupied: %d", f)
    sprintf("Number times npoints needed to be incraesed due to error of empty vetices: %d", increasedpoints)

end