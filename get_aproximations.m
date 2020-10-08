%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

function [a_recon,d_recon] = get_aproximations(a,d,no_samples,noLevels)
    sup_val = @(x) sqrt(1/x);
    x = size(a,1);
    a_recon = zeros(x,noLevels);
    d_recon = zeros(x,noLevels);
    for i = 1:noLevels
        a_1 = zeros(no_samples, 1);
        support =  2^i;
        % Obtain the value for the support if the approximated signals is reconstructed with the coeff
        val_support = sup_val(support);
        sp = ones(support, 1);
        sp = sp .* val_support;
        sp_d = zeros(support, 1);
        for z = 1:support/2
            sp_d(z) = val_support;
        end

        for z = (support/2)+1:support
            sp_d(z) = -val_support;
        end

        new = sp * a(1,i+1);
        new_d = sp_d * d(1,i+1);
        for j = 2:no_samples/(2^i)
            hlp = sp * a(j,i+1);
            hlp_d = sp_d * d(j,i+1);
            new = [new; hlp];
            new_d = [new_d; hlp_d];
        end
        a_recon(:,i) = new;
        d_recon(:,i) = new_d;
    end
end
