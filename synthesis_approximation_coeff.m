%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

function filter_mat_complete = synthesis_approximation_coeff(no_samples,level,h_coef,a2,d)
    size_coeff = no_samples / 2^(level);
    size_prev_level = no_samples / 2^(level-1);
    % Create the ones and zeros matrix and multiply with the filter coefficients to obtain the filter matrix
    mat_aprox = one_matrix_filter(size_prev_level,size_prev_level,0);
    mat_detail = one_matrix_filter(size_prev_level,size_prev_level,1);
    filter_mat_aprox = h_coef * mat_aprox;
    filter_mat_detail = h_coef * mat_detail;
    % Extract the value of the aproximation coefficients from next level
    approximation = a2(1:size_coeff,1);
    % Multiply filter with previous approximation (the matrix is transposed)
    filter_coeff = (filter_mat_aprox' * approximation) + (filter_mat_detail' * d(1:size_coeff,1));
    x = size(filter_coeff, 1);
    y = size(filter_coeff, 1);
    % Concatenate the matrix to be the same size as the array a
    filter_mat_complete = [filter_coeff; zeros(no_samples-x, 1)];
end