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


%\begin{table}[h]
##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##%	\centering
##%	{\scriptsize
##%		\begin{tabular}{|c||c|c|c|c|c|c|c|c|c|c|c|c|c|c|c|c|c|c|c||c|c||c}
##%			\hline
##%No. of & 0 & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 & 11 & 12 & 13 & 14 & No. of\\
##%$\alpha$ &&&&&&&&&&&&&&&&&&&&&& $\alpha$ \\
##%\hline
##%$\vdots$ &&&&&&&&&&&&&&&&&&&&&& $\vdots$ \\
##%\hline
##%Sum & 57& 203 & 383 & 525& 532 & 408& 273& 139& 45& 27& 10& 4 & 0& 1 & 1 & 10097\\
##%			\hline
##%Sum & 54& 210 & 407 & 525& 508 & 394& 254& 140& 68& 29& 11& 4 & 1& 4 & 1 & \\
##%		\hline
##%		\end{tabular}
##%	}
##%	\caption{Результаты измерений Table I. Резерфорд и Гейгер, 1910 г. \cite{Rutherford1910}}
##%	\label{tab:1910 Rutherford Geiger Table I2}
##%\end{table}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Data = [
 57  203   383   525  532   408  273  139  45  27  10  4   0  1   1  ;
 54  210   407   525  508   394  254  140  68  29  11  4   1  4   1
]


Calc = Data(2,:)
Exp = Data(1,:)

figure
hold on
h1 = plot(1:length(Calc), Calc, 'sb')
h2 = plot(1:length(Calc), Exp, 'sr')
h3 = plot(1:length(Calc), Calc, '-b')
h4 = plot(1:length(Calc), Exp, '-r')

set(gca, 'fontsize', 16)
grid on

lgd12 = legend([h1 h2 ], ...
  {'Calc', 'Exp'})
set(lgd12, 'location', 'northeast')
set(lgd12, 'fontsize', 16)

xlim([0 16])

ylabel('Число групп')
xlabel('Число отсчетов в группе')


figure_name_out=strcat('1910 RutherfordGeigerBateman','-','Intervals','.png')
print('-dpng', '-r300', figure_name_out), pwd

SumN =10097
SumInt = sum(Exp)
lambda = SumN/SumInt
for nn=1:15
  P(nn) = lambda^(nn-1)*e^(-lambda)/factorial(nn-1)
end
CalcPoisson = P*SumInt

for ii = 1:15
  Delta2 (ii) = (Calc(ii)-Exp(ii))^2
  delta (ii) = Delta2(ii)/Calc(ii)
end
Chi2 = sum(delta)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##		\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|}
##			\hline
##			Duration of interval			& \multicolumn{2}{|c|}{} \\
##			between successive			& \multicolumn{2}{|c|}{Number of intervals } \\
##			\cline{2-3}
##			scintillations, seconds			& Experimental.  & Calculated.\\
##			\hline
##			0.0 to 1.0 & 3106& 3059 \\
##			1.0 to 2.0 & 1763 & 1822 \\
##			2.0 to 3.0 & 1115 & 1085 \\
##			3.0 to 4.0 & 658 & 646 \\
##			4.0 to 5.0 & 389 & 385 \\
##			5.0 to 6.0 & 206 & 229 \\
##			6.0 to 7.0 & 130 & 136 \\
##			7.0 to 8.0 & 86 & 81 \\
##			8.0 to 9.0 & 42 & 48 \\
##			9.0 to infinity & 68 & 71 \\
##			\hline
##		\end{tabular}
##	}
##	\caption{Число групп интервалов по данным Резерфорда и Гейгера \cite{Rutherford1910}. Марсден и Барратт, 1911 г. \cite{MarsdenBarrat1911}}
##	\label{tab:IntervalCounts22}
##\end{table}

Data = [
0.0   1.0   3106  3059  ;
1.0   2.0   1763   1822  ;
2.0   3.0   1115   1085  ;
3.0   4.0   658   646  ;
4.0   5.0   389   385  ;
5.0   6.0   206   229  ;
6.0   7.0   130   136  ;
7.0   8.0   86   81  ;
8.0   9.0   42   48  ;
9.0   20   68   71
]
Calc = Data(:,4)
Exp = Data(:,3)

for ii = 1:length(Calc)
  Delta2 (ii) = (Calc(ii)-Exp(ii))^2
  delta (ii) = Delta2(ii)/Calc(ii)
end
Chi2 = sum(delta)
