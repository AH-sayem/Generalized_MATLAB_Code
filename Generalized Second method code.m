%clc
clear all ;
f= input('Enter the function ');
x0= input('Initial guess:');
x1= input('Second initial guess:');
e= input('Tolerance=');
n = input('Iteration number=');
fx0 = f(x0);
fx1= f(x1);
    for i= 1:n 
    x2= x1- fx1 *(x1 - x0) /(fx1-fx0); % This is the main  function 
    
    x0= x1 ;  % swap the value of x and f(x) 
    fx0 = fx1 ; 
    x1= x2 ;
     fx1= f(x1);
    
     if abs(fx1)<= e 
    break
    end
    root= x1 ;
    end
fprintf('The root is %.4f \n Iteration Number= %d ', root, i)