function [feature, threshold, epsilon] = decisionStump(X, y, D)
while(1)
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
        classification(classification(:) == 0) = -1;
        epsilon = sum((1 - (classification == y)) .* D);                          
    else
        classification = double(X(:, feature) <= threshold);
        classification(classification(:) == 0) = -1;
        epsilon = sum((1 - (classification == y)) .* D);  
    end  

    if(epsilon < 0.5)
        break;
    end
end

end