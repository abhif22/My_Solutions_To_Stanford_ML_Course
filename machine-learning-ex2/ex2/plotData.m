function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

positiveX = X((find(y==1.0)),:);
negativeX = X((find(y==0.0)),:);
%size(positiveX)
%size(negativeX)
plot(positiveX(:,1),positiveX(:,2),'k+','LineWidth', 2,'MarkerSize', 7);
plot(negativeX(:,1),negativeX(:,2),'ko','MarkerFaceColor','y','MarkerSize', 7);
xlabel('Marks secured in Examination 1');
ylabel('Marks secured in Examination 2');
legend('Students Selected','Students Not Selected');
print -dpng 'LogisticRegressionDataVisualization.png';





% =========================================================================



hold off;

end
