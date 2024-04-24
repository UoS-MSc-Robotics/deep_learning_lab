% Copyright (c) 2024 Leander Stephen D'Souza

% Program to implement the initial dynamics of the system

function [InitialObservation, LoggedSignals] = initialDynamics()
    % Initialise mountain car position from a uniform distribution
    x0 = -0.6 + (-0.4 + 0.6) * rand;

    % Initialise mountain car velocity to zero
    xdot_0 = 0;

    % Define observation as the state vector
    InitialObservation = [x0, xdot_0]';

    % Log signals
    LoggedSignals = [x0, xdot_0]';
end
