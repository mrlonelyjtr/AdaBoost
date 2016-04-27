function [alphas] = adaBoost(X, y, T, n)
alphas = [];

m = size(X, 1);
D = ones(m, 1) / m;

for i = 1:T
    %train weak classifier
    [feature, threshold, error] = decisionStump(X, y, D, n);
    
    %weak_classifiers = [weak_classifiers; feature threshold];
    alphas = [alphas; 0.5 * log((1 - error) / error)];
end

end