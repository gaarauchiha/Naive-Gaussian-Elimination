n = 7; % Odd n
d = 4 * ones(n, 1); % All entries in d are 4
a = ones(n, 1); % All entries in a are 1

x_exact = ones(n, 1); % x = ones(n,1) is the solution
A = zeros(n, n);
for i = 1:n
    A(i, i) = d(i);
end
for i = 1:floor(n/2)
    A(i, n-i+1) = a(n-i+1);
    A(n-i+1, i) = a(i);
end
b = A * x_exact;

x = GaussianX(n, d, a, b); % Solve using previous GaussainX function

% Check the error in the computation of x
errorX = max(abs(x - x_exact));
fprintf('Maximum error in the solution x: %e\n', errorX);

% Check the residual error
errorR = max(abs(b - A * x));
fprintf('Maximum residual error: %e\n', errorR);