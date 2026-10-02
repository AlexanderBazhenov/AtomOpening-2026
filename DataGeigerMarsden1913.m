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
##	\centering
##	{\small
##		\begin{tabular}{|c|c|c|c|c|c|c|}
##			\hline
##			 \multicolumn{4}{|c|}{Scintillations per minute}   ;%
##			\cline{1-5}
##			Angle  Without  With  Corrected  Corrected  $\frac{1}{\sin^4 \phi/2}$  $N \times \sin^4 \phi/2$ ;%
##			$\phi$  foil  foil  for effect  for decay,   ;%
##			   without foil  N   ;%
##			\hline
##			150  0.2  4.95  4.75  6.95  1.15  6.0 ;%
##			135  2.6  8.3  5.7  8.35  1.38  6.1 ;%
##			120  3.8  10.3  6.5  9.5  1.79  5.3 ;%
##			105  0.6  10.6  10.0  14.6  2.53  5.8;%
##			75  0.0  28.6  28.6  41.9  7.25  5.8;%
##			60  0.3  69.2  68.9  101  16.0  6.3 ;%
##			\hline
##		\end{tabular}
##	}
##	\caption{Изменение рассеяния в зависимости от угла. (Пример
##		серии измерений.) Серебряная фольга. \cite{GeigerMarsden1913}}
##	Время, прошедшее с момента заполнения  трубки c эманацией, 51 час. Поправка
##	на распад, 0,683.
##	\label{tab:GeigerMarsden1913TableI2}
##\end{table}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Data = [
			150  0.2  4.95  4.75  6.95  1.15  6.0 ;
			135  2.6  8.3  5.7  8.35  1.38  6.1 ;
			120  3.8  10.3  6.5  9.5  1.79  5.3 ;
			105  0.6  10.6  10.0  14.6  2.53  5.8 ;
			75  0.0  28.6  28.6  41.9  7.25  5.8 ;
			60  0.3  69.2  68.9  101  16.0  6.3
]

Angle = Data(:,1)
N = Data(:,5)
figure
hold on
h1 = plot(Angle, N,"sb");
h2 = plot(Angle, N,"-b");

set(gca, 'fontsize', 16)
grid on

xlabel('Угол \phi')
ylabel('Счет \alpha частиц')

figure_name_out=strcat('1913 GeigerMarsden','AngleCountEx','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

errx = 7.5 * ones(length(N),1)
erry = [3 3 3 4 7 10]
num = Angle
val = N

figure
errorbar(num, val, errx, errx, erry, erry, "#~>-*")

xlabel('Угол \phi')
ylabel('Счет \alpha частиц')

figure_name_out=strcat('1913 GeigerMarsden','AngleCountEx','Err','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AngleInt = midrad(Angle, erry')
Nint = midrad(N, errx)
for ii = 1: length(N)
  NAint (ii) = Nint(ii)* (sin( pi * Angle(ii) / 2/180))^4
end

figure
errorbar(num, mid(NAint), erry, erry, ".b")

set(gca, 'fontsize', 16)
grid on

xlabel('Угол \phi')
ylabel('N sin^4 (\phi/2) ')

figure_name_out=strcat('1913 GeigerMarsden','AngleCountEx','RutherfordEq','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[h!]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|c|}
##			\hline
##			I  II  III  IV  V  VI ;%
##			\cline{3-6}
##			  \multicolumn{2}{c|}{Silver}  \multicolumn{2}{c|}{Gold} ;%
##			\hline
##			Angle of    Number of   Number of  ;%
##			deflexion,  $\frac{1}{\sin^4 \phi/2}$  scintillations,  $\frac{N}{\sin^4 \phi/2}$   scintillations,  $\frac{N}{\sin^4 \phi/2}$ ;%
##			$\phi$   N   N  ;%
##			\hline
##			150  1.15  22.2  19.3  33.1  28.8 ;%
##			135  1.38  27.4  19.8  43.0  31.2 ;%
##			120  1.79  33.0  18.4  51.9  29.0 ;%
##			105  2.53  47.3  18.7  69.5  27.5 ;%
##			75  7.25  136  18.8  211  29.1 ;%
##			60  16.0  320  20.0  477  29.8 ;%
##			45  46.6  989  21.2  1435  30.8 ;%
##			37.5  93.7  1760  18.8  3300  35.3 ;%
##			30  223  5260  23.6  7800  35.0 ;%
##			22.5  690  20300  29.4  27300  39.6 ;%
##			15  3445  105400  30.6  132000  38.4 ;%
##			  ;%
##			30  223  5.3  0.024  3.1  0.014 ;%
##			22.5  690  16.6  0.024  8.4  0.012 ;%
##			15  3445  93.0  0.027  48.2  0.014 ;%
##			10  17330  508  0.029  200  0.0115 ;%
##			7.5  54650  1710  0.031  607  0.011 ;%
##			5  276300  \ldots  \ldots  3320  0.012 ;%
##			\hline
##		\end{tabular}
##	}
##	\caption{Изменение рассеяния в зависимости от угла. (избранные результаты) \cite{GeigerMarsden1913}}
##	\label{tab:GeigerMarsden1913TableII2}
##\end{table}

Data = [
			150  1.15  22.2  19.3  33.1  28.8 ;
			135  1.38  27.4  19.8  43.0  31.2 ;
			120  1.79  33.0  18.4  51.9  29.0 ;
			105  2.53  47.3  18.7  69.5  27.5 ;
			75  7.25  136  18.8  211  29.1 ;
			60  16.0  320  20.0  477  29.8 ;
			45  46.6  989  21.2  1435  30.8 ;
			37.5  93.7  1760  18.8  3300  35.3 ;
			30  223  5260  23.6  7800  35.0 ;
			22.5  690  20300  29.4  27300  39.6 ;
			15  3445  105400  30.6  132000  38.4 ;
	%
      30  223  5.3  0.024  3.1  0.014 ;
			22.5  690  16.6  0.024  8.4  0.012 ;
			15  3445  93.0  0.027  48.2  0.014 ;
			10  17330  508  0.029  200  0.0115 ;
			7.5  54650  1710  0.031  607  0.011 ;
			5  276300  NaN  NaN  3320  0.012
]

dat1 = [1:11]
dat2 = [12:17]

Angle = Data(:,1)
NAg = Data(:,3)
NAu = Data(:,5)

figure
hold on
h1 = semilogy(Angle(dat1), NAg(dat1),"-b");
h2 = semilogy(Angle(dat1), NAu(dat1),"-r");;

set(gca, 'fontsize', 16)
grid on

xlim([ 10 160 ])
ylim([ 10 2*10^5 ])
xlabel('\phi')
ylabel('lg N')

lgd12 = legend([h1 h2 ], ...
  {'Ag', 'Au'})
set(lgd12, 'location', 'north')
set(lgd12, 'fontsize', 16)

figure_name_out=strcat('1913 GeigerMarsden','Angle15Count', ' Ag', ' Au','.png')
print('-dpng', '-r300', figure_name_out), pwd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Angle = Data(:,1)
NAg = Data(:,3)
NAu = Data(:,5)

for ii = dat1
  NAgRel (ii) = NAg(ii)* (sin( pi * Angle(ii) / 2/180))^4;
  NAuRel (ii) = NAu(ii)* (sin( pi * Angle(ii) / 2/180))^4;
end

figure
hold on
h1 = plot(Angle(dat1), NAgRel, 'sb')
h2 = plot(Angle(dat1), NAuRel, 'sr')
lgd12 = legend([h1 h2 ], ...
  {'Ag', 'Au'})
set(lgd12, 'location', 'north')
set(lgd12, 'fontsize', 16)

xlim([ 10 160 ])
xlabel('\phi')
ylabel('lg N')

set(gca, 'fontsize', 16)
grid on

xlabel('Угол \phi')
ylabel('N sin^4 (\phi/2) ')

figure_name_out=strcat('1913 GeigerMarsden','AngleCount','RutherfordEq',' Ag', ' Au','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##		\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|c|}
##			\hline
##			I  II  III  IV  V  VI ;%
##			   Total number  Number $N$ of     ;%
##			 Air equivalent  of scintillations scintillations      ;%
##			Substance   of foils counted for  at the same angle    $A^{3/2}$    $\frac{N}{A^{3/2}}$ ;%
##			 used  each substance  and for the same     ;%
##			      air equivalent     ;%
##			\hline
##			Gold     .52,  .68    1200  2400   2770  .85  ;%
##			Platinum     .54,  .625    1000  2900   2730  1.05  ;%
##			Tin    .51,  1.15    1400  1290   1300  .99  ;%
##			Silver     .38,  .435    600  1060   1120  .95  ;%
##			Copper   .495,  .61    1300  570   507  1.12  ;%
##			Aluminium     .45,  .52, 1.06    1600  151   144  1.05  ;%
##			Carbon     .55,  .57    400  57  41.6  1.37  ;%
##			\hline
##		\end{tabular}
##	}
##	\caption{Зависимость рассеяния от атомного веса. (Результаты получены с использованием излучения радия.)	\cite{GeigerMarsden1913}}
##	\label{tab:GeigerMarsden1913TableVI2}
##\end{table}

Data = [
 .52,  .68    1200  2400   2770  .85  ;% 						Gold
 .54,  .625    1000  2900   2730  1.05  ;%			Platinum
.51,  1.15    1400  1290   1300  .99  ;% 						Tin
.38,  .435    600  1060   1120  .95  ;%  			Silver
  .495,  .61    1300  570   507  1.12  ;% 						Copper
 .45,  .52   1600  151   144  1.05  ;% 	 			Aluminium
.55,  .57    400  57  41.6  1.37  ;% 				Carbon
]

N = Data(:,4)
A32 = Data(:,5)

for ii = 1:length(N)
  errN(ii) = sqrt(N(ii))
end

Nint = midrad(N, errN')

for ii = 1:length(N)
  NA32int (ii) = Nint(ii) / A32(ii);
end

for ii = 1:length(N)
  A (ii) = round((A32(ii))^(2/3));
end

figure
hold on
h1 = errorbar(A, mid(NA32int), 2*rad(NA32int), "sb")
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

xlabel('A')
ylabel('N/A^{3/2}')

set(gca, 'fontsize', 16)
grid on

figure_name_out=strcat('1913 GeigerMarsden','AtomicWeightConst','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##		\begin{table}[!h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|}
##			\hline
##			I.  II. III. IV. V. ;%
##			 Range $R$ of   ;%
##			Number of  $\alpha$-particles Relative  Number $N$  ;%
##			sheets of  after leaving  values of  scintillations    $N v^4$ ;%
##			mica  mica   $1/v^4$  per minute   ;%
##			\hline
##			0   5.5  1.0  24.7  25 ;%
##			1   4.76  1.21  29.0  24 ;%
##			2   4.05  1.50  33.4  22 ;%
##			3   3.32  1.91  44  23 ;%
##			4   2.51  2.84  81  28 ;%
##			5   1.84  4.32  101  23 ;%
##			6   1.04  9.22  255  28 ;%
##			\hline
##		\end{tabular}
##	}
##	\caption{Изменение рассеяния в зависимости от скорости. Table VII. Гейгер-Марсден 1913 г. \cite{GeigerMarsden1913}}	\label{tab:VelocityTableVII2}
##\end{table}

Data = [
			0   5.5  1.0  24.7  25 ;%
			1   4.76  1.21  29.0  24 ;%
			2   4.05  1.50  33.4  22 ;%
			3   3.32  1.91  44  23 ;%
			4   2.51  2.84  81  28 ;%
			5   1.84  4.32  101  23 ;%
			6   1.04  9.22  255  28
]

N = Data(:,4)
v4 = Data(:,3)

for ii = 1:length(N)
  errN(ii) = sqrt(N(ii))
end

Nint = midrad(N, errN')

for ii = 1:length(N)
  Nv4 (ii) = Nint(ii) / v4(ii);
end

for ii = 1:length(N)
  A (ii) = round((Nv4(ii))^(2/3));
end

figure
hold on
h1 = errorbar(v4, mid(Nv4), rad(Nv4), "sb")
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

xlabel('1/v^4')
ylabel('N/v^4')

set(gca, 'fontsize', 16)
grid on

figure_name_out=strcat('1913 GeigerMarsden','Nv4','.png')
print('-dpng', '-r300', figure_name_out), pwd

