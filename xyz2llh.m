function [phi, lambda, h] = xyz2llh(X,Y,Z)

% Estimate radius of curvature;
a = 6378137;            % Meter; % Semi-major axis;
f = 1/298.257223563;    % Ellipsoid flattening;
b = a*(1-f);            % Define Semi-minor axis;
% Estimate auxiliary values;
P       = sqrt(X^2 + Y^2);
Theta   = atan(Z*a/P*b);
e       = sqrt(((a^2) - (b^2))/a^2); % First eccentricity of The Earth;
e2      = sqrt((a^2 - b^2)/b^2);     % Second eccentricity of The Earth;
% Initial value of Latitude;
phi = atan2(Z,(P*(1-e^2)));
% Iteration loop for estimate Latitude(ppi);

for i = 1:10000
    N = a / sqrt(1-e^2*sin(phi).^2);        % Prime vertical;
    h = (P/cos(phi)) - N;                   % Height;
    phi = atan2(Z,(P*(1-e^2*(N/(N+h)))));   % Latitude
end
lambda = (atan2(Y,X))*180/pi;
phi   = phi*180/pi;
