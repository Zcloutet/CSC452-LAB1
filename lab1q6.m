np = 1e3; nd = 2; nl= 8;
%D = zeros(np,1);
tic;
spmd
    if (labindex==1)
        A = randn(np/nl,nd); B = randn(np/nl,nd);
        C = A-B;
        labSend(C,2);
    elseif (labindex==2)
        C= labReceive(1);
        D= C.^2;
        labSend(D,3)
    elseif (labindex ==3)
        D = labReceive(2);
        E = sum(D,2);
        labSend(E,4)
    elseif (labindex ==4)
        E=labReceive(3);
        F = sqrt(E);
        %disp(F);
        labSend(F,1);
    end
        
end
t=toc;
disp(t);
disp(F);
%d1=F{1};
%disp(F);


   