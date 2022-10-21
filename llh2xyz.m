% FILENAME: llh2xyz.m
% FILETYPE: function
% DESCRIPTION: llh2xyz produces a X, Y, and Z  position in the Earth Center
% Earth-fixed (ECEF) coordinate frame provided Latitude, Longitude, and 
% Altitude in degree-decimal
% 
% INPUTS:
%   - Lat: Position of Latitude on Earth
%   - Long: Longitudinal position on Earth
%   - Alt: Height above geodectic surface (WGS84)
% OUTPUTS:
%   - r_eb_e: 3x1 vector with the following indicies
%       - X: Position along ECEF X-axis
%       - Y: Position along ECEF Y-axis
%       - Z: Position along ECEF Z-axis
% AUTHOR(S): Noah Miller (nsm0014@auburn.edu)
% DATE: 10/21/2022 

function [r_eb_e] = llh2xyz(Lat,Long,Alt)

% Defining Earth's Constants
a = 6378137;                    % Semi-major axis [m]
f = 1/298.257223563;            % Ellipsoid flattening
e2 = 2*f - f^2;                 % Eccentricity of The Earth squared

% Converting Lat/Long inputs to radians
Lat = Lat/(180/pi);             % [rad]
Long = Long/(180/pi);           % [rad]

chi = sqrt(1-e2*(sin(Lat)).^2); % Distance from surface to Z-axis

X = (a./chi + Alt).*cos(Lat).*cos(Long);
Y = (a./chi + Alt).*cos(Lat).*sin(Long);
Z = (a*(1 - e2)./chi + Alt).*sin(Lat);

r_eb_e = [X;Y;Z];
end