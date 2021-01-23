%clc
%clear all
%% construccion de un FIS por comandos
% Creacion de la variable que almacena el sistema difuso
fis1 = newfis('BioreactorSugeno','sugeno');%SUGENO

%% Definicion y creacion de los conjuntos difusos del error
fis1 = addvar(fis1,'input','error',[-1 1]); 
fis1 = addmf(fis1,'input',1,'muy_neg','trapmf',[-1 -1 -2/3 -1/3]);
fis1 = addmf(fis1,'input',1,'neg','trimf',[-2/3 -1/3 0]);
fis1 = addmf(fis1,'input',1,'cero','trimf',[-1/3 0 1/3]);
fis1 = addmf(fis1,'input',1,'pos','trimf',[0 1/3 2/3]);
fis1 = addmf(fis1,'input',1,'muy_pos','trapmf',[1/3 2/3 1 1]);

%% Definicion y creacion de los conjuntos difusos de  la derivada del error
fis1 = addvar(fis1,'input','derivada_error',[-1 1]);
fis1 = addmf(fis1,'input',2,'muy_neg','trapmf',[-1 -1 -2/3 -1/3]);
fis1 = addmf(fis1,'input',2,'neg','trimf',[-2/3 -1/3 0]);
fis1 = addmf(fis1,'input',2,'cero','trimf',[-1/3 0 1/3]);
fis1 = addmf(fis1,'input',2,'pos','trimf',[0 1/3 2/3]);
fis1 = addmf(fis1,'input',2,'muy_pos','trapmf',[1/3 2/3 1 1]);

%% SUGENO
fis1 = addvar(fis1,'output','accion',[-1 1]);
fis1 = addmf(fis1,'output',1,'accion_muy_pequeña','constant',[-2/3]);%1
fis1 = addmf(fis1,'output',1,'accion_pequeña','constant',[-1/3]);%2
fis1 = addmf(fis1,'output',1,'accion_constante','constant',[0]);%3
fis1 = addmf(fis1,'output',1,'accion_grande','constant',[1/3]);%4
fis1 = addmf(fis1,'output',1,'accion_muy_grande','constant',[2/3]);%5

%% Defincion de las reglas
rulelist = [1 1 1 1 1               % input1 input2 output W conector => 1=and;2=OR 
            1 2 1 1 1%2
            1 3 1 1 1
            1 4 2 1 1
            1 5 3 1 1
            
            2 1 1 1 1%6
            2 2 2 1 1
            2 3 2 1 1
            2 4 2 1 1
            2 5 2 1 1%10
            
            3 1 4 1 1%11
            3 2 3 1 1
            3 3 3 1 1
            3 4 3 1 1 
            3 5 2 1 1%15
            
            4 1 4 1 1%16
            4 2 4 1 1
            4 3 4 1 1
            4 4 4 1 1
            4 5 5 1 1%20
            
            5 1 3 1 1%21
            5 2 4 1 1
            5 3 5 1 1
            5 4 5 1 1
            5 5 5 1 1];
fis1 = addrule(fis1,rulelist);
fuzzy(fis1);
%fis = readfis('BioreactorSugeno.fis')
