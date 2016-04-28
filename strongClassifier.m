function classifications = strongClassifier(X, train_result)
hypothesis = [];

% generate the strong classifier
for i = 1:size(train_result, 1)
    hypothesis = [hypothesis; train_result(i, 2) * sign(X(:, train_result(i, 4)) - train_result(i, 3))];
end
hypothesis = reshape(hypothesis, size(X, 1), size(train_result, 1));
classifications = sign(hypothesis * train_result(:, 1));

end