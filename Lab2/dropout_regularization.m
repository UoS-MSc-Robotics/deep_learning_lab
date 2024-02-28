% set random number generator and seed for repeatable results
rng(0,'twister');

% initial variables
x = [1 1 1]';
w = [1 2 3]';
p = 0.5;

% Bernoulli random draw
n = length(x);
r = rand(n,1) <= p;

% Dropout regularization
x_tilde = r .* x;
z = w' * x_tilde;

% Print the value of z
fprintf('The value of z after one update is %d\n', round(z));
