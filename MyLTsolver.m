function s = MyLTsolver(L, b)
    % s=function MyLTsolver(L,b)
    % inputs: L -- a lower triangular matrix
    %         b -- the load vector
    % output: s -- solution for Ls=b
    
    n = length(b);  % Size of the matrix L
     
    s = zeros(n, 1); % Initializing the solution vector s with zeros
    
    % Forward substitution
    for i = 1:n
        s(i) = (b(i) - L(i, 1:i-1) * s(1:i-1)) / L(i, i);
    end
end