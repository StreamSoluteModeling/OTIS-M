%***********************************************************************
%
%     Subroutine OUTPUT             Called by: MAIN program
%
%     Output flagged results
%
%***********************************************************************
%
%   Output Metric Calculations    
if IMETRIC == 1
    METRICS
end
%   Create Movie
if IMOVIE == 1 && ITIMEC == 1
    MOVIES
end
%   Create Graphs    
if IGRAPH == 1
    GRAPHS
end