function plan = prbroadmap(n, points_n)
    
    load house
    prm = PRM(house);

    k = 1;
    f = 0;
    increasedpoints = 0;

    while k <= n

        start = [randi(600) randi(400)]
        goal = [randi(600) randi(400)]
       
        if prm.isoccupied(start) == 0 && prm.isoccupied(goal) == 0

            try 

               prm.plan('npoints', points_n);
               plan = prm.query(start, goal);
               ps = size(plan);
               
               if ps(1) > 2
                   k = k+1;
                   prm.plot;
              
               end


            catch MyErr 
                increasedpoints = increasedpoints + 1;
            end


        elseif prm.isoccupied(start) == 1 || prm.isoccupied(goal) == 1
           f = f+1; 
        end
        
    end
   
    sprintf("Number of times random start or goal generated was occupied: %d", f)
    sprintf("Number times npoints was incresed due to error of empty vetices: %d", increasedpoints)

end
    

    


         
        
        

%{
målet er å laget en funksjon som tar i seg et tall og også skal den lage 10
randomiserte punkter og en vei fra til mål. hint bruk isoccupied for å
finne om roboten vil eventuelt crashe inne i en vegg

jeg har lyst til å sjekke om start eller slutt punktet
%}