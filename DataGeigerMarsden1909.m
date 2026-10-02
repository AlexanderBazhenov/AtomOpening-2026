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


% 2026-09-29


pkg load interval

OxfordBlue = [0, .33, .71]
RoyalMail = 4.58*[0.218, .032, 0.042]
Pantone = 3*[0.128, 0.140, 0.036]

% 2026-09-28
% Гейгер-Марсден 1909 г.
##\begin{table}[h]
##	\centering
##	{\small
##		\begin{tabular}{|c|c|c|c|}
##			\hline
##			Metal & Atomic weight & $z$ & $z / A^{3/2}$ \\
##			\hline
##			Lead & 207 & 62 & 208 \\
##			Gold &197 & 67 & 242 \\
##			Platinum & 195 & 63 & 232 \\
##			Tin &119 & 34 & 226\\
##			Silver & 108 & 27 & 241\\
##			Copper & 64 & 14.5 & 225\\
##			Iron & 56 & 10.2 & 250\\
##			Aluminium & 27 & 3.4 & 243\\
##			\hline
##			\multicolumn{3}{|c|}{} & Average  233\\
##			\hline
##		\end{tabular}
##	}
##	\caption{Рассеяние $\alpha$-частиц на различных металлах. Гейгер-Марсден 1909 г. \cite{GeigerMarsden1909}}
##	\label{tab:ScintMetals1909}
##\end{table}




Data =  [
207  62  208 ; ##			Lead
197 67  242 ;  ##			Gold
195  63  232 ;  ##			Platinum
119  34  226;  ##			Tin
108  27  241;  ##			Silver
64  14.5  225;  ##			Copper
 56  10.2  250; ##			Iron
27  3.4  243 ##			Aluminium
]

A = Data(:,1)
Z = Data(:,2)

for ii = 1: length(Data)
  AZ(ii) = A(ii)/Z(ii)
end

accuracy = [1 1 1 1 1 0.1 0.1 0.1]

Zint = midrad(Z, accuracy')
for ii = 1: length(Data)
  AZint(ii) = A(ii)/Zint(ii)
end

err =rad(AZint)
num = 1: length(Data)
val = mid(AZint)

figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5 length(Data)+0.5])
xlabel('# вещества')
ylabel('A/N')



figure_name_out=strcat('1909 GeigerMarsden AdivN','.png')
print('-dpng', '-r300', figure_name_out), pwd

