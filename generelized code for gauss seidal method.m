%clc
clear all
a = input('Enter co-efficient matrix: ');
b = input('Enter constant vector: ');
c = input('Enter initial guess vector: ');
n = input('Enter maximum number of iteration: ');
e = input('Tolerance: ');
N = length(b);
x = zeros(N,1);
y = zeros(N,1);
for j=1:n 
for i=1:N 
 x(i) = (b(i)/a(i,i)) - (a(i,[1:i-1,i+1:N])*c([1:i-1,i+1:N]))/a(i,i);
 c(i) = x(i);
end
 x';
 if abs(y-x)<e
 break
 end
y = x;
end
fprintf('\n Total Iteration= %d \n Roots are p=%d \n q=%d \n r=%d \n',j,x(1),x(2),x(3));
