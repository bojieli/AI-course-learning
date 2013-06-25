function [ ypred, accuracy ] = lsclassifier(traindata, trainlabel, testdata, testlabel, lambda)
    [~,     ~] = size(traindata);
    [testm, n] = size(testdata);
    left = (traindata' * traindata) + lambda * eye(n);
    size(left)
    w = left \ (traindata' * trainlabel);
    ypred = testdata * w;
    for i = 1:testm
        if ypred(i) > 0
            ypred(i) = 1;
        else
            ypred(i) = -1;
        end
    end
    accuracy = sum(ypred == testlabel) / testm;
end