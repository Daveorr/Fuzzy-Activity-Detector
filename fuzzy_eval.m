%% Take a set of data and compute activity level and activity classification
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
f = readfis('activity detector_v2.fis')
load('data.mat')
for i=1 : length(data)
a = data(i,1);
b = data(i,2);
c = data(i,3);
d = data(i,4);

%%% KEEP VALUES INSIDE THE GIVEN INTERVAL OF INTEREST %%%
if a > 1.8
    a = 1.8;
end
if b > 3.5
    b = 3.5;
end
if c > 8
    c = 8;
end 
if d > 2
    d = 2;
end    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


g = evalfis([a b c d], f);


%%% DISPLAY ACTIVITY CLASSIFICATION  %%%
if g == 0
fprintf('%d - Activity level is: %f - INACTIVE \n', i-1, g);
elseif g == 0.4
fprintf('%d - Activity level is: %f - LOCAL MOVEMENTS \n', i-1, g);
elseif g == 0.8
fprintf('%d - Activity level is: %f - WALKING - LATERAL STRAFE \n', i-1, g);
elseif g == 1
fprintf('%d - Activity level is: %f - RUNNING \n', i-1, g);
else
fprintf('%d - Activity level is: %f \n', i-1, g);
end
end
