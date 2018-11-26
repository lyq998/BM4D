function [Z, sigmaEst, PSNR, SSIM] = BM4D_cubeWrapper(Z, output, verbose)

    % Has to be double rather than 8-bit integer
    Z = double(Z);

	% simplified version of http://dx.doi.org/10.1016/j.optcom.2012.10.053
	% without the Wavelet decomposition (Morlet)
	Z = Z/max(Z(:));

	% Regularize with small epsilon
	epsilon = 0.0001;

	% Log transform
	Z = log10(Z+epsilon);
		
	% Denoise	
    [Z, sigmaEst, PSNR, SSIM] = denoise_BM4Dwrapper(Z, 0);

	% Transform back to linear
	Z = 10 .^ Z;

	% this could be more robust
	isNotZero = ~Z == 0;

	% use the full dynamic range
	minValue = min(min(min(Z(isNotZero))));        
	Z = Z - minValue;
	Z(Z < 0) = 0; % clip possible negative values to zero
		
	% normalize
	maxValue = max(Z(:));
	Z = Z / maxValue;

	% convert to uint16
    if strcmp(output, 'uint16')
        Z = uint16(Z*65535);
    end