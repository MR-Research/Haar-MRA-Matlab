%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

function energy_vect = energy_levels(a,d,noLevels)
    energy_vect = zeros(noLevels,2);
    complete = energy_magnitude_aproximation(a,d,0,noLevels);
    for i = 1:noLevels
        energy_vect(i,1) = (energy_magnitude_aproximation(a,d,i,noLevels) * 100)/complete;
        energy_vect(i,2) = (energy_magnitude_details(a,d,i,noLevels) * 100)/complete;
    end
end