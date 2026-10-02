close all
clear all

dirroot ='D:\Users\Public\Documents\ST\2026\T\'
dirroot ='D:\ST\2026\T\'
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

OxfordBlue = [0, .33, .71]
RoyalMail = 4.58*[0.218, .032, 0.042]
Pantone = 3*[0.128, 0.140, 0.036]


##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|}
##			\hline
##			Substance  Range 0$^{\circ}$ C  Initial Velocity  Transformation  Half-value;
##			  $10^9$ cm/sec  const Period ;
##			\hline
##			Uranium  2.58  1.51  $4.6 \times 10^{-18}$  $5\times10^9$ years ;
##			Ionium   2.84  1.56     ;
##			Radium  3.13  1.61  $1.1 \times 10^{-11}$  2000 years  ;
##			Ra Emanation  3.94  1.74  $2.085 \times 10^{-16}$  3.85 days ;
##			Radium A  4.50  1.81  $3.85 \times 10^{3}$  3.0 min ;
##			Radium C  6.57  2.06     ;
##			Polonium   3.58  1.68   $5.6 \times 10^{-8}$  143 days ;
##			\hline
##			Radioactinium  4.55  1.82  $4.1 \times 10^{-7}$ 19.5 days ;
##			Actinium X  4.17  1.77   $7.6 \times 10^{-7}$  10.5 days ;
##			Act Emanation  5.40  1.93  $1.8 \times 10^{-1}$  3.9 sec ;
##			Actinium A  6.16  2.02  350  $\frac{1}{300}$ sec ;
##			Actinium C  5.12  1.90  $5.4 \times 10^{3}$  2.15 min ;
##			\hline
##		\end{tabular}
##	}
##	\caption{Данные по данным по $\alpha$-частицам от различных источников. Гейгер-Неттол 1911 г. \cite{GeigerNuttal911}}
##	\label{tab:1911 Geiger Nuttal Table II2}
##\end{table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataDistanceLambda = [
% U-Ra
  2.58  1.51  4.6*10^(-18); % Uranium
%2.84  1.56   NaN NaN  ;  % Ionium
3.13  1.61  1.1*10^(-11); % Radium
3.94  1.74  2.085*10^(-6); % Ra Emanation
4.50  1.81  3.85*10^(3); % Radium A
%6.57  2.06    NaN NaN ; % Radium C
3.58  1.68   5.6*10^(-8); % Polonium
% Ac
4.55  1.82  4.1*10^(-7); % Radioactinium
4.17  1.77   7.6*10^(-7); % Actinium X
5.40  1.93  1.8*10^(-1) ; % Act Emanation
6.16  2.02  350  ; % Actinium A
5.12  1.90  5.4*10^(-3) % Actinium C
]


err = [0.01 0.1 0.1 0.1 0.01 0.01]
num = log10(DataDistanceLambda(:,1))
val = log10(DataDistanceLambda(:,3))
URa=[1:5]
Ac=[6:10]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
hold on
h1 = plot(num(URa), val(URa),"sb");
set (h1, 'linewidth', 1);
set (h1, 'color', OxfordBlue);
h2 = plot(num(Ac), val(Ac),"sr");
set (h2, 'linewidth', 1);
set (h2, 'color', RoyalMail);

lgd12 = legend([h1 h2 ], ...
  {'U-RA', 'Ac'})
set(lgd12, 'location', 'northwest')
set(lgd12, 'fontsize', 16)



set(gca, 'fontsize', 16)
grid on

xlim([ min(num)-0.01 max(num)+0.01])
xticks([ 0.4 : 0.1: 0.8 ])
xlabel('lg пробега')
ylabel('lg константы распада')

Rnumval = corrcoef(num(URa), val(URa))
textnow = strcat('R=', num2str(Rnumval (1,2)))
       ht = text(0.45, -5, textnow);
       set (ht, "FontSize", 16);

Rnumval = corrcoef(num(Ac), val(Ac))
textnow = strcat('R=', num2str(Rnumval (1,2)))
       ht = text(0.65, -10, textnow);
       set (ht, "FontSize", 16);

figure_name_out=strcat('1911 GeigerNuttal','.png')
print('-dpng', '-r300', figure_name_out), pwd


