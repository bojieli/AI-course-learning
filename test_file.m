function [knn_result, knn_best, k, ls_result, ls_best, lambda, svm_result, svm_best, sigma, C] = test_file(file)
    [knn_result, knn_best, k] = do_test(file, 'knnclassifier', [3,5,9,15,25]);
    knn_best
    k
    [ls_result, ls_best, lambda] = do_test(file, 'lsclassifier', [1e-4,0.01,0.1,0.5,1,5,10,100,1000,5000,10000]);
    ls_best
    lambda
    [svm_result, svm_best, sigma, C] = do_test(file, 'softsvm', [0,0.01,0.1,1,10,100], [1,10,100,1000]);
    svm_best
    sigma
    C
end