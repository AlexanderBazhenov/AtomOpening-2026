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

OxfordBlue = [0, .33, .71]
RoyalMail = 4.58*[0.218, .032, 0.042]
Pantone = 3*[0.128, 0.140, 0.036]

##\begin{table}[!h]
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|}
##			\hline
##			Год & Автор(ы) & $e, \times 10^{-10}$ \\
##			\hline
##			1901 & M. Plank \cite{Planck1901} & 4.69 \\
##			\hline
##			1904 & J. Townsend \cite{Townsend1903} & 3.0 \\
##			1903 & J.J. Thomson \cite{Thomson1903} & 3.4 \\
##			1903  & H.A.Wilson \cite{Wilson1903} & 3.1 \\
##			1908  & R.A.Millikan, L. Begeman \cite{Millikan1908}  & 4.06 \\
##			\hline
##			1908  & E.Rutherford, H. Geiger \cite{Rutherford1908H2} & 4.65 \\
##			\hline
##		\end{tabular}
##	}
##	\caption{Данные величине $e$}
##	\label{tab:NegCharge22}
##\end{table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataAlphaCharge = [
1901  4.69 ;
1903  3.4 ;
1903  3.1 ;
1904  3.0;
1908  4.06 ;
1908  4.65
]


err = [0.01 0.1 0.1 0.1 0.01 0.01]
num = DataAlphaCharge(:,1)
val = DataAlphaCharge(:,2)

figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 1);
set (h1, 'color', OxfordBlue);

set(gca, 'fontsize', 16)
grid on

xlim([ min(num)-0.5  max(num)+0.5 ])
xticks([ min(num)-1 : max(num)+1 ])
xlabel('# Год измерений - расчетов')
ylabel('Значение 10(^10}')

textnow = strcat(' Планк ')
max(val)
ht = text(1901+0.5, max(val), textnow);
set (ht, "FontSize", 16);

textnow = strcat(' Резерфорд')
ht = text(1908-2, max(val), textnow);
set (ht, "FontSize", 14);
textnow = strcat(' Гейгер')
ht = text(1908-2, max(val)-0.1, textnow);
set (ht, "FontSize", 14);

figure_name_out=strcat('1908 RutherfordGeigerAlphaCharge','.png')
print('-dpng', '-r300', figure_name_out), pwd

