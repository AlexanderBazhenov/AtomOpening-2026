close all
clear all

% FTI
dirroot ='D:\Users\Public\Documents\ST\2026\T\'
% Home
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
##	{\small
##		\begin{tabular}{c|c|c|c|c}
##			\hline
##			& & $\bar{\varepsilon}$  Schwankung & & $\varepsilon$  Schwankung \\
##			Blende & $i$ stat. & Proz. & $\bar{\varepsilon}\sqrt{i} \cdot 10^2$ &  in Strom (stat.)\\
##			\hline
##			1 & 0,04 & 1,28 & 25,6 & 0,0005 \\
##			2 &	0,22 & 0,57 & 26,7 & 0,0013	 \\
##			3 & 0,58 & 0,38 & 29,2 & 0,0023 \\
##			4 & 1,14 & 0,29 &  30,4 & 0,0033 \\
##			5 &	2,02 & 0,23 & 33,1 & 0,0048	 \\
##			6 & 3,25 & 0,20 & 35,1 & 0,0065 \\
##			0 & 4,25 & 0,16 & 33,0 & 0,0070 \\
##			\hline
##		\end{tabular}
##	}
##	\caption{Проверка соотношения Швайдлера. Мейер-Регенер, 1908 г.  \cite{MeyerRegener1908}}
##	\label{tab:ErrorSchweidlerEstimation2}
##\end{table}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Data = [
1   0.04   1.28   25.6   0.0005 ;
2  	0.22   0.57   26.7   0.0013	 ;
3   0.58   0.38   29.2   0.0023 ;
4   1.14   0.29    30.4   0.0033 ;
5  	2.02   0.23   33.1   0.0048	 ;
6   3.25   0.20   35.1   0.0065 ;
0   4.25   0.16   33.0   0.0070
]

Exp = Data(:,4)

for ii = 1: length(Exp)
  ExpErr (ii) = sqrt(Exp(ii))
end
ExpInt = midrad( Exp , ExpErr')


figure
hold on
h1 = plot(1:length(Exp), Exp ,  "sr")
h2 = errorbar(1:length(Exp), Exp , rad(ExpInt), ".r")
set (h2, 'linewidth', 2);
set (h2, 'color', RoyalMail);


set(gca, 'fontsize', 16)
grid on

lgd12 = legend([h3 h4 ], ...
  {'Calc', 'Exp'})
set(lgd12, 'location', 'north')
set(lgd12, 'fontsize', 16)

xlabel('N')
ylabel('Rel. coeff')

figure_name_out=strcat('1908 MeyerRegener','-','Rel. coeff','.png')
print('-dpng', '-r300', figure_name_out), pwd
