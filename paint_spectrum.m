% ======================================================================================
% 作者： cx
% 时间： 2025-05-08
% 实现： 绘制信号的双边复数频谱、单边实数频谱、功率谱密度和自相关函数
% ======================================================================================
clear;clc;close all;
fs=128;                        %设置采样频率(单位:Hz)，需要大于信号最高频率的2倍
T=4;                           %设置采样时长(单位:秒)，其影响频率分辨率，频率分辨率=1/采样时长
t=-T/2:1/fs:T/2-1/fs;          %时间设为[-T/2,T/2]
yt=3*sin(2*pi*5.5*t)+5*sin(2*pi*30*t+pi/3);            %设置时域信号
% yt=3*sin(2*pi*5.5*t)+5*sin(2*pi*30*t+pi/3)+2*randn(size(t));          %带噪声的时域信号
% yt=zeros(size(t));yt(t==0)=1e3;                      %单位冲激信号 
% yt=zeros(size(t));yt(t>0)=1;                         %单位阶跃信号
% yt=zeros(size(t));yt(abs(t)<0.1)=1;                  %门信号
% yt=sinc(20*t);                                       %抽样信号
figure;
plot(t,yt);                    %绘制时域曲线
title('时域');      
xlabel('t/秒');              
ylabel('y(t)');
paintSpectrum_Complex(yt,T);     %绘制双边复数频谱
paintSpectrum_Real(yt,T);        %绘制单边实数频谱
paintPowerDensitySpectrum(yt,fs);%绘制功率谱密度
paintXcorrelation(yt,fs);        %绘制自相关函数


%% 函数定义===============================================================
function paintSpectrum_Complex(yt,T) 
%绘制双边复数频谱
%yt：时域信号
%T： 采样时长
N=length(yt);               %计算采样点数
yw=fftshift(fft(yt,N))./N;  %fft运算
fs=N/T;                     %计算采样频率
if (mod(N,2)==0)            %若采样点为偶数
  f=(-N/2:N/2-1)/N*fs;      %频率范围为[-fs/2,fs/2]
else                        %若采样点为奇数
  f=(-(N-1)/2:(N+1)/2-1)/N*fs;
end
figure;
subplot(2,1,1);
plot(f,abs(yw));
xlabel('f/Hz');ylabel('y(w)幅度');title('双边复数频谱—幅度');
subplot(2,1,2);
yw(abs(yw)./max(abs(yw))< 1e-6) = 0;     %删除微小幅度值
plot(f,angle(yw)./pi.*180);
xlabel('f/Hz');ylabel('y(w)相位 /°');title('双边复数频谱—相位'); 
end


function paintSpectrum_Real(yt,T) 
%绘制单边实数频谱
%yt：时域信号
%T： 采样时长
N=length(yt);               
yw=fftshift(fft(yt,N))./N;  
fs=N/T;     
if (mod(N,2)==0)                  
  f=(0:N/2-1)/N*fs;        %频率范围为[0,fs/2]
  yw=2.*yw(N/2+1:end);     %实数频谱的幅度为复数频谱的2倍
else 
  f=(0:(N-1)/2-1)/N*fs;
  yw=2.*yw((N-1)/2+1:end-1);
end
figure;
subplot(2,1,1);
plot(f,abs(yw));
xlabel('f/Hz');ylabel('y(w)幅度');title('单边实数频谱—幅度');
subplot(2,1,2);
yw(abs(yw)./max(abs(yw))< 1e-6) = 0;
plot(f,angle(yw)./pi.*180);
xlabel('f/Hz');ylabel('y(w)相位 /°');title('单边实数频谱—相位'); 
end


function paintPowerDensitySpectrum(yt,fs)
%绘制信号的功率谱密度
N=length(yt); 
window=boxcar(N);   %矩形窗 
% window=hamming(N);  %海明窗
% window=blackman(N); %blackman窗 
[P_d,f]=periodogram(yt,window,N,fs);
figure;
plot(f,10*log10(P_d)); 
xlabel('f/Hz');ylabel('功率密度 dBW/Hz');title('功率谱密度'); 
end


function paintXcorrelation(yt,fs)
%绘制信号的自相关函数
[c,lags] = xcorr(yt,'coeff');
figure;
plot(lags./fs,c);
xlabel('t/秒');ylabel('相关性');title('归一化自相关函数'); 
end
