% Copyright (c) 2024 Leander Stephen D'Souza

% Program to implement the step dynamics of the system

function [NextObs, Reward, IsDone, LoggedSignals] = stepDynamics(Action, LoggedSignals)
    % Set terminal condition flag to false
    IsDone = false;

    % Unpack LoggedSignals
    xt = LoggedSignals(1);
    xdot_t = LoggedSignals(2);

    % Define Control Input as Action
    ut = Action;

    % Run mountain car dynamics to calculate acceleration
    xddot_t = 0.001 * ut - 0.0025 * cos(3 * xt);

    % Update dynamics using first order numerical integration with time-step T = 1
    xt_plus_1 = xt + xdot_t;
    xdot_t_plus_1 = xdot_t + xddot_t;

    % Saturate position and velocity of cart to prevent going out of bounds
    if xt_plus_1 < -1.2
        xt_plus_1 = -1.2;
    end
    if xdot_t_plus_1 < -0.07
        xdot_t_plus_1 = -0.07;
    end
    if xdot_t_plus_1 > 0.07
        xdot_t_plus_1 = 0.07;
    end

    % Set terminal condition if cart reaches desired end point
    if xt_plus_1 > 0.5
        IsDone = true;
    end

    % Define next observation as the new state vector
    NextObs = [xt_plus_1; xdot_t_plus_1];

    % Log signals
    LoggedSignals = [xt_plus_1; xdot_t_plus_1];

    % Define reward
    if IsDone
        Reward = -1;
    else
        Reward = -1;
    end
end
