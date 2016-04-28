clear; close all; clc

% 10 samples
samples = [80 144 1; 93 232 1; 136 275 -1; 147 131 -1; 159 69 1; 214 31 1; 214 152 -1; 257 83 1; 307 62 -1; 307 231 -1];
coordinates = samples(:, 1:2);
labels = samples(:, 3);

% initialize the parameters
iterations = 5;
weakClassifiers = 50;

% get the final classifier and check the results of classification
train_result = adaBoost(coordinates, labels, iterations, weakClassifiers);
classifications = strongClassifier(coordinates, train_result);

% visualize the results including samples and weak classifiers
figure(1);
axis auto, hold on;
plot(coordinates(labels == 1, 1), coordinates(labels == 1, 2), 'b+');
plot(coordinates(labels == -1, 1), coordinates(labels == -1, 2), 'ro');
for i = 1:iterations
    if(train_result(i, 4) == 1)
        plot([train_result(i, 3) train_result(i, 3)], [0 300], 'g');
    else
        plot([50 350], [train_result(i, 3) train_result(i, 3)], 'g');
    end
end
legend('positive samples', 'negative samples', 'weak classifier'); hold off;

% show the results of classification and accuracy
disp('The comparision between label and classification is')
disp([samples classifications]);
disp('The accuracy is');
disp(sum(classifications == labels) / length(labels));
