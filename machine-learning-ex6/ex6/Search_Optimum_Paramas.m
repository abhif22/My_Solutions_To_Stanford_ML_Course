C = [0.01,0.03,0.1,0.3,1,3,10,30];
sigma = [0.01,0.03,0.1,0.3,1,3,10,30];
CV_ERR = zeros(64,3);
count = 0;
for i=1:8
  for j=1:8
    count = count+1;
    fprintf('Training S.No. %d\n',count);
    fprintf('i=%d\tj=%d\n',i,j);
    fprintf('C = %f\tsigma = %f', C(i),sigma(j));
    model= svmTrain(X, y, C(i), @(x1, x2) gaussianKernel(x1, x2, sigma(j)));
    predictions = svmPredict(model, Xval);
    CV_ERR(count,1) = mean(double(predictions ~= yval));
    CV_ERR(count,2) = C(i);
    CV_ERR(count,3) = sigma(j);
    fprintf('Cross Validation Error = %f\n\n\n',CV_ERR(count,1));
  end
end
[minValErr idx] = min(CV_ERR(:,1));
fprintf('Minimum Cross Validation Error is %f\nFor Values of C = %f and sigma = %f \n', minValErr, CV_ERR(idx,2),CV_ERR(idx, 3));
C = CV_ERR(idx,2);
sigma = CV_ERR(idx, 3);