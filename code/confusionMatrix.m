%% Confusion Matrix nist26

load('../data/nist26_train.mat', 'train_data', 'train_labels')
load('../data/nist26_test.mat', 'test_data', 'test_labels')
load('../data/nist26_valid.mat', 'valid_data', 'valid_labels')
load('nist26_model.mat')

[outputs] = Classify(W, b, valid_data);

[~,estimate_labels] = max(outputs,[],2);
[~,real_labels] = max(valid_labels,[],2);

C = confusionmat(real_labels,estimate_labels)
figure
image(C)


%% Confusion Matrix nist36

load('../data/nist36_train.mat', 'train_data', 'train_labels')
load('../data/nist36_test.mat', 'test_data', 'test_labels')
load('../data/nist36_valid.mat', 'valid_data', 'valid_labels')
load('nist36_model.mat')

[outputs] = Classify(W, b, valid_data);

[~,estimate_labels] = max(outputs,[],2);
[~,real_labels] = max(valid_labels,[],2);

C = confusionmat(real_labels,estimate_labels)
figure
image(C)