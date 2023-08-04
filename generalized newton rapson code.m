% Input section
syms x;  % Symbolic variable
f_expr = input('Enter the function (in terms of x): ', 's');
f = matlabFunction(str2sym(f_expr));

% Calculate the derivative of the function using symbolic differentiation
df = diff(str2sym(f_expr));

x0 = input('Enter the initial guess: '); 
e = input('Enter the tolerance level: '); 
n = input('Enter the maximum iteration number: '); 

% Algorithm (Newton-Raphson method)
if subs(df, x, x0) ~= 0
    for i = 1:n
        % Next step
        df_val = subs(df, x, x0);
        x1 = x0 - (f(x0) / df_val);
        fprintf('Iteration number %d : %0.4f\n', i, x1);
        
        if abs(x0 - x1) <= e
            break;
        end

        x0 = x1;
    end
else
    display('Can not solve with Newton-Raphson method');
end

fprintf('The root is %.4f\n', x1);
