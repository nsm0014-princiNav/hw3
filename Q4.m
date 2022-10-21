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

time = [0 0.5 1];

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

    % Numerical

    if i > 1
        Cdot_b_n_num(:,:,i-1) = (C_b_n(:,:,i) - C_b_n(:,:,i-1))/2;

        skew_omega_nb_n_num(:,:,i-1) = Cdot_b_n_num(:,:,i-1)*C_b_n(:,:,i-1)^-1;

        omega_nb_n_num(:,i-1) = [skew_omega_nb_n_num(3,2,i-1);skew_omega_nb_n_num(1,3,i-1);skew_omega_nb_n_num(2,1,i-1)];

        theta_dot_num(i-1) = norm(omega_nb_n(:,i-1))

        theta_num(i-1) = acosd((trace(C_b_n(:,:,i-1))-1)/2)

        k_num(:,i-1) = [C_b_n(3,2,i-1) - C_b_n(2,3,i-1);
            C_b_n(1,3,i-1) - C_b_n(3,1,i-1);
            C_b_n(2,1,i-1) - C_b_n(1,2,i-1)]./(2*sind(theta(i-1)))

    end


end

