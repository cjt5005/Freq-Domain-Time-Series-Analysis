close all
clear all

%% Problem 1
load 'co2.mat';

t = 1:384;

figure()
plot(t,co2);

xmat = [(1:384)' (1:384).^2'];
[~, ~, co2res, ~, ~] = lsfit(co2,xmat);

figure()
plot(t,co2res)

pgram = 1/(2*pi*384)*abs(fft(co2res)).^2;
pgram = pgram(2:(384/2+1));

w = 2*pi*(0:383)/384;
wp = w(2:(384/2+1));

figure()
plot(wp,pgram);

figure()

plot(wp,log(pgram));

%% Problem 2
close all

co2res15 = co2res((0:23)*15+1);
t = (1:384);
t = t((0:23)*15+1);
plot(t,co2res15)
hold on
scatter(t,co2res15)
%From these plots, it appears that the dominant frequency is 1 cycle per 60 months

pgram15 = 1/(2*pi*24)*abs(fft(co2res15)).^2;
pgram15 = pgram15(2:(24/2+1));
w15 = w((0:23)*15+1);
w15 = w15(2:(24/2+1));
figure
plot(w15,pgram15)

%% Problem 3
clear all
close all

load dow

plot(dow)

logdow = log(dow);

figure()
plot(logdow)

N = length(logdow);
pgram = 1/(2*pi*N)*abs(fft(logdow)).^2;
pgram = 10*log10(pgram(2:(N/2+1)));

w = 2*pi*(0:N-1)/N;
wp = w(2:(N/2+1));

figure()
plot(wp,pgram);

dowdif = diff(logdow);
figure()
plot(dowdif)


N = N-1;
pgram = 1/(2*pi*N)*abs(fft(dowdif)).^2;
pgram = pgram(2:(N/2+1));

w = 2*pi*(0:N-1)/N;
wp = w(2:(N/2+1));
figure()
plot(pgram);

%% Problem 4
clear all
close all

t = 0:99;
s = sin(2*pi*9.5/100*t);

w = 1/2*(1-cos(2*pi*(t+.5)/100));

sw = s.*w;

z = zeros(1,100);

s = [s z];
sw = [sw z];

N = length(s);
w = 2*pi*(0:N-1)/N;
wp = w(2:(N/2+1));

pgram = 1/(2*pi*N)*abs(fft(s)).^2;
pgram = 10*log10(pgram(2:(N/2+1)));
pgram(pgram<-100) = -100;
pgram1 = pgram;
figure()
plot(wp,pgram);

N = length(sw);
w = 2*pi*(0:N-1)/N;
wp = w(2:(N/2+1));

pgram = 4/(2*pi*N)*abs(fft(sw)).^2;
pgram = 10*log10(pgram(2:(N/2+1)));
pgram(pgram<-100) = -100;
figure()
plot(wp,pgram);

figure()
plot(wp,pgram,'b');
hold on
plot(wp,pgram1,'r');

legend('Boxcar','Cosine Bell')