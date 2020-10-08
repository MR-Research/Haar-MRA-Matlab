%% Wavelet transform using Multi Resolution Analysis
% Created by Gabriel-Solana and David-Cantu in 2020

% Execute the main program
%% Function declaration
no_samples = 1024;
noLevels = log2(no_samples);
f = @(x) 2*(x^2) - 3*x + 1;
fx1 = [];
% discrete interval calculation
for i = 1 : no_samples
    fx1 = [fx1 f(i)];
end
% Doppler function
[fx2,noisyx] = wnoise('doppler',10,7);

% Obtain the samples from the function and plot it
sampled_signal = fx2;
%% Perform wavelet analysis
[a,d] = waveletAnalysis(noLevels,no_samples,sampled_signal);

%% Perform wavelet synthesis
a_reconstruction = waveletSynthesis(noLevels,no_samples,sampled_signal,a(1,noLevels+1),d,noLevels);

%% Obtain the remaining energy on the approximation
energy_vect = energy_levels(a,d,noLevels);

%% Reconstruction of aproximations
[a_recon,d_recon] = get_aproximations(a,d,no_samples,noLevels);

% Plotting
%% Plot signal
figure;
hold on;
plot(1:no_samples,sampled_signal);
grid on
title("Function to be analyzed using MRA");
xlabel("Sample");
ylabel("Magnitude");
xlim([1,1050]);
hold off;

%% Plot approximations
figure;
hold on;
for i = 1 : noLevels
    subplot(5,2,i);   
    hold on
    % plot([1:no_samples/(2^(i-1))],normalize([a(1:no_samples/(2^i),i+1); d(1:no_samples/(2^i),i+1)], 'range'));
    normalized_coeff = normalize([a(1:no_samples/(2^i),i+1); d(1:no_samples/(2^i),i+1)], 'range');
    L(1) = plot([1:no_samples/(2^(i))], normalized_coeff(1:no_samples/(2^(i))), 'b');
    plot([no_samples/(2^(i)):no_samples/(2^(i))+1], [normalized_coeff(no_samples/(2^(i))) normalized_coeff(1+no_samples/(2^(i)))], '--k')
    L(2) = plot([no_samples/(2^(i))+1:no_samples/(2^(i-1))], normalized_coeff(no_samples/(2^(i))+1:no_samples/(2^(i-1))), 'r');
    hold off
    xlabel('Sample number')
    ylabel('Normalized Coefficient')  
    ylim([-0.5 1.5]);
    legend(L, {strcat('Approximation ',int2str(i)), strcat('Detail ',int2str(i))})
    grid on
end 
sgtitle("Wavelet and Scaling Coefficients for Signal Decomposition")
hold off;
