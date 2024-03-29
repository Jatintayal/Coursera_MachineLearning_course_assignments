function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
n = size(X, 2);

% You need to return the following variables correctly 
J = 0;
reg = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

g = sigmoid(X * theta);
for i = 1:m,
	J = J + y(i) * log(g(i)) + (1 -y(i)) * log(1 - g(i));
end
J = -1 * J;
J = J / m;
for i = 2:n,
	reg = reg + (theta(i) .^ 2);
end
reg = (lambda * reg) / (2 * m);
J = J + reg;

for j = 2:n,
	for i = 1:m,
		grad(j) = grad(j) + ((g(i) - y(i)) * X(i, j));
	end
	grad(j) = grad(j) / m;
end

reg = theta;
reg(1) = 0;
grad = (X' * (g - y) ./ m) + reg * lambda / m;

% =============================================================

end
