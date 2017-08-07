hx = X*theta;
delta = hx - y;
sqErr_Sum = sum(delta.^2);
regTerm = sum(theta(2:size(theta,1),:).^2);
regTerm = lambda*regTerm;
J = (sqErr_Sum+regTerm)/(2*m);


grad = (X'*delta)/m;
theta(1) = 0;
grad = grad + ((lambda/m)*theta);











for i = 1:length(lambda_vec)
          lambda = lambda_vec(i);      
          [tmp] = trainLinearReg(X,y,lambda);
          theta_train = tmp
          [tmp] = trainLinearReg(Xval,yval,lambda);
          theta_validation = tmp
          [J grad] = linearRegCostFunction(X,y,theta_train,0);
          error_train(i) = J;
          [J grad] = linearRegCostFunction(Xval,yval,theta_validation,0);
          error_val(i) = J;   
       end