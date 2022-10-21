%% Formatting
clc
clear
close all
format shortg

%% Begin Question 4
syms t
C = [cos(t) sin(t)*sin(t^2) sin(t)*cos(t^2);
    0 cos(t^2) -sin(t^2);
    -sin(t) cos(t)*sin(t^2) cos(t)*cos(t^2)]

Cdot = diff(C)

time = 0:0.1:1.0;

for i = 1:length(time)

    % Analytic

    [Cdot_b_n(:,:,i),C_b_n(:,:,i)] = Q4fcn(time(i));

    skew_omega_nb_n(:,:,i) = Cdot_b_n(:,:,i)*C_b_n(:,:,i)^-1;

    omega_nb_n(:,i) = [skew_omega_nb_n(3,2,i);skew_omega_nb_n(1,3,i);skew_omega_nb_n(2,1,i)];

    theta_dot(i) = norm(omega_nb_n(:,i))

    theta(i) = acosd((trace(C_b_n(:,:,i))-1)/2)

    k(:,i) = [C_b_n(3,2,i) - C_b_n(2,3,i);
        C_b_n(1,3,i) - C_b_n(3,1,i);
        C_b_n(2,1,i) - C_b_n(1,2,i)]./(2*sind(theta(i)))

end

% Numerical

for j = 2:length(time)
    Cdot_b_n_num(:,:,j-1) = (C_b_n(:,:,j) - C_b_n(:,:,j-1))/2;

    skew_omega_nb_n_num(:,:,j-1) = Cdot_b_n_num(:,:,j-1)*C_b_n(:,:,j-1)^-1;

    omega_nb_n_num(:,j-1) = [skew_omega_nb_n_num(3,2,j-1);skew_omega_nb_n_num(1,3,j-1);skew_omega_nb_n_num(2,1,j-1)];

    theta_dot_num(j-1) = norm(omega_nb_n_num(:,j-1))

    theta_num(j-1) = acosd((trace(C_b_n(:,:,j-1))-1)/2)

    k_num(:,j-1) = [C_b_n(3,2,j-1) - C_b_n(2,3,j-1);
        C_b_n(1,3,j-1) - C_b_n(3,1,j-1);
        C_b_n(2,1,j-1) - C_b_n(1,2,j-1)]./(2*sind(theta(j-1)))

end

k_error = [k(:,1) - k_num(:,1),k(:,6) - k_num(:,6),k(:,10) - k_num(:,10)];
theta_dot_error = [theta_dot(1) - theta_dot_num(1);theta_dot(6) - theta_dot_num(6);theta_dot(10) - theta_dot_num(10)];
