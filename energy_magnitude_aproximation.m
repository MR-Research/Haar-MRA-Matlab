%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

function sum = energy_magnitude_aproximation(a,d,currentLevel,noLevels)
    x = size(a);
    y = size(a);
    sum = 0;
    for i = 1:x
        sum = sum + a(i,currentLevel+1)^2;
    end
end