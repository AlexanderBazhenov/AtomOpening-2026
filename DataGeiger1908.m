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
##		\begin{table}[h]
##			\centering
##			{\small
##				\begin{tabular}{|c|c|c|}
##					\hline
##					 \multicolumn{2}{|c|}{Absolute error determined} ;%
##					\cline{2-3}
##					Intensity of   ;%
##					the radiation   Theoretically  Experimentally;%
##					$\frac{div}{min}$   ;%
##					\hline
##					4500  6.4  5.4 ;%
##					2700  4.9  4.4 ;%
##					1100  3.1  2.9 ;%
##					500  2.1  2.1 ;%
##					100  0.9  1.3 ;%
##					\hline
##				\end{tabular}
##			}
##			\caption{Теоретическая и экспериментальная вариабельность данных электрометра. Гейгер, 1908 г. \cite{Geiger1908}}
##			\label{tab:ErrorAlphaCount}
##		\end{table}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Data = [
					4500  6.4  5.4 ;%
					2700  4.9  4.4 ;%
					1100  3.1  2.9 ;%
					500  2.1  2.1 ;%
					100  0.9  1.3 %
]

N = Data(:,1)
Calc = Data(:,2)
Exp = Data(:,3)

accuracy = 0.1
CalcInt = midrad( Calc , accuracy*Calc)
ExpInt = midrad( Exp , accuracy*Exp)

figure
hold on
h1 = plot(N, Calc, 'sb')
h2 = plot(N, Exp, 'sr')
h3 = errorbar(N, Calc , accuracy*Calc, ".b")
h4 = errorbar(N, Exp , accuracy*Exp, ".r")

set(gca, 'fontsize', 16)
grid on

lgd12 = legend([h3 h4 ], ...
  {'Calc', 'Exp'})
set(lgd12, 'location', 'north')
set(lgd12, 'fontsize', 16)

xlabel('N')
ylabel('Rel. coeff')

textnow = strcat(' Accuracy =', num2str(accuracy))
       ht = text(2000, 2, textnow);
       set (ht, "FontSize", 16);


figure_name_out=strcat('1908 Geiger','-','Rel. coeff',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd
