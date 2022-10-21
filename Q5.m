%% Formatting
clc
clear
close all
format shortg

%% Begin Question 5

[r_eb_e] = llh2xyz(27.98777777777778,86.94444444444444, 8850);

[phi, lambda, h] = xyz2llh(r_eb_e(1),r_eb_e(2),r_eb_e(3))