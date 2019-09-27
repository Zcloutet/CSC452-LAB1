np = 1e3; nd = 10; nl= 4;
tic;
spmd
    nppl=floor(np/nl); % #pts per lab
    nplo=np-nl*nppl; %#pts left over
    if (labindex == 1)
        nptl = nppl+nplo; % #pts for this lab
    else
        nptl=nppl;
    end
        
    A = randn(np/nl,nd); B = randn(np/nl,nd);
    D = zeros(np/nl,1);
    for i = 1:np/8
        for j=1:nd
            D(i)= D(i)+(B(i,j)-A(i,j)).^2;
        end
        D(i)=sqrt(D(i));
    end
    da = gcat(D,1,1);
end
t=toc;
d1=da{1};
%disp(d1);
disp(t);



   