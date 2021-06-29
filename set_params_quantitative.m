epsilon = 0.000000001;  %Robustness constant
snap_distance = 0.05;   %Snap distance (distance within which an observer location will be snapped to the
                        %boundary before the visibility polygon is computed)

Number_of_Experiments = 15;
USE_BaselineMinimax = false; %Use DM1, set the paprameter as "false". To compare with baseline minimax, use "true".

Resolution = 1;         % 1 is a coarse grid used for computing visibility

Negtive_Reward = 0.3;   % penalty for agent being detected
Negtive_Asset = 30;     % penalty for asset being detected

Lookahead = 5;          % planning horizon        

T_execution = 40;       % episode duration
Discount_factor = 0.95;

USE_HEURISTIC = false;         
heur_penalty_std = 1;        % std of penalty to use for the heuristic
heur_agent_asset_weight = 1;            % how much weight to give the asset penalty in the heuristic
heur_agent_detection_weight = 1;     % how much weight to give the opponent detecting the agent penalty in the heuristic

Number_of_Assets = 10;    
% Asset_set = [2 5;8 5;5 1;];%Environment A
% Asset_set = [2 2;2 10;10 10; 10 2; 3 4; 3 8;9 4;9 8;];%Environment B
Asset_set = [5 7;10 4;14 4; 10 10; 14 10; 16 4;17 4;16 10; 17 10;16 12;];%Environment C
% Asset_set = [4,19;9,19;12,19;17,19;20,19;25,19;28,19;33,19;36,19;49,19;...
%     4,14;9,14;12,14;17,14;20,14;25,14;28,14;33,14;36,14;49,14;...
%     4,5;9,5;12,5;17,5;20,5;25,5;28,5;33,5;36,5;49,5;...
%     4,2;9,2;12,2;17,2;20,2;25,2;28,2;33,2;36,2;49,2]; %Environment D

environment = read_vertices_from_file('./Environments/Env_C.environment');  %The environment and its boundary
environment_min_x = min(environment{1}(:,1));
environment_max_x = max(environment{1}(:,1));
environment_min_y = min(environment{1}(:,2));
environment_max_y = max(environment{1}(:,2));
X_MIN = floor(environment_min_x-0.1*(environment_max_x-environment_min_x));
X_MAX = floor(environment_max_x+0.1*(environment_max_x-environment_min_x));
Y_MIN = floor(environment_min_y-0.1*(environment_max_y-environment_min_y));
Y_MAX = floor(environment_max_y+0.1*(environment_max_y-environment_min_y));
