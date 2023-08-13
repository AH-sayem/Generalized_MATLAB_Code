%clc 
clear all 
close all 

fn = input('Enter the function (in terms of x): ');
a = input('Enter the value of a (positive): ');
b = input('Enter the value of b (negative): ');
e = input('Enter the tolerance level: ');
n = input('Enter the maximum iteration number: ');

if fn(a)*fn(b) < 0
    for i=1:n
    c=(b*fn(a)-a*fn(b))/(fn(a)-fn(b));
    if abs(fn(a)-fn(c))<=e || abs(fn(b)-fn(c))<= e 
        break 
    end 
    if fn(a)*fn(c) < 0 
        b=c ;
    else 
        a=c ;
    end 
    end 
    fprintf('The root is %f',c);
else
    fprintf('Enter initial value again')
 end
    
    
    