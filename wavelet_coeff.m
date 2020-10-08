%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

% function for wavelet
function filter_mat_complete = wavelet_coeff(no_samples,level,h_coef,a)
    size_coeff = no_samples / 2^(level);
    size_prev_level = no_samples / 2^(level-1);
    % Create the ones and zeros matrix and multiply with the filter coefficients to obtain the filter matrix
    mat = one_matrix_filter(size_prev_level,size_prev_level,1);
    filter_mat = h_coef * mat;
    % Extract the value of the aproximation coefficients from previous level
    approximation = a(1:size_prev_level,level);
    % Multiply filter with previous approximation
    filter_coeff = filter_mat*approximation;
    % Concatenate the matrix to be the same size as the array a
    filter_mat_complete = [filter_coeff; zeros(no_samples-size_coeff, 1)];
end