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

##\begin{table}[!h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|}
##			\hline
##			1. & 2 & 3. & 4. & 5. \\
##			\hline
##			Distance $r$ & Time of & \multicolumn{2}{c|}{Number $n$ of scintillations per minute} & \\
##			\cline{3-4}
##			from centre  & observation in & & & $2\pi rn$ \\
##			in mm & after expansion &  Observed & Corrected for decay & \\
##			\hline
##			4.6 & 7 & 3.3 & 3.4 & 98 \\
##			3.6 & 16 &  8.5 & 9.4 & 212 \\
##			2.6 & 24 & 16.1 & 19.4 & 316 \\
##			1.6 & 38 & 22.1 & 33.0 & 330 \\
##			0.8 & 49 & 27.2 & 49.3 & 247 \\
##			(centre) &  58 & 25.2 & 55.0 & 55 \\
##			\hline
##			\multicolumn{5}{c}{Whole number of scintillations counted in this experiment = 803}
##		\end{tabular}
##	}
##	\caption{Данные по числу сцинтилляций альфа-частиц \cite{Geiger1910}}
##	\label{tab:AlphaScintData2}
##\end{table}


Data = [
			4.6  7  3.3  3.4  98 ;
			3.6  16   8.5  9.4  212 ;
			2.6  24  16.1  19.4  316 ;
			1.6  38  22.1  33.0  330 ;
			0.8  49  27.2  49.3  247 ;
			0.0   58  25.2  55.0  55
]

L = Data(:,1)
N = Data(:,5)




num = L
val = N

figure
hold on
h1 = plot(num, val, "sb");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5+min(L) max(L)+0.5])
xlabel('Расстояние от центра, мм')
ylabel('Счет \alpha частиц')



figure_name_out=strcat('1910 Geiger','-','Angles scattering','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[!h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|c|}
##			\hline
##			1.&  2.& 3.& 4.& 5.& 6. \\
##			\hline
##			Scattering & Atomic & Scattering & & Relative atomic & \\
##			material. & weight, A. & coefficient, $K$ &  $K/\sqrt{A}$ & scattering & $\frac{K_0}{A} \times 10^2$ \\
##			~ & &  & &coefficient, $K_0$. &\\
##			\hline
##			Gold & 197& 2.1 & 0.150 & 1.00 & 0.51  \\
##			Tin & 119 & 1.5 & 0.138 & 0.56 & 0.47 \\
##			Silver & 108 & 1.5 & 0.144 & 0.53 & 0.49 \\
##			Copper&  64 & 1.1 & 0.138 &  0.30 & 0-47 \\
##			Aluminium & 27 & 0.6 & 0.115 & 0.106 & 0.39 \\
##			\hline
##
##		\end{tabular}
##	}
##	\caption{Данные по рассеянию альфа-частиц  на различных металлах \cite{Geiger1910}}	\label{tab:AlphaScattMetals2}
##\end{table}


Data = [
 197 2.1  0.150  1.00  0.51  ; %					Gold
119  1.5  0.138  0.56  0.47 ; %			Tin
108  1.5  0.144  0.53  0.49 ; %			Silver
64  1.1  0.138   0.30  0-47 ; %				Copper
27  0.6  0.115  0.106  0.39  % 			Aluminium
]


err = 0.1* Data(:,3)
num = 1: length(Data(:,1))
val = Data(:,3)

figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5+min(num) max(num)+0.5])
xlabel('# вещества')
ylabel('Константа K/ \sqrt(A)')


figure_name_out=strcat('1910 Geiger','-','K metals','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[!h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|}
##			\hline
##			1.&  2.& 3.& 4.& 5. \\
##			\hline
##			& & & Relative& \\
##			Sheets interposed in &  Range. & Velocity, & scattering & $K \times V^3$ \\
##			addition to mica window. && V. & coefficient,&  \\
##			& & &  $K$ & \\
##			\hline
##			(Mica window alone) & 5.60 & 0.92 & 0.15 & 0.12 \\
##			Sheet of aluminium & 4.00 & 0.82 & 0.18 & 0.10 \\
##			„ mica&  3.40 & 0.78  & 0.18 & 0.08 \\
##			„ aluminium & 2.21 & 0.67 & 0.35 & 0.11 \\
##			„ mica &  2.21 & 0.67 &  0.38 & 0.11 \\
##			» » & 1.20 & 0.55  & 0.75 & 0.12 \\
##			„ aluminium & 0.89 & 0.48 & 1.27 & 0.14 \\
##			\hline
##		\end{tabular}
##	}
##	\caption{Относительное рассеяние в зависимости от скорости $\alpha$-частиц  \cite{Geiger1910}}	\label{tab:AlphaScattVelocity2}
##\end{table}

Data = [
5.60  0.92  0.15  0.12 ; %	##			(Mica window alone)
4.00  0.82  0.18  0.10 ; % ##			Sheet of aluminium
3.40  0.78   0.18  0.08 ; % ##			„ mica
2.21  0.67  0.35  0.11 ; % ##			„ aluminium
2.21  0.67   0.38  0.11 ; % ##			„ mica
1.20  0.55   0.75  0.12 ; % ##			» »
0.89  0.48  1.27  0.14 ; %
]

accuracy = 0.1
accuracy = 0.3

err = accuracy * Data(:,4)
num = 1: length(Data(:,4))
val = Data(:,4)

figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

textnow = strcat(' Точность =', num2str(accuracy))
max(Data(:,4)+accuracy)
       ht = text( min(num), max(Data(:,4)*(1+accuracy)), textnow);
       set (ht, "FontSize", 16);


set(gca, 'fontsize', 16)
grid on

xlabel('# вещества')
ylabel('K \times V^3')

textnow = strcat(' Accuracy =', num2str(accuracy))


figure_name_out=strcat('1910 Geiger','-','K V3',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd





