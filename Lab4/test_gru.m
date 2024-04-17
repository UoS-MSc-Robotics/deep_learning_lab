% GRU model

% initialise the random seed - important every time!
rng(1,"twister");

% number of timesteps
N = 100;

% GRU parameters
nx = 10;
nu = 1;
Ax = randn(nx);
Bx = randn(nx,nu);
Az = randn(nx);
Bz = randn(nx,nu);
Ar = randn(nx);
Br = randn(nx,nu);

% initial state
x(:,1) = zeros(nx,1);

% input signal
u = [0.5*ones(1,N/2) -0.5*ones(1,N/2)];

% simulation loop
for t = 2:N
    % GRU
    z = logsig(Az*x(:,t-1) + Bz*u(t));
    r = logsig(Ar*x(:,t-1) + Br*u(t));
    x(:,t) = z.*x(:,t-1) + (1-z).*tanh(Ax*(r.*x(:,t-1)) + Bx*u(t));
    % print t and x for debugging
    disp([t x(:,t)']);
end



% plot the output
figure;
plot(x(1,:));
xlabel('Time step');
ylabel('Output');
title('GRU output');
grid on;


