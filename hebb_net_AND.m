% Initialize the input patterns and their corresponding targets for the AND gate
X = [0 0; 0 1; 1 0; 1 1]; % Input patterns
T = [0; 0; 0; 1]; % Target outputs

% Initialize the weights and bias
weights = [0; 0];
bias = 0;

% Learning rate
learning_rate = 1;

% Hebbian learning rule
for epoch = 1:10 % Train for a fixed number of epochs
    for i = 1:size(X, 1)
        input = X(i, :)';
        target = T(i);

        % Compute the actual output
        output = weights' * input + bias;

        % Hebbian weight update rule
        weights = weights + learning_rate * input * target;
        bias = bias + learning_rate * target;
    end
end

% Display the final weights and bias
disp('Final weights:');
disp(weights);
disp('Final bias:');
disp(bias);

% Test the trained Hebb net
disp('Testing the Hebb net on the AND gate:');
for i = 1:size(X, 1)
    input = X(i, :)';
    output = weights' * input + bias;
    disp(['Input: ', num2str(X(i, :)), ' Output: ', num2str(output > 0)]);
end