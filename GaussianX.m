function x = GaussianX(n, d, a, b)
    % function x = GaussianX(n, d, a, b)
    % input: n=system size, must be an odd number, (d,a,b): vectors of length n
    % output: x = solution
    
    if mod(n, 2) == 0 % To make sure that n is an odd number
        error('The system size n must be an odd number.');
    end
    
    A = diag(d); % Using X shape nature of the matrix, we biuld the A matrix
    for i = 1:floor(n/2)
        A(i, n-i+1) = a(n-i+1);
        A(n-i+1, i) = a(i);
    end
    
    % Forward elimination
    for k = 1:n-1
        for i = k+1:n
            if A(i, k) ~= 0
                m = A(i, k) / A(k, k);
                A(i, k:n) = A(i, k:n) - m * A(k, k:n);
                b(i) = b(i) - m * b(k);
            end
        end
    end
    
    % Backward substitution
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
    end
end