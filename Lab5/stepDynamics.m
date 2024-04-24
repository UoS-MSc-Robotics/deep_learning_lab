% Copyright (c) 2024 Leander Stephen D'Souza

% Program to implement the step dynamics of the system

function [NextObs, Reward, IsDone, LoggedSignals] = stepDynamics(Action, LoggedSignals)
    % Set terminal condition flag to false
    IsDone = false;

    % Unpack LoggedSignals
    x = LoggedSignals(1);
    xdot = LoggedSignals(2);

    % Define Control Input as Action
    u = Action;

    % Run mountain car dynamics to calculate acceleration
    xdotdot = 0.001 * u - 0.0025 * cos(3*x);

    % Update dynamics using first order numerical integration with time-step T = 1
    T = 1;
    x = x + T * xdot;
    xdot = xdot + T * xdotdot;

    % Saturate position and velocity of cart to prevent going out of bounds
    if x < -1.2
        x = -1.2;
    end
    if xdot < -0.07
        xdot = -0.07;
    end
    if xdot > 0.07
        xdot = 0.07;
    end

    % Set terminal condition if cart reaches desired end point
    if x > 0.5
        IsDone = true;
    end

    % Define next observation as the new state vector
    NextObs = [x; xdot];

    % Log signals
    LoggedSignals = [x; xdot];

    % Define reward
    if IsDone
        Reward = -1;
    else
        Reward = -1;
    end
end
