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
##		\begin{tabular}{|l|c|c|c|c|c|}
##			\hline
##			& I. & II.&  III. & IV. & Ratio IV./III. \\
##			\hline
##			Gold & .0121 & .00396 & 3.05 & 14.2 & 4.65 \\
##			Platinum & .00633 & .00192& 3.29 & 14.0 & 4.25\\
##			Tin & .0051 & .00212 & 2.41 & 10.85 & 4.50\\
##			Silver & .00967 &  .00402 & 2.41 & 10.4 & 4.30\\
##			Copper & .00873 & .00492 & 1.78 & 7.96 & 4.45\\
##			Aluminium & .00258 & .00209 & 1.23 &  5.15 & 4.20\\
##			\hline
##		\end{tabular}
##	}
##	\caption{Данные по тормозной  способности разных веществ \cite{Bragg1905}}
##	\label{tab:DensityThick2}
##\end{table}


DataBragg = [
.0121 .00396 3.05 14.2 4.65;
.00633 .00192 3.29 14.0 4.25 %;
.0051 .00212 2.41 10.85 4.50;
.00967  .00402 2.41 10.4 4.30;
.00873 .00492 1.78 7.96 4.45;
.00258 .00209 1.23  5.15 4.20
]

T = DataBragg(:,1)
I = DataBragg(:,2)

for ii = 1: length(DataBragg)
  TI(ii) = T(ii)/I(ii)
end

accuracy = 0.01
accuracy = 0.02
accuracy = 0.03
accuracy = 0.05

Tint = midrad(T, accuracy*T)
Iint = midrad(I, accuracy*I)
for ii = 1: length(DataBragg)
  TIint(ii) = Tint(ii)/Iint(ii)
end

for ii = 1: length(DataBragg)
  TIint(ii) = DataBragg(ii,4)/TIint(ii)
end

err =rad(TIint)
num = 1: length(DataBragg)
val = mid(TIint)

figure
hold on
h1 = errorbar (num, val, err,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5 length(DataBragg)+0.5])
xlabel('# вещества')
ylabel('Константа закона')

textnow = strcat(' Точность =', num2str(accuracy))
max(sup(TIint))

       ht = text(3, max(sup(TIint)), textnow);
       set (ht, "FontSize", 16);

figure_name_out=strcat('BraggConst','-',textnow,'.png')
print('-dpng', '-r300', figure_name_out), pwd

