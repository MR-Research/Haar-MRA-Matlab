%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

function sum = energy_magnitude_details(a,d,currentLevel,noLevels)
    x = size(a);
    y = size(a);
    sum = 0;
    for l = 2:currentLevel+1
        for i = 1:x
            sum = sum + d(i,l)^2;
        end
    end
end