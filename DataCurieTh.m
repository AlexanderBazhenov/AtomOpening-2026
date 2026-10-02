dirroot ='D:\Users\Public\Documents\ST\2026\T\'
##dirki = 'e:\Users\Public\Documents\ST\2024\T\kinterval-0.0.1'
##dirOld =  'e:\Users\Public\Documents\ST\2023\T\'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     START    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath(dirroot)
%addpath(dirOld)
cd(dirroot)
pwd


% 2026-09-28
% U-Th Curie
##			 Тольщ. слоя  \\
##			Вещество      в мм  $i \times 10^{11}$ \\
##			\hline
##			Окись  тория   0,25   2,2 \\
##			 0,5   2,5 \\
##			 2,5   4,7 \\
##			 3,0   5,5 (в среднем) \\
##			 6,0   5,5 (от 3,7 до 7,3) \\

pkg load interval

ThData =  [
0.25  2.2 ;
0.5   2.5 ;
2.5   4.7 ;
3.0   5.5 ;
##6.0   [3.7 , 7.3]
6.0   5.5
]

ThDataErr = [0.1 0.1 0.1 0.3 0.9]


OxfordBlue = [0, .33, .71]
RoyalMail = 4.58*[0.218, .032, 0.042]
Pantone = 3*[0.128, 0.140, 0.036]
%
figure
hold on
h1 = errorbar (ThData(:,1), ThData(:,2), ThDataErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlabel('t, mm')
ylabel('I, $10^{-11}$')

figure_name_out=strcat('ThoriumCurrentThickness','.png')
print('-dpng', '-r300', figure_name_out), pwd
