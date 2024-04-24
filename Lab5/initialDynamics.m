% Copyright (c) 2024 Leander Stephen D'Souza

% Program to implement the initial dynamics of the system

function [InitialObservation, LoggedSignals] = initialDynamics()
    % Initialise mountain car position from a uniform distribution
    x_min = -0.6;
    x_max = -0.4;
    x0 = x_min + (x_max - x_min) * rand;

    % Initialise mountain car velocity to zero
    xdot_0 = 0;

    % Define observation as the state vector
    InitialObservation = [x0; xdot_0];

    % Log signals
    LoggedSignals = [x0; xdot_0];
end
