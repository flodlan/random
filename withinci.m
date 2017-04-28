function ci = withinci(X,alpha,twotailed,unbiased)
% computes the within-subjects confidence interval (Cousineau,
% 2005). Normality is assumed, CI are symmetric.
% returned ci is the distance from the mean.
% X: columns are factors, rows are observations.
% alpha: significance level (default 0.05; i.e. return 95% CI)
% twotailed: whether CI should be two-tailed (default 1)
% unbiased (default = 1) will apply the Morey (2008) correction to obtain
% unbiased estimates.
% Copyright 2013 Eelke Spaak

if nargin < 2
  alpha = 0.05;
end
if nargin < 3
  twotailed = 1;
end
if nargin < 4
  unbiased = 1;
end

stde = withinstde(X,unbiased);
if twotailed
  alpha = alpha/2;
end

ci = tinv(1-alpha, size(X,1)-1) .* stde;