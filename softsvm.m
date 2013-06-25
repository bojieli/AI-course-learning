function [ ypred, accuracy ] = softsvm(traindata, trainlabel, testdata, testlabel, sigma, C)
    [trainm, ~] = size(traindata);
    train_limit = 200;
    if trainm > train_limit
        trainm = train_limit;
    end
    [testm,  ~] = size(testdata);

    f = -ones(trainm, 1);
    LB = zeros(trainm, 1);
    UB = C * ones(trainm, 1);
    Aeq = trainlabel';
    Beq = 0;
    x0 = ones(trainm, 1);

    K = zeros(trainm);
    H = zeros(trainm);
    for i = 1:trainm
        for j = 1:trainm
            K(i,j) = kernel_func(sigma, traindata(i,:), traindata(j,:));
            H(i,j) = trainlabel(i) * trainlabel(j) * K(i,j);
        end
    end
    
    options = optimset('MaxIter', 2000);
    alpha = quadprog(H, f, [], [], Aeq, Beq, LB, UB, x0, options);
    w = trainlabel .* alpha;
    
    % select the train data with maximum w
    [~, maxj] = max(alpha);
    b = trainlabel(maxj) - K(maxj,:) * w;

    preds = zeros(testm, 1);
    ypred = zeros(testm, 1);
    for i = 1:testm
        pred = b;
        for j = 1:trainm
            % for alpha(j)==0, w(j)=0
            pred = pred + w(j) * kernel_func(sigma, testdata(i,:), traindata(j,:));
        end
        preds(i) = pred;
        if pred > 0
            ypred(i) = 1;
        else
            ypred(i) = -1;
        end
    end
    accuracy = sum(ypred == testlabel) / testm;
end

function kernel = kernel_func(sigma, x, y)
    if sigma == 0
        kernel = x * y';
    else
        kernel = e ^ (- sum((x - y)^2) / sigma^2);
    end
end