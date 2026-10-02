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



##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##
##\begin{table}[!h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|}
##			\hline
##			I.  II.  III. ;
##			Calculated number			 Observed number  Ratio of observed;
##			of	$\alpha$-particles per	minute	 scintillations per minute    to calculated number ;
##			\hline
##			39  31  0.80 ;
##			38  49  1.29 ;
##			34  29  0.85 ;
##			32  31  0.97 ;
##			28  27  0.96 ;
##			27  28  1.04 ;
##			25  21  0.84 ;
##			23  25  1.09 ;
##			21  21  1.00 ;
##			\hline
##			\multicolumn{2}{|c|}{Total number = 294}  Average = .0.99 ;
##			\hline
##		\end{tabular}
##	}
##	\caption{Данные измерения числа альфа-частиц сцинтилляционным методом \cite{Rutherford1908H1}}
##	\label{tab:AlphaCountZnS}
##\end{table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DataAlphaScintillations = [
			39  31  0.80 ;
			38  49  1.29 ;
			34  29  0.85 ;
			32  31  0.97 ;
			28  27  0.96 ;
			27  28  1.04 ;
			25  21  0.84 ;
			23  25  1.09 ;
			21  21  1.00
]

Calc = DataAlphaScintillations(:,1)
Exp = DataAlphaScintillations(:,2)


for ii = 1: length(DataAlphaScintillations)
  RationExpTh(ii) = Exp(ii)/Calc(ii)
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
accuracy = 1
accuracy = 5
Calcint = midrad(Calc, accuracy)
Expint = midrad(Exp, accuracy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for ii = 1: length(DataAlphaScintillations)
  RationExpThint(ii) = Expint(ii)/Calcint(ii)
end

err =rad(RationExpThint)
num = 1: length(DataAlphaScintillations)
val = mid(RationExpThint)

figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5 length(DataAlphaScintillations)+0.5])
xlabel('# измерений')
ylabel('Отношение эксперимент / расчет')

textnow = strcat(' Точность =', num2str(accuracy))
max(sup(RationExpThint))
ht = text(length(DataAlphaScintillations)/2, max(sup(RationExpThint)), textnow);
set (ht, "FontSize", 16);

figure_name_out=strcat('1908 RutherfordGeigerAlphaScintillations','-',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd

