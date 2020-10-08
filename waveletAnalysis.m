%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

% Wavelet Analysis Function

function [a,d] = waveletAnalysis(noLevels,no_samples,sampled_signal)
    sup_val = @(x) sqrt(1/x);
    % For the Haar transform the number of coefficients is 2. h = (1/sqrt(2)),(1/sqrt(2)) and h1 = (1/sqrt(2)), -(1/sqrt(2))
    size_coef = 2;
    h_coef = 1 / sqrt(2);
    % Zeros matrices with approximation coefficients and wavelets coefficients
    a = zeros(no_samples,noLevels+1);
    d = zeros(no_samples,noLevels+1);
    % First column of the matrix is the sampled signal or level 0 of decomposition (julia starts the indexes in 1 instead of 0)
    a = [];
    a(:,1) = sampled_signal';
    % Obtain coefficients for each level
    for i = 1:noLevels+1
        if i ~= noLevels+1
            support =  2^i;
            % Obtain the value for the support if the approximated signals is reconstructed with the coeff
            val_support = sup_val(support);
            % Calculate the coefficients
            a(:,i+1) = approximation_coeff(no_samples,i,h_coef,a);
            d(:,i+1) = wavelet_coeff(no_samples,i,h_coef,a);
        end
    end
end