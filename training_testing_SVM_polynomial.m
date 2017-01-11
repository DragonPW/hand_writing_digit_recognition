%% input 

%%  training
X = reshape(training_image,IMAGE_SIZE*IMAGE_SIZE,[]);
SVMModels = cell(10,1);
for j=1:10
    y = training_label==(j-1);
    SVMModels{j} = fitcsvm(X',y','Standardize',false,'KernelFunction','polynomial',...
    'PolynomialOrder',5,'KernelScale','auto');
end

%% classify testing image
Xtest = reshape(testing_image,IMAGE_SIZE*IMAGE_SIZE,[])';

Scores = zeros(testing_N,10);

for j = 1:10
    [~,score] = predict(SVMModels{j},Xtest);
    Scores(:,j) = score(:,2); % Second column contains positive-class scores
end
[~,maxScore] = max(Scores,[],2);
classifier_output = maxScore'-1;