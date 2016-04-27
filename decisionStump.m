function [feature, threshold, error] = decisionStump(X, y, D, n)
for i = 1:n
    % randomly choose the feature
    if(rand() > 0.5) 
        feature = 1;
    else
        feature = 2; 
    end
    
    % randomly choose the direction
    if(rand() > 0.5) 
        direction = 1;
    else
        direction = -1; 
    end
    
    threshold = (max(X(:, feature)) - min(X(:, feature))) * rand() + min(X(:, feature));
    
    % calculate the error
    if(direction == 1)                                                                         
        error = sum((1 - ((X(:, feature) >= threshold) == y)) .* D);                          
    else
        error = sum((1 - ((X(:, feature) <= threshold) == y)) .* D);
    end  
end

end