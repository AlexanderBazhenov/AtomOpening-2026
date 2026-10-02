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
% Rutherford 1899
##		\begin{tabular}{|c|c|c|}
##			\multicolumn{3}{c}{Thickness of Metal Leaf .00008 cm} ;
##			\multicolumn{3}{c}{Layer of Uranium Oxide on plate} ;
##			\hline
##			Number of Leak per min. in Ratio for each ;
##			Layers scale-divisions layer ;
##			\hline
##			0 91 ;
##			1 77 .85 ;
##			2 60 .78 ;
##			3 49 .82 ;
##			4 42 .86 ;
##			5 33 .79 ;
##			6 24.7 .75 ;
##			8 15.4 .79 ;
##			10 9.1 .77 ;
##			13 5.8 .86 ;
##			\hline
##		\end{tabular}

pkg load interval

UO2Data =  [
			0 91;
			1  77;
			2  60;
			3  49;
      4  42;
			5  33;
			6  24.7;
			8  15.4;
			10 9.1 ;
			13  5.8
]

UO2DataErr = [1 1 1 1 1 1 0.1 0.1 0.1 0.1]


OxfordBlue = [0, .33, .71]
RoyalMail = 4.58*[0.218, .032, 0.042]
Pantone = 3*[0.128, 0.140, 0.036]
%
figure
hold on
h1 = errorbar (UO2Data(:,1), UO2Data(:,2), UO2DataErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

xlim([-.5 15 ])
xlabel('n, число фольг')
ylabel('I, отн. ед.')

figure_name_out=strcat('UO2CurrentThickness','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UO2DataRel = [
			1   .85 ;
			2   .78 ;
			3 .82 ;
			4  .86 ;
			5  .79 ;
			6     .75 ;
			8   .79 ;
			10  .77 ;
			13  .86
      ]

 UO2DataRelErr = 0.1*ones(length(UO2DataRel),1)

figure
hold on
h1 = errorbar (UO2DataRel(:,1), UO2DataRel(:,2), UO2DataRelErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);

set(gca, 'fontsize', 16)
grid on

ylim([ 0.6 1 ])
xlabel('n, число фольг')
ylabel('Пропускание, отн. ед.')

figure_name_out=strcat('UO2FoilTransparence','.png')
print('-dpng', '-r300', figure_name_out), pwd

UO2DataRelInt = midrad(UO2DataRel(:,2), UO2DataRelErr)
inf(UO2DataRelInt)
sup(UO2DataRelInt)
max(inf(UO2DataRelInt))
min(sup(UO2DataRelInt))

wedgeX = min(sup(UO2DataRelInt))-max(inf(UO2DataRelInt))
veeX = max(sup(UO2DataRelInt))-min(inf(UO2DataRelInt))
Ji = wedgeX / veeX

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|}
##			\multicolumn{3}{c}{Thickness of Aluminium foil .0005 cm} ;
##			\hline
##			Number of Layers Leak per min. in Ratio  ;
##			of Aluminium foil scale-divisions ;
##			\hline
##			0 182 ;
##			1 77 .42 ;
##			2 33 .43 ;
##			3 14.6 .82 ;
##			4 9.4 .65 ;
##			12 7     ;
##			\hline
##		\end{tabular}
##	}
##	\caption{Пропускание излучения оксида урана алюминиевыми  фольгами \cite{Rutherford1899}}
##	\label{tab:AlLeafsUO2}
##\end{table}

UO2DataAl =  [
			0 182 NaN;
			1 77 .42 ;
			2 33 .43 ;
			3 14.6 .82 ;
			4 9.4 .65;
      12 7 NaN
]

UO2DataAlErr = [1 1 1  0.1 0.1 0.1]

figure
hold on
h1 = errorbar (UO2DataAl(:,1), UO2DataAl(:,2), UO2DataAlErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);
h2 = plot(UO2DataAl(:,1), UO2DataAl(:,2), "-r");

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5 12.5 ])
xlabel('n, число фольг')
ylabel('Пропускание, отн. ед.')

figure_name_out=strcat('UO2AlFoilTransparence','.png')
print('-dpng', '-r300', figure_name_out), pwd

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|c|c|}
## \multicolumn{5}{c}{Толщина алюминиевых фольг .0005 см}		;
##			\hline
##	\multicolumn{4}{c|}{Proportionate Rate of Leak} ;
##			\hline
##	Number of  Uramium  Uramium Uramium  Uramium ;
##	layers of metal Nitrate Oxide Potassium ;
##	Aluminium foil    Sulfate;
##			\hline
##	0 1  1 1  1;
##	1 .51 .43 .42 .42 ;
##	2 .35 .28 .18 .27 ;
##	3 NaN  .17 .08 .17 ;
##	4 NaN .15 .05 .12 ;
##	5 .15 NaN NaN NaN  ;
##	12 NaN .125 .04 .11 ;
##		\hline
##		\end{tabular}
##	}
##	\caption{Пропускание излучения некоторых соединений урана алюминиевыми фольгами \cite{Rutherford1899}}
##	\label{tab:UraniumSubstances}
##\end{table}

DataSubstances = [
	0 1  1 1  1;
	1 .51 .43 .42 .42 ;
	2 .35 .28 .18 .27 ;
	3 NaN  .17 .08 .17 ;
	4 NaN .15 .05 .12 ;
	5 .15 NaN NaN NaN  ;
	12 NaN .125 .04 .11
  ]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{|c|c|c|}
##			\hline
##			\multicolumn{2}{c|}{Rate of Leak} ;
##			\hline
##			Number of layers Thin layer of   Thick layer of ;
##			of Aluminium foil Uramium Oxide  Uramium Oxide;
##			\hline
##			0 1  1;
##			1 .42 .5 ;
##			2 .18 NaN ;
##			4 .05 .12 ;
##			8 NaN .113 ;
##			12 .04 NaN ;
##			18 NaN .11 ;
##			\hline
##		\end{tabular}
##	}
##	\caption{Пропускание излучения тонких и толстых слоев оксида урана алюминиевыми фольгами \cite{Rutherford1899}}
##	\label{tab:ThinThickUO2}
##\end{table}

DataUO2AlThinThick = [
			0 1  1;
			1 .42 .5 ;
			2 .18 NaN ;
			4 .05 .12 ;
			8 NaN .113 ;
			12 .04 NaN ;
			18 NaN .11
]




DataUO2AlThinThickErr = [0.01 0.01 0.01 0.01 0.01  0.01 0.01]

figure
hold on
h1 = errorbar (DataUO2AlThinThick(:,1), DataUO2AlThinThick(:,2), DataUO2AlThinThickErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);
h2 = plot(DataUO2AlThinThick(:,1), DataUO2AlThinThick(:,2), "-r");

h3 = errorbar (DataUO2AlThinThick(:,1), DataUO2AlThinThick(:,3), DataUO2AlThinThickErr,".b");
set (h3, 'linewidth', 2);
set (h3, 'color', OxfordBlue);
h4 = plot(DataUO2AlThinThick(:,1), DataUO2AlThinThick(:,3), "-b");

set(gca, 'fontsize', 16)
grid on

xlim([ -0.5 18.5 ])
ylim([ -0.01 1.1 ])
xlabel('n, число фольг')
ylabel('Пропускание, отн. ед.')

figure_name_out=strcat('UO2AlFoilTransparenceThinThick','.png')
print('-dpng', '-r300', figure_name_out), pwd

DataUO2AlThick = [
			0 1  1;
			1 .42 .5 ;
			2 .18 NaN ;
			4 .05 .12 ;
			12 .04 NaN ;
]

DataUO2AlThin = [
			0 1  1;
			1 .42 .5 ;
			4 .05 .12 ;
			8 NaN .113 ;
			18 NaN .11
]

DataUO2AlThinThickErr = [0.01 0.01 0.01 0.01 0.01  ]

figure
hold on
h1 = errorbar (DataUO2AlThick(:,1), DataUO2AlThick(:,2), DataUO2AlThinThickErr,".b");
set (h1, 'linewidth', 2);
set (h1, 'color', RoyalMail);
h2 = plot(DataUO2AlThick(:,1), DataUO2AlThick(:,2), "-r");

h3 = errorbar (DataUO2AlThin(:,1), DataUO2AlThin(:,3), DataUO2AlThinThickErr,".b");
set (h3, 'linewidth', 2);
set (h3, 'color', OxfordBlue);
h4 = plot(DataUO2AlThin(:,1), DataUO2AlThin(:,3), "-b");

lgd12 = legend([h1 h3 ], ...
  {'Thick data', 'Thin data'})
set(lgd12, 'location', 'northeast')
set(lgd12, 'fontsize', 16)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

##\begin{table}[h]
##	\centering
##	{\footnotesize
##		\begin{tabular}{cc}
##			\hline
##Magnetic field			&  Rate of discharge \\
##between pole-pieces			&   due to a rays. \\
##			\hline
##0  &  100 \\
##3720 &  66 \\
##4840 &  50 \\
##6500 &  33 \\
##7360 &  23 \\
##8370 & 11 \\
##			\hline
##		\end{tabular}
##	}
##\caption{Скорость разряда электрометра от величины магнитного поля \cite{Rutherford1903magnetic}}
##	\label{tab:DischargeH2}
##\end{table}
