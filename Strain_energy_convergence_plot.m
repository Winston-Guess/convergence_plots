clear all;
clc;
close all;

width = 6;     % Width in inches
height = 5;    % Height in inches
alw = 1.25;    % AxesLineWidth
fsz = 14;      % Fontsize
lw = 1.5;      % LineWidth
msz = 8;       % MarkerSize

% Set the defaults for saving/printing to a file
set(0,'defaultFigureInvertHardcopy','on'); % This is the default anyway
set(0,'defaultFigurePaperUnits','inches'); % This is the default anyway
defsize = get(gcf, 'PaperSize');
left = (defsize(1)- width)/2;
bottom = (defsize(2)- height)/2;
defsize = [left, bottom, width, height];
set(0, 'defaultFigurePaperPosition', defsize)


% varying viscosity
var1 = struct2array(load('Strain_energy_data.mat'));
x = var1(:,2);
y = var1(:,1);

figure(1)

loglog(x,y,'-s', 'LineWidth', lw);
hold on;
ylim([1.0E-14,1.0E-12]);
xlim([1.0E-11,1.0E-9]);
ylabel('Strain Energy (J)','FontSize',12,'FontWeight','light')
xlabel('Average Element Size(m^2)','FontSize',12,'FontWeight','light')
grid on
set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
print('Strain_energy_conv_plot', '-dpng', '-r300');