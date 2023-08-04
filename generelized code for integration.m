%clc;
clear all;

% Input section for curve fitting
x = input('Enter the x coordinates: ');   
y = input('Enter the y coordinates: ');  
N = input('Enter the number of fitting (degree of polynomial): ');

% Curve fitting using Vandermonde matrix
n = length(x);
A = zeros(N, N);
for i = 1:N
    for j = 1:N
        A(i, j) = sum(x.^(i + j - 2));
    end
end

B = zeros(N, 1);
for k = 1:N
    B(k) = sum((x.^(k - 1)) .* y);
end

coefficients = A \ B;

% Display the fitted equation
fitted_equation = '';
for g = N:-1:1
    fitted_equation = strcat(fitted_equation, sprintf('+(%.4fx^%d)', coefficients(g), g - 1));
end
fprintf('Fitted equation: y = %s\n', fitted_equation(2:end));

% Plotting section
P = flip(coefficients);
X = linspace(x(1), x(n), 100);
Y = polyval(P, X);
plot(X, Y)
hold on
plot(x, y, '*')

% Integration section
f = @(x) polyval(P, x);

a = input('Enter the lower limit: ');
b = input('Enter the upper limit: ');
N = input('Enter the number of trapezoids for integration: ');

% Trapezoidal rule
h = (b - a) / N;
sum_trapz = 0;
for i = 1:N - 1
    sum_trapz = sum_trapz + f(a + i * h);
end
int_trapz = (h / 2) * (f(a) + 2 * sum_trapz + f(b));
fprintf('Result Using Trapezoidal Rule is: %.8f\n', int_trapz);

% Simpson's 1/3 rule
odd_sum_simp13 = 0;
even_sum_simp13 = 0;
for j = 1:2:N - 1
    odd_sum_simp13 = odd_sum_simp13 + f(a + j * h);
end
for k = 2:2:N - 2
    even_sum_simp13 = even_sum_simp13 + f(a + k * h);
end
int_simp13 = (h / 3) * (f(a) + 4 * odd_sum_simp13 + 2 * even_sum_simp13 + f(b));
fprintf('Result Using Simpson 1/3 Rule is: %.8f\n', int_simp13);

% Simpson's 3/8 rule
sum_p1_simp38 = 0;
sum_p2_simp38 = 0;
for m = 1:3:N - 2
    sum_p1_simp38 = sum_p1_simp38 + f(a + m * h);
end
for m = 3:3:N - 1
    sum_p2_simp38 = sum_p2_simp38 + f(a + m * h);
end
int_simp38 = (3 * h / 8) * (f(a) + 3 * sum_p1_simp38 + 2 * sum_p2_simp38 + f(b));
fprintf('Result Using Simpson 3/8 Rule is: %.8f\n', int_simp38);
