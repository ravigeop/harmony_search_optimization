clc; clear; close all;
% Define the range for plotting
x1 = linspace(-5, 5, 100);
x2 = linspace(-5, 5, 100);
[X1, X2] = meshgrid(x1, x2);
% Number of decision variables
n = 2;

% Ackley's Function
Z_ackley = -20 * exp(-0.2 * sqrt((X1.^2 + X2.^2)/n)) - exp((cos(2*pi*X1) + cos(2*pi*X2))/n) + 20 + exp(1);

% Define the range of x1 and x2
% x1 = linspace(-10, 10, 100);
% x2 = linspace(-10, 10, 100);

[X1, X2] = meshgrid(x1, x2);

% Compute the Easom function values
Z = -cos(X1) .* cos(X2) .* exp(-(X1 - pi).^2 - (X2 - pi).^2);
% Weierstrass Function
a = 0.5;
b = 3;
K = 20;
Z_weierstrass = zeros(size(X1));
for i = 1:numel(X1)
    Z_weierstrass(i) = weierstrass([X1(i); X2(i)], a, b, K);
end

% Rastrigin's Function
Z_rastrigin = 20 + (X1.^2 - 10 * cos(2 * pi * X1)) + (X2.^2 - 10 * cos(2 * pi * X2));

% Rosenbrock's Function
Z_rosenbrock = 100 * (X2 - X1.^2).^2 + (1 - X1).^2;


% Sphere Function
Z_sphere = X1.^2 + X2.^2;

% Plotting
figure;

% Ackley's Function
subplot(2, 3, 1);
surf(X1, X2, Z_ackley);
title('Ackley Function');
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
colormap(jet);   % Choose a colormap (e.g., winter)
shading interp;     % Interpolate colors for smooth shading
lighting gouraud;   % Enable gouraud lighting for better visibility
colorbar;           % Add color bar for reference

% Griewank's Function
subplot(2, 3, 2);
surf(X1, X2, Z);
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
title('Easom Function');
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
colormap(jet);     % Choose another colormap (e.g., cool)
shading interp;     % Interpolate colors for smooth shading
lighting gouraud;   % Enable gouraud lighting for better visibility
colorbar;           % Add color bar for reference

% Weierstrass Function
subplot(2, 3, 3);
surf(X1, X2, Z_weierstrass);
title('Weierstrass Function');
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
colormap(jet);      % Choose another colormap (e.g., hot)
shading interp;     % Interpolate colors for smooth shading
lighting gouraud;   % Enable gouraud lighting for better visibility
colorbar;           % Add color bar for reference


% Rastrigin's Function
subplot(2, 3, 4);
surf(X1, X2, Z_rastrigin);
title('Rastrigin Function');
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
colormap(jet);      % Choose another colormap (e.g., jet)
shading interp;     % Interpolate colors for smooth shading
lighting gouraud;   % Enable gouraud lighting for better visibility
colorbar;           % Add color bar for reference

% Rosenbrock's Function
subplot(2, 3, 5);
surf(X1, X2, Z_rosenbrock);
title('Rosenbrock Function');
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
colormap(jet);     % Choose another colormap (e.g., pink)
shading interp;     % Interpolate colors for smooth shading
lighting gouraud;   % Enable gouraud lighting for better visibility
colorbar;           % Add color bar for reference


% Sphere Function
subplot(2, 3, 6);
surf(X1, X2, Z_sphere);
title('Sphere Function');
xlabel('x1');
ylabel('x2');
zlabel('f(x1, x2)');
colormap(jet);   % Choose another colormap (e.g., parula)
shading interp;     % Interpolate colors for smooth shading
lighting gouraud;   % Enable gouraud lighting for better visibility
colorbar;           % Add color bar for reference

% Improve layout
set(gcf, 'Position', [100, 100, 1200, 800]);  % Resize figure window

% Improve the viewing angle
view(-30, 30);  % Adjust viewing angle for better visualization

% Helper function for Weierstrass
function z = weierstrass(x, a, b, K)
    n = length(x);
    term1 = 0;
    for i = 1:n
        sum1 = 0;
        for k = 0:K
            sum1 = sum1 + a^k * cos(2 * pi * b^k * (x(i) + 0.5));
        end
        term1 = term1 + sum1;
    end
    
    term2 = 0;
    for k = 0:K
        term2 = term2 + a^k * cos(2 * pi * b^k * 0.5);
    end
    
    z = term1 - n * term2;
end
