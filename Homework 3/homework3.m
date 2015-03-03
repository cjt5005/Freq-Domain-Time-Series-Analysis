clear all
close all

load dow
logdow = log(dow);
dowdif = diff(logdow);
N = length(dowdif);

pgram = 1/(2*pi*N)*abs(fft(dowdif)).^2;
pgram = pgram(2:(N/2+1));
w = 2*pi*(0:N-1)/N;
wp = w(2:(N/2+1));
figure()
plot(pgram);
figure()
hist(pgram,1000)

