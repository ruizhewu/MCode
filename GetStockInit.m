%% SinaYahooDataTest
% Grap Price Data and Draw Pic
%
% 05/05/2017
%% A Little Clean Work
tic;
clear;
clc;
close all;
format compact;
%E = hist_stock_data('05062016','05042017','WB');
%save('C:\Mcode\june10','E');
load('C:\Mcode\june10');
Open = E.Open;
High = E.High;
Low = E.Low;
Close = E.Close;


Open=Open(end:-1:1);
High=High(end:-1:1);
Low=Low(end:-1:1);
Close=Close(end:-1:1);

figure('name','Original Stock Price');
candle(High,Low,Close,Open);
%candlesticks(Open,High,Low,Close);
xlim( [0 length(Open)+1] );
title('Weibo Origin');

figure('name','Close Price Smooth');
hold on;
h1=plot(Close);
X=1:1:length(Close);
c2 = polyfit(X,Close' , 2);
d2 = polyval(c2, X, 1);
h2=plot(X, d2, 'r'); 


c3 = polyfit(X,Close' , 3);
d3 = polyval(c3, X, 1);
h3=plot(X, d3, 'g'); 


c6 = polyfit(X,Close' , 6);
d6 = polyval(c6, X, 1);
h6=plot(X, d6, 'b'); 

hold off;
%candle(High,Low,Close,Open);
%candlesticks(Open,High,Low,Close);
xlim( [0 length(Open)+1] );
legend([h1,h2, h3, h6],'O', '2', '3','6','Location','Southwest');
title('Weibo Close Smooth');

toc;  