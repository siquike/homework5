%% Display Initialization Weights

classes = 26;
layers = [32*32, 400, classes];

[W, b] = InitializeNetwork(layers);
min(min(W{1}))

visual26 = reshape(W{1}'./max(max(W{1})),32,32,1,[]);
montage(visual26);
%%

load 'nist26_model.mat'

visual26 = reshape(W{1}'./max(max(W{1})),32,32,1,[]);
montage(visual26);
