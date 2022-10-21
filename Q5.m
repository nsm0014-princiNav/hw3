%% Formatting
clc
clear
close all
format shortg

%% Begin Question 5

[r_eb_e] = llh2xyz(27.98777777777778,86.94444444444444, 0)

[phi, lambda, h] = xyz2llh(r_eb_e(1),r_eb_e(2),r_eb_e(3))

9.7803253359*((1 + 0.001931853*sind(0)^2)/(sqrt(1 - 0.00669437999014132*sind(0)^2)))

omega_ie_e = [0;0;7.292115e-5];
Omega_ie_e = formskewsym(omega_ie_e)

a_ib_e = -Omega_ie_e*Omega_ie_e*r_eb_e
norm(a_ib_e)

mu = 3.986004418e14;
mag_r_eb_e = norm(r_eb_e);
J2 = 1.082627e-3;
R0 = 6378137;

gamma_ib_i_first_term = -mu/mag_r_eb_e^3
gamma_ib_i_second_term = r_eb_e
gamma_ib_i_third_term = 1.5*J2*(R0^2/mag_r_eb_e^2)
gamma_ib_i_fourth_term = [(1 - 5*(r_eb_e(3)/mag_r_eb_e)^2)*r_eb_e(1);(1 - 5*(r_eb_e(3)/mag_r_eb_e)^2)*r_eb_e(2);(3 - 5*(r_eb_e(3)/mag_r_eb_e)^2)*r_eb_e(3)]
gamma_ib_i = gamma_ib_i_first_term*(gamma_ib_i_second_term + gamma_ib_i_third_term*gamma_ib_i_fourth_term)