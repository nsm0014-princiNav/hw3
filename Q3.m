%% Formatting
clc
clear
close all
format shortg
%% Begin Question 3
t = linspace(0,10,1000);

for i = 1:length(t)
    C = [cos(t(i)) sin(t(i))*sin(t(i)^2) sin(t(i))*cos(t(i)^2);
        0 cos(t(i)^2) -sin(t(i)^2);
        -sin(t(i)) cos(t(i))*sin(t(i)^2) cos(t(i))*cos(t(i)^2)];

    phi(i) = atan2d(-C(2,3),C(3,3));
    theta(i) = asind(-C(1,3));
    psi(i) = atan2d(-C(1,2),C(1,1));
end

% Plotting
Q3plot = figure('Position',[500 250 1000 800]);
hold on
Q3tile = tiledlayout(3,1);

nexttile
plot(t,phi,LineWidth=1.5)
ylim([-185,185])
yticks(-180:90:180)
yticklabels({'-180','-90','0','90','180',})
ylabel('Roll [deg]',FontSize=14)

nexttile
plot(t,theta,LineWidth=1.5)
ylim([-95,95])
yticks(-90:45:90)
yticklabels({'-90','-45','0','45','90'})
ylabel('Pitch [deg]',FontSize=14)

nexttile
plot(t,psi,LineWidth=1.5)
ylim([-185,185])
yticks(-180:90:180)
yticklabels({'-180','-90','0','90','180',})
ylabel('Yaw [deg]',FontSize=14)
xlabel('Time [s]',FontSize=14)

saveas(Q3plot,'Euler_Angles.png')
