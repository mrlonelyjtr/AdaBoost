function [alphas] = adaBoost(X, y, T)
alphas = [];

m = size(X, 1);
D = ones(m, 1) / m;

for i = 1:T
    % train weak classifier
    [feature, threshold, epsilon] = decisionStump(X, y, D);
    
    alphas = [alphas; 0.5 * log((1 - epsilon) / epsilon)];
end

end