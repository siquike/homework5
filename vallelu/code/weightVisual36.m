%% Display Initialization Weights

classes = 36;
layers = [32*32, 400, classes];

[W, b] = InitializeNetwork(layers);

visual36 = reshape(W{1}'./max(max(W{1})),32,32,1,[]);
montage(visual36);
%%

load 'nist36_model.mat'

visual36 = reshape(W{1}'./max(max(W{1})),32,32,1,[]);
montage(visual36);
