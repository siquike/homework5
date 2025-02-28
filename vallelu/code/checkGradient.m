function checkGradient(W,b,X,act_h,grad_W,grad_b)
epsilon = 1e-4;

for i = 1:numel(W)
    if i == 1
        thetap = (W{i}+epsilon)*X + b{i};
        thetan = (W{i}-epsilon)*X + b{i};
    else
        thetap = (W{i}+epsilon)*act_h{i-1} + b{i};
        thetan = (W{i}-epsilon)*act_h{i-1} + b{i};
    end
    
    if i < numel(W)
        Jp = sigmf(thetap, [1 0]);
        Jn = sigmf(thetan, [1 0]);
    else
        Jp = exp(thetap)./sum(exp(thetap));
        Jn = exp(thetan)./sum(exp(thetan));
    end
    thetap = [];
    thetan = [];
    
    g_theta{i} = (Jp-Jn)/(2*epsilon);
    comparison{i} = abs(g_theta{i} - grad_W{i});
    check = (comparison{i} < 1e-6);
    if check
        disp('Gradient is Correct')
    else
        disp('Gradient is Incorrect')
    end
end