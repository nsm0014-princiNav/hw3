% FILENAME: xyz2llh.m
% FILETYPE: function
% DESCRIPTION: xyz2llh produces a Latitude, Longitude, and Altitude
% position based on the provided X, Y, and Z Earth Center Earth-fixed
% (ECEF) coordinate frame.
% 
% INPUTS:
%   - X: Position along ECEF X-axis
%   - Y: Position along ECEF Y-axis
%   - Z: Position along ECEF Z-axis
% OUTPUTS:
%   - Lat: Position of Latitude on Earth
%   - Long: Longitudinal position on Earth
%   - Alt: Height above geodectic surface (WGS84)
% AUTHOR(S): Noah Miller (nsm0014@auburn.edu)
% DATE: 10/21/2022 

function [Lat, Long, Alt] = xyz2llh(X,Y,Z)

% Defining Earth's Constants
a = 6378137;                    % Semi-major axis [m]
f = 1/298.257223563;            % Ellipsoid flattening
b = a*(1-f);                    % Semi-minor axis [m]
e = sqrt(((a^2) - (b^2))/a^2);  % Eccentricity of The Earth

% Initializing Convergence loop for Latitude
Lat = atan2(Z,(sqrt(X^2 + Y^2)*(1-e^2)));

for i = 1:10000
    N = a / sqrt(1-e^2*sin(Lat).^2);                        % Local Vertical
    Alt = (sqrt(X^2 + Y^2)/cos(Lat)) - N;                   % Height [m]
    Lat = atan2(Z,(sqrt(X^2 + Y^2)*(1-e^2*(N/(N+Alt)))));   % Latitude
end

% Converting to degree-decimal
Long = (atan2(Y,X))*(180/pi);
Lat  = Lat*(180/pi);
