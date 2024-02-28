% matlab scripting

% constant parameters
epsilon = 0.001;
rho1 = 0.9;
rho2 = 0.999;


% initial variable values
g = 10;
v = 10;
r = 10;
theta = 0;

% Adam update
v = rho1 * v + (1 - rho1) * g;
r = rho2 * r + (1 - rho2) * g^2;
theta = theta - epsilon / sqrt(r) * v;

% display the updated values
fprintf('g = %f, v = %f, r = %f, theta = %f\n', g, v, r, theta);
