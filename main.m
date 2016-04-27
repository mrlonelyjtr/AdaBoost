clear; close all; clc

% 10 samples
samples = [80 144 1; 93 232 1; 136 275 -1; 147 131 -1; 159 69 1; 214 31 1; 214 152 -1; 257 83 1; 307 62 -1; 307 231 -1];
coordinates = samples(:, 1:2);
labels = samples(:, 3);

% initial the parameters
iterations = 1;
weak_classifiers = 20;

% show the samples on the figure
figure(1);
axis auto, hold on;
plot(coordinates(labels == 1, 1), coordinates(labels == 1, 2), 'b+');
plot(coordinates(labels == -1, 1), coordinates(labels == -1, 2), 'ro');
legend('positive samples', 'negative samples');
hold on;

adaBoost(coordinates, labels, iterations, weak_classifiers);