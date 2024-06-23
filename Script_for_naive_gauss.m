function compare_gaussian_elimination()

    cases = {[0.2, 0.4, 0.6, 0.8, 1]',[0.1:0.1:1]',[0.05:0.05:1]'}; % Test cases of c (provided by the problem)
    
    for i = 1:length(cases) % Iterating through each test case
        c = cases{i};
        n = length(c);
        
        A = vander(c); % Vandermonde matrix A
        
        xsol = ones(n, 1);
        b = A * xsol; % b = Ax as instructed
        
        x_naive = naiv_gauss(A, b); % Naive Gaussian elimination output
        
        x_pivot = A \ b; % MATLAB's built-in solver output
        
        fprintf('Case %d:\n', i);
        fprintf('c = [%s]\n', num2str(c'));
        
        disp('Naive Gaussian elimination solution:');
        disp(x_naive);
        
        disp('MATLAB built-in solver solution:');
        disp(x_pivot);
        
        % Calculate and display the difference
        diff = norm(x_naive - x_pivot);
        fprintf('Norm of difference between solutions: %e\n', diff);
        fprintf('------------------------------------------\n'); % Separating each ietration for a better visual
    end
end

function x = naiv_gauss(A, b)
    n = length(b);
    x = zeros(n, 1);

    for k = 1:n-1
        for i = k+1:n
            xmult = A(i, k) / A(k, k);
            A(i, k) = xmult;
            for j = k+1:n
                A(i, j) = A(i, j) - xmult * A(k, j);
            end
            b(i) = b(i) - xmult * b(k);
        end
    end
    
    x(n) = b(n) / A(n, n);
    for i = n-1:-1:1
        sum = b(i);
        for j = i+1:n
            sum = sum - A(i, j) * x(j);
        end
        x(i) = sum / A(i, i);
    end
end