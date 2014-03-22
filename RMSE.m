function perf = RMSE(OBSERVED,MODEL)
perf = sqrt(sum((OBSERVED-MODEL).^2)/length(OBSERVED));
return;