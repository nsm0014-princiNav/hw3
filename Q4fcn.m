function [Cdot_b_n,C_b_n] = Q4fcn(t)


C_b_n = [ cos(t), sin(t^2)*sin(t), cos(t^2)*sin(t);
    0,        cos(t^2),       -sin(t^2);
    -sin(t), sin(t^2)*cos(t), cos(t^2)*cos(t)];

Cdot_b_n = [-sin(t), sin(t^2)*cos(t) + 2*t*cos(t^2)*sin(t),   cos(t^2)*cos(t) - 2*t*sin(t^2)*sin(t);
    0,                         -2*t*sin(t^2),                           -2*t*cos(t^2);
    -cos(t), 2*t*cos(t^2)*cos(t) - sin(t^2)*sin(t), - cos(t^2)*sin(t) - 2*t*sin(t^2)*cos(t)];
end

