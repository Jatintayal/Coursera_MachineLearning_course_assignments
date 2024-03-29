function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
	
	J0 = 0;
	h = theta' * X';
	for i = 1:m,
		J0 = J0 + h(i) - y(i);
	end
	J0 = (J0 * alpha)/ m;
	
	J1 = 0;
	for i = 1:m,
		J1 = J1 + (h(i) - y(i)) * X(i, 2);
	end
	J1 = (J1 * alpha)/ m;
	
	temp0 = theta(1) - J0;
	temp1 = theta(2) - J1;
	
	theta(1) = temp0;
	theta(2) = temp1;
	
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
