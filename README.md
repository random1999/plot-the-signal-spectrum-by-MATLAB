# plot-the-signal-spectrum-by-MATLAB
Plot the bilateral complex number spectrum and unilateral real number spectrum (including amplitude spectrum and phase spectrum) of the signal, as well as the power spectral density and autocorrelation function using matlab.

Pay attention to the following key points when using:
1. The sampling frequency fs must follow Nyquist's sampling law, that is, it should be greater than twice the highest frequency of the signal; otherwise, spectral aliasing will occur.
2. The sampling duration T affects the frequency resolution. Frequency resolution =1/ sampling duration. When the frequency of the signal is not an integer multiple of the frequency resolution, the fence phenomenon occurs, causing the phase spectrum to become chaotic.
3. The total number of sampling points = sampling frequency * sampling duration, which is preferably an integer power of 2 to enhance the computational efficiency of the FFT algorithm.
