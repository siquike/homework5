num_epoch = 5;
classes = 36;
layers = [32*32, 400, classes];
learning_rate = 0.01;

load('../data/nist36_train.mat', 'train_data', 'train_labels')
load('../data/nist36_test.mat', 'test_data', 'test_labels')
load('../data/nist36_valid.mat', 'valid_data', 'valid_labels')

%%
[W, b] = InitializeNetwork(layers);

train_acc = nan(num_epoch,1);
valid_acc = nan(num_epoch,1);
train_loss = nan(num_epoch,1);
valid_loss = nan(num_epoch,1);

for j = 1:num_epoch
    [W, b] = Train(W, b, train_data, train_labels, learning_rate);

    [train_acc(j), train_loss(j)] = ComputeAccuracyAndLoss(W, b, train_data, train_labels);
    [valid_acc(j), valid_loss(j)] = ComputeAccuracyAndLoss(W, b, valid_data, valid_labels);


    fprintf('Epoch %d - accuracy: %.5f, %.5f \t loss: %.5f, %.5f \n', j, train_acc(j), valid_acc(j), train_loss(j), valid_loss(j))
end

save('nist36_model.mat', 'W', 'b')

%% Plots

figure
plot(1:num_epoch,train_acc)
hold on
plot(1:num_epoch,valid_acc)
hold off

figure
plot(1:num_epoch,train_loss)
hold on
plot(1:num_epoch,valid_loss)
hold off
