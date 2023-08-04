% Clear the command window and workspace
%clc;
clear all;

% Input section for curve fitting
x = input('Enter the input x = ');
y = input('Enter the input y = ');
N = input('Enter the order of curve (degree of polynomial) = ');

% Curve fitting using Vandermonde matrix
temp = length(x);
A = zeros(N, N);
B = zeros(N, 1);

for i = 1:N
    for j = 1:N
        A(i, j) = sum(x.^(i + j - 2));
    end
end

for t = 1:N
    B(t, 1) = sum((x.^(t - 1)) .* y);
end

U = A \ B;

% Display the fitted equation
display('The system equation is:');
fprintf('\n');
for g = N:-1:1
    fprintf('+(%.4fa^%d)', U(g), g - 1);
end
fprintf('\n');

% Plotting section
P = flip(U);
X = linspace(x(1), x(temp), 100);
Y = polyval(P, X);
plot(X, Y);
hold on
plot(x, y, '*');

% Differentiation section
f = @(x) polyval(P, x); % Convert polynomial coefficients into a function

h = input('Enter the value of h for differentiation: ');
a = input('Enter the value of x at which you want to differentiate: ');

% Differentiation using forward, backward, and central difference methods
df = (f(a + h) - f(a)) / h;
db = (f(a) - f(a - h)) / h;
dc = (f(a + h) - f(a - h)) / (2 * h);

% Output section
fprintf('The forward difference value = %.4f\n', df);
fprintf('The backward difference value = %.4f\n', db);
fprintf('The central difference value = %.4f\n', dc);
