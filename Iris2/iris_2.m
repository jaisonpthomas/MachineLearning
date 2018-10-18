close all; clear; clc;

data = csvread('iris_data_processed.csv');

%%%       DATA PARTITIONING
X_train = data(1:90, 1:4);
y_train = data(1:90, 5);

X_val = data(91:120, 1:4);
y_val = data(91:120, 5);

X_test = data(121:150, 1:4);
y_test = data(121:150, 5);

num_labels = 3


%%%         COST FUNCTION

lambda = 1;

[all_theta] = oneVsAll(X_train, y_train, num_labels, lambda);

pred_train = predictOneVsAll(all_theta, X_train);
fprintf('\nTRAINING Set Accuracy: %f\n', mean(double(pred_train == y_train)) * 100);

pred_val = predictOneVsAll(all_theta, X_val);
fprintf('\nVALIDATION Set Accuracy: %f\n', mean(double(pred_val == y_val)) * 100);

pred_test = predictOneVsAll(all_theta, X_test);
fprintf('\nTEST Set Accuracy: %f\n', mean(double(pred_test == y_test)) * 100);











%%%         PLOTTING          
figure;
plot(y_train, X_train(:,1), 'rx')
title("Sepal Length")

figure;
plot(y_train, X_train(:,2), 'gx')
title("Sepal width")

figure;
plot(y_train, X_train(:,3), 'bx')
title("Petal Length")

figure;
plot(y_train, X_train(:,4), 'rx')
title("Petal Width")


[m n] = size(X_train);
theta = zeros(n+1, 1);

close all;

