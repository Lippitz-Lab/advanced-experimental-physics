
% insprired by Fig. 1.6 of Mössbauer Story 
% using  tfm_rmsd.m from
% https://github.com/ThFriedrich/rmsd_parameterization 
% which in turn uses
% Cao, H. X., & Peng, L. M. (1999).
% Parameterization of the temperature dependence of the Debye-Waller
% factors. Acta Crystallographica Section A: Foundations of
% Crystallography, 55(5), 926–932.
% https://doi.org/10.1107/s0108767399005176


close all
clear all


T = 10.^(1:0.01:3.5);



elem = {'Fe', 'Au',  'Ir'};
E0 = [14.3, 77,  129]; % keV

data = zeros(length(elem)+1,length(T));
data(1,:) = T;

for id = 1:length(elem)

    u = tfm_rmsd.rmsd_at_T(elem{id}, T);
    u = u(1,:);

    lambda0 = 1240 .* 10 ./ (E0(id) * 1e3); % Angstroem
    k = 2 * pi / lambda0;

    f = exp(- k.^2 * u.^2 ./ 3 );
    data(id+1,:) = f;

    loglog(T, f)
    hold on

end
legend(elem)
xlabel('Temperature (K)')
ylabel('Debye Waller factor')

data = data';

ylim([1e-2, 2])

save('data_dwf.dat', 'data', '-ascii')