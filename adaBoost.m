function train_result = adaBoost(X, y, T, n)
train_result = [];
m = size(X, 1);

% initialize weights for samples
D = ones(m, 1) / m;

for i = 1:T
    % train and find the best weak classifier
    [feature, direction, threshold, epsilon, classification] = decisionStump(X, y, D, n);
    
    % calculate weights for weak classifiers
    alpha = 0.5 * log((1 - epsilon) / epsilon);
    
    % update weights for samples
    D = D .* exp(-alpha * (y .* classification));
    
    train_result = [train_result; alpha, direction, threshold, feature];
end

end