function [D,t] = lab1q2(np,nd,nw)
if (nargin <1), np = 1e7; nd = 10; nw=8; end
hp = gcp('nocreate');
if isempty(hp), hp = parpool(nw); end
A = randn(np,nd);
B = randn(np,nd);
D = zeros(np,1);
tic;
parfor i = 1:np
    
    for j=1:nd
        D(i)= D(i)+(B(i,j)-A(i,j)).^2;
    end
    D(i)=sqrt(D(i));
    
end
t=toc;
disp("this is t:"+t);
delete(hp);


   