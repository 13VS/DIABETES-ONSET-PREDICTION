clear ; close all; clc
data = load('data.txt');
X = data(:, 1:8); y = data(:, 9);
plotData(X, y);
[m, n] = size(X);
X = [ones(m, 1) X];
fprintf('initializing theta to zeros\n');
init_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(init_theta, X, y);
fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);
test_theta = [-10; 0.1; 0.05;-0.01;0.01;0.001;0.1;1;0.05];
[cost, grad] = costFunction(test_theta, X, y);
fprintf('\nfor a random test theta:');
fprintf('\nCost at test theta: %f\n', cost);
fprintf('Gradient at test theta: \n');
fprintf(' %f \n', grad);
options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), init_theta, options);
fprintf('\ntheta after optimization: \n');
fprintf(' %f \n', theta);
fprintf('Cost at optimized theta : %f\n', cost);
fprintf('for a sample test data:\n');
fprintf('Pregnancies: 10\n');
fprintf('Glucose: 150\n');
fprintf('BloodPressure: 50\n');
fprintf('SkinThickness: 25\n');
fprintf('Insulin: 100\n');
fprintf('BMI: 25\n');
fprintf('DiabetesPedigreeFunction: 0.5\n');
fprintf('Age: 25\n\n');
prob = sigmoid([1 10 150 50 25 100 25 0.5 25] * theta);
fprintf('probability of diaabetes for above data ');
fprintf(' %f \n', prob);
if prob>0.5
fprintf('patient suffers from diabetes\n');
else 
fprintf('patient does not have diabetes\n');
end
p = predict(theta, X);
fprintf('Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\n');