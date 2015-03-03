clear all
close all
clc

%%
load dow
logdow = log(dow);
returns = diff(logdow); % Approximately

% Figure 1 - Time Series of Returns
figure()
plot(returns)
title('Time Series Plot of Returns')
axis tight

% Figure 2 - Periodogram
figure()
N = length(returns);
f = (0:N-1)/N;
Jreturns = fft(returns);
pgram = abs(Jreturns).^2;

plot(f(1:N/2),pgram(1:N/2));
title('Periodogram of Returns');
% Figure 3 - Log Periodogram
figure()

logPgram = log(pgram);

plot(f(1:N/2),logPgram(1:N/2));
title('Log-Periodogram of Returns');


% Figure 4 - Time Series of Smoothed Returns
a = 1;
K = 5;
b = 1/K*ones(K,1);

smoothedReturns = filter(b,a,returns);
plot(smoothedReturns)
title('Time Series Plot of Smoothed Returns');

% Figure 5 - Periodogram of Smoothed Returns
figure()
N = length(smoothedReturns);
f = (0:N-1)/N;
JsmoothedReturns = fft(smoothedReturns);
pgramSmoothed = abs(JsmoothedReturns).^2;

plot(f(1:N/2),pgramSmoothed(1:N/2));
title('Periodogram of Smoothed Returns');
% Figure 6 - Log-Periodogram of Smoothed Returns
figure()
logPgram = log(pgramSmoothed);

plot(f(1:N/2),logPgram(1:N/2));
title('Log-Periodogram of Smoothed Returns');

% Figure 7 - Ratio of periodogram of smoothed data
% to periodogram of raw data
figure()
pgramRatio = pgramSmoothed./pgram;
plot(f(1:N/2),pgramRatio(1:N/2))
title('Ratio of Smoothed to Raw Periodogram')

% Figure 8 - Plot of squared transfer function
figure()
transF = JsmoothedReturns./Jreturns;

plot(f(1:N/2),abs(transF(1:N/2)).^2);
title('Squared Transfer Function')

%% 
j = 71;
N = 1024*16;
t = 0:N-1;
K = 300;
for k = 1:K
    mc(k) = sum(randn(1,N).*sin(2*pi*j/N*t));
end

var(mc)/N
mean(mc)