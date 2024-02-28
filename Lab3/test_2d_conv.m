% Define the input feature maps and weights
x1 = [1 1 1 1; 2 2 2 2; 3 3 3 3; 4 4 4 4]; % feature map c=1
x2 = [5 5 5 5; 6 6 6 6; 7 7 7 7; 8 8 8 8]; % feature map c=2
w1 = [1 1 1; 0 0 0 ; 1 1 1];                % filter weights for channel c=1
w2 = [0 0 0; 1 1 1; 0 0 0];                 % filter weights for channel c=2
b = 1;                                      % bias term

% Define the starting position (i, j)
i = 1;
j = 1;

% Extract the relevant sections of the feature maps
x1_section = x1(i:i+2, j:j+2);
x2_section = x2(i:i+2, j:j+2);

% Perform the convolution operation
z = sum(sum(x1_section .* w1)) + sum(sum(x2_section .* w2)) + b;

% Print z
disp(z);