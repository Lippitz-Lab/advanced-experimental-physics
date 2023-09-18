close all
clear all

digits(200);

% ----------------------------- %
fontsize = 10;
fontname = 'Palatino';
plotwidth = 6; % [cm]
plotratio = 1.6;
% ----------------------------- %

t = -25e-15:1e-17:25e-15;
fwhm = 7e-15;
fwhm_freq = 4*log(2)/fwhm;
omega = 2*pi*3e8/800e-9;
om = 1e15:1e13:3.5e15;


%% Normal
osc = exp(-2*log(2)*(t./fwhm).^2) .* exp(i*omega*t);
figure
hold on
plot(t*1e15, abs(osc), 'k--');
plot(t*1e15, -abs(osc), 'k--');
plot(t*1e15, real(osc), 'LineWidth', 1.5, 'Color',  [0.8500    0.3250    0.0980]);
xlabel('t / fs');
ylabel('E(t)');
set(gca, 'YTick', [-1 0 1]);
xlim([-25 25]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse.svg', '-dsvg');

phase = zeros(1,length(om));
spec = exp(-2*log(2)*((om-omega)./fwhm_freq).^2);
figure
hold on
yyaxis right
plot(om/1e15, abs(spec), 'k--');
set(gca, 'YColor', 'black');
ylabel('E');
set(gca, 'YTick', [0 1]);
yyaxis left
plot(om/1e15, phase, 'LineWidth', 1.5, 'Color',  [0.8500    0.3250    0.0980]);
set(gca, 'YColor', [0.8500    0.3250    0.0980]);
ylim([-2*pi 2*pi]);
ylabel('p');
set(gca, 'YTick', [-pi 0 pi], 'YTickLabel', {'-p', '0', 'p'});
xlabel('w');
xtickformat('%.1f');
xlim([1.36 3.36]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_phase.svg', '-dsvg');

%% phi
phi = pi;
osc = exp(-2*log(2)*(t./fwhm).^2) .* exp(i*omega*t+i*phi);
figure
hold on
plot(t*1e15, abs(osc), 'k--');
plot(t*1e15, -abs(osc), 'k--');
plot(t*1e15, real(osc), 'LineWidth', 1.5, 'Color', [0.8500    0.3250    0.0980]);
xlabel('t / fs');
ylabel('E(t)');
set(gca, 'YTick', [-1 0 1]);
xlim([-25 25]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_const.svg', '-dsvg');

phasen = pi*ones(1,length(om));
spec = exp(-2*log(2)*((om-omega)./fwhm_freq).^2);
figure
hold on
yyaxis right
plot(om/1e15, abs(spec), 'k--');
set(gca, 'YColor', 'black');
ylabel('E');
set(gca, 'YTick', [0 1]);
yyaxis left
plot(om/1e15, phasen, 'LineWidth', 1.5, 'Color',  [0.8500    0.3250    0.0980]);
set(gca, 'YColor', [0.8500    0.3250    0.0980]);
ylim([-2*pi 2*pi]);
ylabel('p');
set(gca, 'YTick', [-pi 0 pi], 'YTickLabel', {'-p', '0', 'p'});
xlabel('w');
xtickformat('%.1f');
xlim([1.36 3.36]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_const_phase.svg', '-dsvg');

%% phi'
phip=10e-15;
t0 = 10e-15;
osc = exp(-2*log(2)*((t-t0)./fwhm).^2) .* exp(i*omega*(t-t0));
figure
hold on
plot(t*1e15, abs(osc), 'k--');
plot(t*1e15, -abs(osc), 'k--');
plot(t*1e15, real(osc), 'LineWidth', 1.5, 'Color', [0.8500    0.3250    0.0980]);
xlabel('t / fs');
ylabel('E(t)');
set(gca, 'YTick', [-1 0 1]);
xlim([-25 25]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_lin.svg', '-dsvg');

phasen = phip*(om-omega);
spec = exp(-2*log(2)*((om-omega)./fwhm_freq).^2);
figure
hold on
yyaxis right
plot(om/1e15, abs(spec), 'k--');
set(gca, 'YColor', 'black');
ylabel('E');
set(gca, 'YTick', [0 1]);
yyaxis left
plot(om/1e15, phasen, 'LineWidth', 1.5, 'Color',  [0.8500    0.3250    0.0980]);
set(gca, 'YColor', [0.8500    0.3250    0.0980]);
ylim([-2*pi 2*pi]);
ylabel('p');
set(gca, 'YTick', [-pi 0 pi], 'YTickLabel', {'-p', '0', 'p'});
xlabel('w');
xtickformat('%.1f');
xlim([1.36 3.36]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_lin_phase.svg', '-dsvg');

%% phi''
phipp = 50e-30;
fwhm_freq = 4*log(2)/fwhm;
a = -2*log(2)/fwhm_freq^2 - 1/2*i*phipp;
b = -2*log(2)/fwhm_freq^2;
osc = sqrt(pi/a)/sqrt(pi/b)*exp(t.^2/(4*a)) .* exp(i*omega*t);
figure
hold on
plot(t*1e15, abs(osc), 'k--');
plot(t*1e15, -abs(osc), 'k--');
plot(t*1e15, real(osc), 'LineWidth', 1.5, 'Color', [0.8500    0.3250    0.0980]);
ylim([-1 1]);
xlabel('t / fs');
ylabel('E(t)');
set(gca, 'YTick', [-1 0 1]);
xlim([-25 25]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_quad.svg', '-dsvg');

phasen = 1/2*phipp*(om-omega).^2;
spec = exp(-2*log(2)*((om-omega)./fwhm_freq).^2);
figure
hold on
yyaxis right
plot(om/1e15, abs(spec), 'k--');
set(gca, 'YColor', 'black');
ylabel('E');
set(gca, 'YTick', [0 1]);
yyaxis left
plot(om/1e15, phasen, 'LineWidth', 1.5, 'Color',  [0.8500    0.3250    0.0980]);
set(gca, 'YColor', [0.8500    0.3250    0.0980]);
ylim([-2*pi 2*pi]);
ylabel('p');
set(gca, 'YTick', [-pi 0 pi], 'YTickLabel', {'-p', '0', 'p'});
xlabel('w');
xtickformat('%.1f');
xlim([1.36 3.36]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_quad_phase.svg', '-dsvg');


%% phi'''
phippp = 100e-45;
fwhm_freq = 4*log(2)/fwhm;
tau0 = (phippp/2)^(1/3);
phi3 = 2*(log(2))^2*phippp;
deltatau = tau0;
tau = fwhm^4/(16*phi3);
tau12 = phi3/(fwhm^2);
osc = sqrt(pi/(2*log(2)))*fwhm/tau0*airy((tau-t)/deltatau).*exp(log(2)/2*(2/3*tau-t)/tau12).*exp(i*omega*t);
figure
hold on
plot(t*1e15, abs(osc), 'k--');
plot(t*1e15, -abs(osc), 'k--');
plot(t*1e15, real(osc), 'LineWidth', 1.5, 'Color', [0.8500    0.3250    0.0980]);
ylim([-1 1]);
xlabel('t / fs');
ylabel('E(t)');
set(gca, 'YTick', [-1 0 1]);
xlim([-25 25]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_cub.svg', '-dsvg');

phasen = 1/6*phippp*(om-omega).^3;
spec = exp(-2*log(2)*((om-omega)./fwhm_freq).^2);
figure
hold on
yyaxis right
plot(om/1e15, abs(spec), 'k--');
set(gca, 'YColor', 'black');
ylabel('E');
set(gca, 'YTick', [0 1]);
yyaxis left
plot(om/1e15, phasen, 'LineWidth', 1.5, 'Color',  [0.8500    0.3250    0.0980]);
set(gca, 'YColor', [0.8500    0.3250    0.0980]);
ylim([-2*pi 2*pi]);
ylabel('p');
set(gca, 'YTick', [-pi 0 pi], 'YTickLabel', {'-p', '0', 'p'});
xlabel('w');
xtickformat('%.1f');
xlim([1.36 3.36]);
plotSettings(fontsize, fontname, plotwidth, plotratio);
print('7fs_pulse_cub_phase.svg', '-dsvg');