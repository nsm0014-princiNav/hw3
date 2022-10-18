%% Formatting
clc
clear
close all
format shortg
%% Begin Question 3
t = linspace(0,20,1000);

for i = 1:length(t)
    C = [cos(t(i)) sin(t(i))*sin(t(i)^2) sin(t(i))*cos(t(i)^2);
        0 cos(t(i)^2) -sin(t(i)^2);
        -sin(t(i)) cos(t(i))*sin(t(i)^2) cos(t(i))*cos(t(i)^2)];

    phi(i) = atan2d(-C(2,3),C(3,3));
    theta(i) = atan2d((-C(1,3)),(sqrt(C(2,3)^2 + C(3,3)^2)));
    psi(i) = atan2d(-C(1,2),C(1,1));
    th(i) = asind(C(3,1));
end

% Plotting
Q3plot = figure('Position',[500 250 1000 800]);
hold on
Q3tile = tiledlayout(3,1);

nexttile
plot(t,phi,LineWidth=1.5)
ylim([-180,180])
yticks(-180:45:180)
yticklabels({'-180','-135','-90','-45','0','45','90','135','180',})

nexttile
plot(t,theta,LineWidth=1.5)
ylim([-90,90])
yticks(-180:45:180)
yticklabels({'-90','-45','0','45','90','135','180',})

nexttile
plot(t,psi,LineWidth=1.5)
ylim([-180,180])
yticks(-180:45:180)
yticklabels({'-180','-135','-90','-45','0','45','90','135','180',})
