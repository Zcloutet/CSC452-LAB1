function [D,t] = lab1q5(np,nd)
if (nargin <1), np = 1e3; nd = 2; end
hp = gcp('nocreate');
if isempty(hp), hp = parpool(8); end
aA = randn(np,nd);aB = randn(np,nd);
dA= distributed(aA); dB = distributed(aB);dc = distributed.zeros(np,1);
D = zeros(np,1);
tic;
%parfor i=1:np
 %   task(i);
%end
%dc=sqrt(sum(dA-dB).^2,2));

for i = 1:np
    c=0;
    for j=1:nd
        c=c+(dA(i,j)-dB(i,j)).^2;
    end
    dc(i)=sqrt(c);
end
d=gather(dc);
%aD = (aA-aB).^2;
%aE = sum(aD);
%aF = sqrt(aE);

%d = gather(aF);
t=toc;
delete(hp);


   