n = 10; % the size of the system
A = rand(n); % a random nxn matrix, with entries in (0,1), which is a full matrix
L = tril(A) + eye(n); % take the lower triangular part of A and put in L and make sure diagonal elements are > 1
b = sum(L, 2); % we then have b = Lx where x = [1; 1; ...; 1]
xe = ones(n, 1); % the exact solution

x = MyLTsolver(L, b); % This line solves the system using MyLTsolver function

errorX = max(abs(x - xe)); % Check the error in the computation of x
fprintf('Maximum error in the solution x: %e\n', errorX);

errorR = max(abs(b - L * x)); % Check the residual error
fprintf('Maximum residual error: %e\n', errorR);