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
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##		\begin{table}[!h]
##	\centering
##	{\small
##		\begin{tabular}{|c|c|c|}
##\multicolumn{3}{c}{Table II. --- Aluminium.} \\
##\multicolumn{3}{c}{$v = 2.681 \times 10^{10}$ cm/sec} \\
##			\hline
##$\phi$ (radians)& $t_m$ (cms) & $\phi / \sqrt{t_m}$\\
##\hline
##0.20 & 0.0022 & 4.3 \\
##0.24 & 0.0033 & 4.2 \\
##0.31 & 0.0054 & 4.2 \\
##0.41 & 0.0090 & 4.2 \\
##\hline
##1.20 & 0.070 & 4.5 \\
##\hline
##		\end{tabular}
##	}
##	\caption{Табл. II. Данные  Кроутера для алюминия \cite{Crowther1910}}
##	\label{tab:TableIICrowther}
##\end{table}

Data = [
0.20  0.0022  4.3 ;
0.24  0.0033  4.2 ;
0.31  0.0054  4.2 ;
0.41  0.0090  4.2 ;
1.20  0.070  4.5
]

Phi = Data(:,1)
Tm = Data(:,2)

accuracy = 0.1/2

err = accuracy* Data(:,3)
num = 1: length(Data(:,1))
val = Data(:,3)


figure
hold on
h1 = errorbar (Phi, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

textnow = strcat(' Точность =', num2str(accuracy))
       ht = text( min(Phi), max(Data(:,3)*(1+accuracy)), textnow);
       set (ht, "FontSize", 16);


set(gca, 'fontsize', 16)
grid on

xlabel('\phi')
ylabel('\phi / sqrt (t)')

textnow = strcat(' Accuracy =', num2str(accuracy))


figure_name_out=strcat('1910 Crowther','-','PhiTm',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##
##		\begin{table}[!h]
##			\centering
##			{\small
##				\begin{tabular}{|c|c|c|c|c|c|c|}
##					\hline
##					Element &Atomic weight & $\phi / \sqrt{t_m}$  & \multicolumn{2}{c|}{$N_0$} & \multicolumn{2}{c|}{$N$/Atomic weight} \\
##					\cline{4-7}
##					& & & \eqref{AA} & \eqref{BB} & \eqref{AA} & \eqref{BB}\\
##					\hline
##					Carbon & 12 & 2.0 & 40 & 44 & 3.32 & 3.7 \\
##					Aluminium & 	27 & 4.25 & 83 & 156 & 3.07 & 5.8\\
##					Copper & 63.2 & 10.0 & 181 & 765 & 2.87 & 12.0\\
##					Silver & 108&  15.4 & 7320 & 2080 & 2.96 & 19.2 \\
##					Platinum & 194 & 29.0 & 605 & 6500 & 3.12 & 33.5  \\
##					\hline
##				\end{tabular}
##			}
##			\caption{Табл. V. Данные  Кроутера по числу электронов в атоме. Кроутер 1910 г. \cite{Crowther1910}}
##			\label{tab:TableVCrowther}
##		\end{table}

Data = [
					  12  2.0  40  44  3.32  3.7 ;% Carbon
					 	27  4.25  83  156  3.07  5.8;%  Aluminium
					  63.2  10.0  181  765  2.87  12.0;% Copper
					  108  15.4  7320  2080  2.96  19.2 ;% Silver
					 194  29.0  605  6500  3.12  33.5  % Platinum
]

accuracy = 0.1
err = accuracy* Data(:,5)
num = Data(:,1)
val = Data(:,5)


figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

xlabel('A, атомный вес')
ylabel('N / A')

textnow = strcat(' Accuracy =', num2str(accuracy))


figure_name_out=strcat('1910 Crowther','-','NA',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd



