# plot-the-signal-spectrum-by-MATLAB
Plot the bilateral complex number spectrum and unilateral real number spectrum (including amplitude spectrum and phase spectrum) of the signal, as well as the power spectral density and autocorrelation function using matlab.
Pay attention to the following key points when using:
1. The sampling frequency fs must follow Nyquist's sampling law, that is, it should be greater than twice the highest frequency of the signal; otherwise, spectral aliasing will occur.
2. The sampling duration T affects the frequency resolution. Frequency resolution =1/ sampling duration. When the frequency of the signal is not an integer multiple of the frequency resolution, the fence phenomenon occurs, causing the phase spectrum to become chaotic.
3. The total number of sampling points = sampling frequency * sampling duration, which is preferably an integer power of 2 to enhance the computational efficiency of the FFT algorithm.




使用matlab绘制信号的双边复数频谱和单边实数频谱( 包括幅度谱和相位谱 )，以及功率谱密度和自相关函数。
使用时注意以下要点：
1. 采样频率fs需遵照奈奎斯特采样定律，即大于信号最高频率的2倍，否则会发生频谱混叠。
2. 采样时长T影响频率分辨率，频率分辨率=1/采样时长，当信号的频率不为频率分辨率的整数倍时，会发生栅栏现象，导致相位谱变得混乱。
3. 总采样点数=采样频率*采样时长，其最好为2的整数次幂，以提高FFT算法的计算效率。
