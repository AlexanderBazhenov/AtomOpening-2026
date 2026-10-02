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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|}
##			\hline
##			 Assumed  \multicolumn{2}{c|}{Relative scattering per atom};%
##			Gas  value of $n$  Calculated values  Experimental values ;%
##			\hline
##			H atoms  1  0.0190  0.0176 ;%
##			He   2  0.057  0.064 ;%
##			C  6  0.40  0.40 ;%
##			N  7   0.53  0.48 ;%
##			O  8  0.69  0.53 ;%
##			S  16  2.58  1.61 ;%
##			\hline
##		\end{tabular}
##	}
##	\caption{Рассеяние $\alpha$-частиц на различных газах. Резерфорд и Неттол 1913 г.  \cite{RutherfordNuttall1913}}
##	\label{tab: Rutherford Nuttol 19132}
##\end{table}


Data = [
 1  0.0190  0.0176 ;% 	H atoms
 2  0.057  0.064 ;%			He
 6  0.40  0.40 ;%			C
 7  0.53  0.48 ;% 			N
 8  0.69  0.53 ;% 			O
 16 2.58  1.61 %			S
]

Ne = Data(:,1)
Calc = Data(:,2)
Exp = Data(:,3)

accuracy = 0.1
CalcInt = midrad( Calc , accuracy*Calc)
ExpInt = midrad( Exp , accuracy*Exp)

figure
hold on
h1 = plot(Ne, Calc, 'sb')
h2 = plot(Ne, Exp, 'sr')
h3 = errorbar(Ne, Calc , accuracy*Calc, ".b")
h4 = errorbar(Ne, Exp , accuracy*Exp, ".r")

set(gca, 'fontsize', 16)
grid on

lgd12 = legend([h3 h4 ], ...
  {'Calc', 'Exp'})
set(lgd12, 'location', 'north')
set(lgd12, 'fontsize', 16)

xlabel('Ne')
ylabel('Rel. coeff')

textnow = strcat(' Accuracy =', num2str(accuracy))
       ht = text(3, 0.7*max(max(Calc),max(Exp)), textnow);
       set (ht, "FontSize", 16);


figure_name_out=strcat('1913 Rutherford Nuttol','-','Rel. coeff',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd


