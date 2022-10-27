function [A,b] = discretisation(A,b,ambient)

    %% For Bottom Boundary
    % (2-5)
    
    for i = 2:5
        A(i,i-1) = -1;
        A(i,i) = 3;
        A(i,i+1) = -1;
        A(i,i+6) = -1;
    end
    % (last)
        A(6,6) = 3;
        A(6,12) = -1;
        A(6,5) = -1;
    
    %% For Side Boundary
    % (bottom 4)
    for i = 1:3
        A(1+(6*i),1+(6*i)) = 3;
        A(1+(6*i),1+(6*(i-1))) = -1;
        A(1+(6*i),1+(6*(i+1))) = -1;
        A(1+(6*i),2+(6*i)) = -1;
        
    end
    
    % (last)
    A(30,30) = 3;
    A(30,31) = -1;
    A(30,25) = -1;
    
    % 25
    A(25,25) = 3;
    A(25,19) = -1;
    A(25,26) = -1;
    A(25,30) = -1;
    
    %% For Inner
    % (first row)
    for i = 8:11
        A(i,i) = 4;
        A(i,i-1) = -1;
        A(i,i+1) = -1;
        A(i,i-6) = -1;
        A(i,i+6) = -1;
    end
    
    % (first row, last)
    i = 12;
    A(i,i) = 4;
    A(i,i-1) = -1;
    A(i,i-6) = -1;
    A(i,i+6) = -1;
    
    % (second row)
    for i = 14:17
        A(i,i) = 4;
        A(i,i-1) = -1;
        A(i,i+1) = -1;
        A(i,i-6) = -1;
        A(i,i+6) = -1;
    end
    
    % (second row, last)
    A(18,18) = 4;
    A(18,17) = -1;
    A(18,12) = -1;
    A(18,24) = -1;
    
    % (third row)
    for i = 20:23
        A(i,i) = 4;
        A(i,i-1) = -1;
        A(i,i+1) = -1;
        A(i,i-6) = -1;
        A(i,i+6) = -1;
    end
    
    % (fourth row)
    for i = 26:28
        A(i,i) = 4;
        A(i,i-1) = -1;
        A(i,i+1) = -1;
        A(i,i-6) = -1;
        A(i,i+5) = -1;
    end
    
    % (fifth row)
    for i = 31:32
        A(i,i) = 4;
        A(i,i-1) = -1;
        A(i,i+1) = -1;
        A(i,i-5) = -1;
    end
    
    %% For Extras
    % 1
    A(1,1) = 2;
    A(1,2) = -1;
    A(1,7) = -1;
    
    
    % 24
    A(24,24) = (3+(0.2/(3*sin((3*pi)/8)))-(cot((3*pi)/8)));
    A(24,18) = -1;
    A(24,23) = -1;
    
    % 29
    A(29,29) = (30+sqrt(2))/15;
    A(29,23) = -1;
    A(29,28) = -1;
    
    % 33
    A(33,33) = (3+(0.2/(3*sin((3*pi)/8)))-(cot((3*pi)/8)));
    A(33,28) = -1;
    A(33,32) = -1;  
    
    %% Creating b

    b(6) = 40;
    b(12) = 40;
    b(18) = 40;
    
    b(24) =  40 + ambient*(1/(15*sin(3*pi/8))) - 40*cot(3*pi/8);
    
    b(29) = ambient*(sqrt(2)/15);
    
    b(30) = 70;
    b(31) = 70;
    b(32) = 70;
    
    b(33) = 70 + ambient*(1/(15*sin(3*pi/8))) - 70*cot(3*pi/8);
    
    
end