close all
clear all

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


pkg load interval



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{cc}
##			\hline
##Magnetic field			  Rate of discharge ;
##between pole-pieces			   due to a rays. ;
##			\hline
##0    100 ;
##3720   66 ;
##4840   50 ;
##6500   33 ;
##7360   23 ;
##8370  11 ;
##			\hline
##		\end{tabular}
##	}
##\caption{Скорость разряда электрометра от величины магнитного поля \cite{Rutherford1903magnetic}}
##	\label{tab:DischargeH2}
##\end{table}

DataMagneticAlpha = [
0    100 ;
3720   66 ;
4840   50 ;
6500   33 ;
7360   23 ;
8370  11 ;
]

DataMagneticAlpha(:,2)  = 100 -DataMagneticAlpha(:,2)
DataMagneticAlphaErr = 1 * ones(length(DataMagneticAlpha),1)

figure
hold on
h1 = errorbar (DataMagneticAlpha(:,1),DataMagneticAlpha(:,2), DataMagneticAlphaErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);
h2 = plot(DataMagneticAlpha(:,1), DataMagneticAlpha(:,2), "-r");

set(gca, 'fontsize', 16)
grid on

xlim([ -100 10000 ])
ylim([ -2 100 ])
xlabel('H, сгсэ')
ylabel('Отклонение \alpha-лучей')

figure_name_out=strcat('MagneticDeflectionAlpha','.png')
print('-dpng', '-r300', figure_name_out), pwd

[R, P, LCI, HCI] = corrcoef(DataMagneticAlpha(:,1),DataMagneticAlpha(:,2))
textnow = strcat('R=', num2str(R(1,2)))
       ht = text(2000, 80, textnow);
       set (ht, "FontSize", 16);
