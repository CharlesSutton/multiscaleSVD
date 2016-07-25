%This script illustrates the multiscale svd technique on the noisy sphere
%just as it is described in the section 2.1 of the paper "multiscale estimation of intrinsic
%dimensionality of data sets" Maggioni and al. 

%initialization
rng(12345)
k = 9;          %intrinsic dimension
D = 100;         % ambiant dimension
n = 1000 ;       % nb of samples
sigma = 0.01;    % noise std (var = std ^ 2)
y = k+5;         % nb of eigenvalues displayed in the plot
radius = 0:0.04:3     ; % r to perform multiscale SVD


%generating corrupted data (noisy sphere)
noisy_data = generate_sphere(k,D,n,sigma);

Eeigenval = [];

disp('Multiscale in progress ...')
for r = radius
    Eeigenval = [Eeigenval, local_svd(noisy_data,r)];
end

Eeigenval = Eeigenval/sqrt(n); %rescale 

disp('Plotting')
figure
for i = 1:y
    plot(radius,Eeigenval(i,:))
    hold on
end