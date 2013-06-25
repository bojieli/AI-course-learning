function [result, max_accuracy, best_param1, best_param2] = do_test(filename, func, params1, params2)
    load(filename);
    fold = 5;
    if nargin < 4
        params2 = 0;
    end
    rounds = length(params1) * length(params2);
    result = zeros(rounds, fold);
    mean_accuracy = zeros(rounds, 1);
    
    for i = 1:length(params1)
        for j = 1:length(params2)
            index = (i-1)*length(params2) + j;
            for f = 1:fold
                [traindata, trainlabel, testdata, testlabel] = do_fold(fold, f, trainX, trainy);
                if strcmp(func, 'knnclassifier')
                    [~, accuracy] = knnclassifier(traindata, trainlabel, testdata, testlabel, params1(i));
                elseif strcmp(func, 'lsclassifier')
                    [~, accuracy] = lsclassifier(traindata, trainlabel, testdata, testlabel, params1(i));
                elseif strcmp(func, 'softsvm')
                    [~, accuracy] = softsvm(traindata, trainlabel, testdata, testlabel, params1(i), params2(j));
                else % error
                    accuracy = 0;
                end
                result(index, f) = accuracy;
            end
            mean_accuracy(index) = mean(result(index, :));
        end
    end

    [max_accuracy, besti] = max(mean_accuracy);
    
    best_param1 = params1(floor((besti-1) / length(params2)) + 1);
    
    tmp_param2 = mod(besti, length(params2));
    if tmp_param2 == 0
        best_param2 = params2(length(params2));
    else
        best_param2 = params2(tmp_param2);
    end
end

