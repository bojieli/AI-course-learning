function [traindata, trainlabel, testdata, testlabel] = do_fold(fold, curr, trainX, trainY)
    [num, ~] = size(trainX);
    left = num * (curr-1) / fold;
    right = num * (curr) / fold;
    if left == 0
        traindata = trainX(right+1:num,:);
        trainlabel = trainY(right+1:num,:);
    elseif right == num
        traindata = trainX(1:left,:);
        trainlabel = trainY(1:left,:);
    else
        traindata = vertcat(trainX(1:left,:), trainX(right+1:num,:));
        trainlabel = vertcat(trainY(1:left,:), trainY(right+1:num,:));
    end
    testdata = trainX(left+1:right,:);
    testlabel = trainY(left+1:right,:);
end