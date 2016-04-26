% 10 samples
samples = [80 144 1; 93 232 1; 136 275 -1; 147 131 -1; 159 69 1; 214 31 1; 214 152 -1; 257 83 1; 307 62 -1; 307 231 -1];

% show the result
figure(1);
axis auto, hold on;
plot(samples(samples(:, 3) == 1, 1), samples(samples(:, 3) == 1, 2), 'b+');
plot(samples(samples(:, 3) == -1, 1), samples(samples(:, 3) == -1, 2), 'ro');
legend('positive', 'negative');
