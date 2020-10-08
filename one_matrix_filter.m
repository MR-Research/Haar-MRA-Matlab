%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

% if wav is 1 it would return the matrix with one and - one
function mat = one_matrix_filter(size,size_coef,wav)
    rows = size/2;
    mat = zeros(rows,size);
    cont = 1;
    for i = 1:rows
        for j = 1: size_coef/rows
            if wav == 1 && mod(j,2) == 0
                mat(i,cont) = -1;
                cont = cont + 1;
            else
                mat(i,cont) = 1;
                cont = cont + 1;
            end
        end
    end
end