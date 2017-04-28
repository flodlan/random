function Y_adj = regressout(Y,X);

X_full = [X ones(size(X,1),1)]; % add a constant term 

B = X_full\Y;

Y_adj = Y; % start with the observations
for i=1:size(X,2)
    Y_adj = Y_adj - B(i).*X(:,i); % and subtract the model
end




