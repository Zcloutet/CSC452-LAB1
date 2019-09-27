function [D,t] = lab1q1(np,nd)
if (nargin <1), np = 1e3; nd = 10;  end

A = randn(np,nd);
B = randn(np,nd);
D = zeros(np,1);
tic;
for i = 1:np
    
    for j=1:nd
        D(i)= D(i)+(B(i,j)-A(i,j)).^2;
    end
    D(i)=sqrt(D(i));
    
end
t=toc;
disp("this is time:"+t);
%delete(hp);
