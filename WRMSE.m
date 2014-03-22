function perf = WRMSE(OBSERVED,MODEL,WEIGHT)

perf = sqrt(sum(WEIGHT.*(OBSERVED-MODEL).^2)/sum(WEIGHT));
return;