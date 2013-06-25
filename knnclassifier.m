function [ypred, accuracy] = knnclassifier(traindata, trainlabel, testdata, testlabel, k)
    [trainm, ~] = size(traindata);
    [testm,  ~] = size(testdata);
    ypred = zeros(testm, 1);
    for i = 1:testm
        distance = zeros(trainm, 1);
        for j = 1:trainm
            diff = traindata(j,:) - testdata(i,:);
            distance(j) = diff * diff';
        end
        [~, indexes] = sort(distance);
        predlabel = sum(trainlabel(indexes(1:k)));
        if predlabel > 0
            ypred(i) = 1;
        else
            ypred(i) = -1;
        end
    end
    accuracy = sum(ypred == testlabel) / testm;
end