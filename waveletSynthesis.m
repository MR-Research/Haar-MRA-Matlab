%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

function a2 = waveletSynthesis(noLevels,no_samples,sampled_signal,a,d,currentLevel)
    sup_val = @(x) sqrt(1/x);
    % For the Haar transform the number of coefficients is 2. h = (1/sqrt(2)),(1/sqrt(2)) and h1 = (1/sqrt(2)), -(1/sqrt(2))
    size_coef = 2;
    h_coef = 1 / sqrt(2);
    % Zeros matrices with approximation coefficients and wavelets coefficients
    a2 = zeros(no_samples,noLevels+1);
    d2 = zeros(no_samples,noLevels+1);
    a2(1,noLevels+1) = a;
    % Obtain coefficients for each level
    for i = currentLevel+1:-1:1
        if i ~= noLevels+1
            support =  2^i;
            % Obtain the value for the support if the approximated signals is reconstructed with the coeff
            val_support = sup_val(support);
            % Calculate the coefficients
            a2(:,i) = synthesis_approximation_coeff(no_samples,i,h_coef,a2(:,i+1),d(:,i+1));
            %return a2
        end
    end
end