clc;
clear;
close all;

% Boundary temperatures
T_left = 100;   % degree C
T_right = 40;   % degree C

% Coefficient matrix [A]
A = [ 2  -1   0;
      1  -2   1;
      0   1  -2 ];

% RHS vector [B]
B = [T_left;
     0;
    -T_right];

% Solution using matrix division (system of linear equations)
T = A\B;

disp('Temperatures at nodes:')
disp(['T1 = ', num2str(T(1)), ' deg C'])
disp(['T2 = ', num2str(T(2)), ' deg C'])
disp(['T3 = ', num2str(T(3)), ' deg C'])

% Eigenvalue analysis
[V,D] = eig(A);

disp('Eigenvalues of conduction matrix:')
disp(diag(D))

disp('Eigenvectors:')
disp(V)

% Plot temperature distribution along rod
x = [0 1 2 3 4]; 
T_plot = [T_left; T(1); T(2); T(3); T_right];

figure;
plot(x, T_plot,'-o','LineWidth',2)
grid on
xlabel('Position along rod')
ylabel('Temperature (°C)')
title('1D Heat Conduction Temperature Distribution')

% 2D Rectangle Temperature Profile 
x = linspace(0,4,5);      
y = linspace(0,1,60);     

% Temperature distribution along rod (USE solved values)
T_line = [T_left T(1) T(2) T(3) T_right];

% Create 2D temperature field
[X,Y] = meshgrid(x,y);
Z = repmat(T_line,length(y),1);

% Plot 2D 
figure
pcolor(X,Y,Z)
shading interp
colormap(jet)     
colorbar

xlabel('Rod Length')
ylabel('Width')
title('2D Temperature Distribution')