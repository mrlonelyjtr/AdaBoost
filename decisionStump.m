function [best_feature, best_direction, best_threshold, best_epsilon, best_classification] = decisionStump(X, y, D, n)
best_epsilon = 1;

for i = 1:n
    % randomly choose the feature
    if(rand() >= 0.5) 
        feature = 1;
    else
        feature = 2; 
    end
    
    % randomly choose the direction
    if(rand() >= 0.5) 
        direction = 1;
    else
        direction = -1; 
    end
    
    threshold = (max(X(:, feature)) - min(X(:, feature))) * rand() + min(X(:, feature));
    
    % calculate the error
    if(direction == 1)                                                                         
        classification = double(X(:, feature) >= threshold);                      
    else
        classification = double(X(:, feature) <= threshold);
    end  
    classification(classification(:) == 0) = -1;
    epsilon = sum((1 - (classification == y)) .* D);  
    
    % find the best weak classifier
    if(epsilon < best_epsilon)
        best_epsilon = epsilon;
        best_feature = feature;
        best_direction = direction;
        best_threshold = threshold;
        best_classification = classification;
    end
end

end